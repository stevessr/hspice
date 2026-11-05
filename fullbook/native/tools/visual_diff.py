#!/usr/bin/env python3
"""Visual diagnostic for an original scanned page vs editable Typst SVG.

This does NOT certify semantic accuracy. The scanned textbook remains local.
"""
from pathlib import Path
import argparse
import json
import io

import cairosvg
import numpy as np
from PIL import Image, ImageDraw
from skimage.metrics import structural_similarity

def main():
    p=argparse.ArgumentParser()
    p.add_argument("--scan",type=Path,required=True,help="Privately held source scan")
    p.add_argument("--typst-svg",type=Path,required=True)
    p.add_argument("--output",type=Path,required=True)
    p.add_argument("--width",type=int,default=1000)
    p.add_argument("--height",type=int,default=1440)
    args=p.parse_args()
    args.output.mkdir(parents=True,exist_ok=True)
    original=Image.open(args.scan).convert("RGB").resize((args.width,args.height), Image.Resampling.LANCZOS)
    svg_png=cairosvg.svg2png(url=str(args.typst_svg),output_width=args.width,output_height=args.height)
    replica=Image.open(io.BytesIO(svg_png)).convert("RGB")
    a=np.asarray(original.convert("L").resize((500,720))).astype("uint8")
    b=np.asarray(replica.convert("L").resize((500,720))).astype("uint8")
    score=float(structural_similarity(a,b,data_range=255))
    m1=a<185
    m2=b<185
    union=int(np.count_nonzero(m1|m2))
    overlap=float(np.count_nonzero(m1&m2)/union) if union else 1.0
    composite=Image.new("RGB",(args.width*2,args.height+38),"white")
    composite.paste(original,(0,38))
    composite.paste(replica,(args.width,38))
    d=ImageDraw.Draw(composite)
    d.text((14,12),"Original scan (private)",fill="black")
    d.text((args.width+14,12),f"Native Typst SVG | SSIM={score:.3f}, ink IoU={overlap:.3f}",fill="black")
    composite.save(args.output/"side-by-side.png")
    Image.blend(original,replica,.5).save(args.output/"overlay.png")
    aa=np.asarray(original.convert("L")).astype("int16")
    bb=np.asarray(replica.convert("L")).astype("int16")
    diff=np.clip(abs(aa-bb)*2,0,255).astype("uint8")
    heatmap=Image.fromarray(np.dstack((diff,np.zeros_like(diff),np.zeros_like(diff))),"RGB")
    heatmap.save(args.output/"difference.png")
    report={
        "source":args.scan.name,
        "native_svg":args.typst_svg.name,
        "comparison_pixels":[args.width,args.height],
        "ssim":round(score,5),
        "ink_iou":round(overlap,5),
        "not_a_completion_certificate":True,
        "interpretation":"Requires human visual review; does not verify equations, text, diagrams or copyright."
    }
    (args.output/"metrics.json").write_text(json.dumps(report,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    print(json.dumps(report,ensure_ascii=False,indent=2))

if __name__=="__main__":
    main()
