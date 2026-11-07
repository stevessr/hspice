#!/usr/bin/env python3
"""Private source-PDF vs CI-built Typst SVG inspection; NEVER auto-accept pages.

Dependencies: pip install pymupdf pillow numpy cairosvg
Usage: python3 visual_fidelity_probe.py --pdf ./book.pdf \
  --svg-dir ./svg-from-actions --start 208 --end 220 --out ./diffs
"""
from pathlib import Path
import argparse,hashlib,io,json
def compare(ref,cand,threshold=190,tolerance=2):
    import numpy as np
    from PIL import Image,ImageFilter
    a=np.array(ref.convert("L"))<threshold
    b=np.array(cand.convert("L"))<threshold
    def expand(mask):
        if not tolerance:return mask
        im=Image.fromarray((mask.astype("uint8")*255))
        return np.array(im.filter(ImageFilter.MaxFilter(2*tolerance+1)))>0
    precision=float((b&expand(a)).sum())/max(1,int(b.sum()))
    recall=float((a&expand(b)).sum())/max(1,int(a.sum()))
    f1=2*precision*recall/(precision+recall) if precision+recall else 0.
    ink=np.full((*a.shape,3),255,dtype=np.uint8)
    ink[a&b]=(0,0,0);ink[a&~b]=(230,40,40);ink[~a&b]=(40,80,230)
    return {"precision":round(precision,5),"recall":round(recall,5),"f1":round(f1,5)},Image.fromarray(ink)
def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument("--pdf",type=Path,required=True)
    p.add_argument("--svg-dir",type=Path,required=True)
    p.add_argument("--start",type=int,default=208)
    p.add_argument("--end",type=int,default=220)
    p.add_argument("--out",type=Path,required=True)
    p.add_argument("--scale",type=float,default=1.25)
    p.add_argument("--threshold",type=int,default=190)
    p.add_argument("--tolerance",type=int,default=2)
    a=p.parse_args()
    import fitz,cairosvg
    from PIL import Image
    if not 0<a.scale<=3 or not 0<=a.tolerance<=8: p.error("invalid scale/tolerance")
    a.out.mkdir(parents=True,exist_ok=True)
    results=[]
    with fitz.open(a.pdf) as pdf:
        if len(pdf)!=445:p.error(f"Expected 445 source pages, found {len(pdf)}")
        if not 1<=a.start<=a.end<=445:p.error("range must fit PDF page count")
        for n in range(a.start,a.end+1):
            pg=pdf[n-1];w=round(pg.rect.width*a.scale);h=round(pg.rect.height*a.scale)
            pix=pg.get_pixmap(matrix=fitz.Matrix(w/pg.rect.width,h/pg.rect.height),alpha=False,colorspace=fitz.csRGB)
            source=Image.frombytes("RGB",(pix.width,pix.height),pix.samples).resize((w,h))
            stem=f"{n-23}-page-{n:03d}" if n>=26 else f"{n-19:02d}-page-{n:03d}"
            svg=a.svg_dir/(stem+".svg")
            entry={"pdf_page":n,"svg":svg.name,"full_page_accepted":False}
            if not svg.is_file():
                entry["issue"]="missing SVG";results.append(entry);continue
            png=cairosvg.svg2png(url=str(svg),output_width=w,output_height=h)
            raw=Image.open(io.BytesIO(png)).convert("RGBA")
            paper=Image.new("RGBA",(w,h),"white")
            native=Image.alpha_composite(paper,raw).convert("RGB")
            measure,diff=compare(source,native,a.threshold,a.tolerance)
            entry.update(measure);results.append(entry)
            contact=Image.new("RGB",(3*w,h),"white")
            for idx,im in enumerate([source,native,diff]): contact.paste(im,(idx*w,0))
            contact.save(a.out/f"page-{n:03d}-comparison.png",optimize=True)
            print(f"PDF {n}: optical F1={measure['f1']:.3f}; fully accepted: NO")
    with a.pdf.open("rb") as file:
        digest=hashlib.file_digest(file,"sha256").hexdigest()
    (a.out/"report.json").write_text(json.dumps({"source_pdf_sha256":digest,
      "pages":results,"full_pages_accepted":0,
      "warning":"Optical alignment is only a review diagnostic; human text/math/figure/caption/layout evidence is separately mandatory."},ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
if __name__=="__main__":main()
