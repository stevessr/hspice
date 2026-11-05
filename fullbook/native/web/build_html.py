#!/usr/bin/env python3
"""Export reviewed native Typst selections directly to HTML for VitePress.

No PDF files are created. HTML export is experimental, so failures stop
deployment rather than silently falling back to stale content.
"""
from pathlib import Path
import argparse
import json
import re
import shutil
import subprocess

ROOT = Path(__file__).resolve().parent
SECTIONS = [
    ("01-gates-noise-delay", "第1章：逻辑门、噪声与延迟", [26,27,28,29,30,31,32]),
    ("02-mos-threshold", "第2章：MOS结构与阈值", [48,49,50,51,52,53,54,55,56,57]),
    ("03-page-026", "原书第26页：逻辑门与DFF图", [26]),
]
CSS = """
<style>
:root{color-scheme:light dark;font-family:"Noto Sans CJK SC","Microsoft YaHei",sans-serif}
body{max-width:850px;margin:0 auto;padding:22px 24px 60px;color:#182a38;background:#fff;line-height:1.85;overflow-wrap:anywhere}
h1,h2,h3{color:#175574;line-height:1.35}h1{border-bottom:1px solid #ccdbe4;padding-bottom:.65rem;font-size:1.6rem}
h2{margin-top:1.7rem;font-size:1.25rem}
table{display:block;max-width:100%;overflow-x:auto;border-collapse:collapse;margin:1rem 0}
th,td{padding:.45rem .75rem;border:1px solid #c9d4dd;text-align:start}
th{background:#e8f3fa}math{max-width:100%;overflow-x:auto}p{margin:.8rem 0}
@media(prefers-color-scheme:dark){
body{color:#d9e7ee;background:#171c24}h1,h2,h3{color:#8ac6ed}
th{background:#243c4a}th,td{border-color:#475869}}
@media(max-width:650px){body{padding:16px 13px}}
</style>
"""

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--output", type=Path, required=True)
    p.add_argument("--typst", default="typst")
    args = p.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    index=[]
    for stem,title,pages in SECTIONS:
        src=ROOT/f"{stem}.typ"
        dest=args.output/f"{stem}.html"
        result=subprocess.run(
            [args.typst,"compile","--root",str(ROOT.parent),"--features","html","--format","html",str(src),str(dest)],
            text=True,capture_output=True,timeout=120
        )
        if result.returncode:
            raise RuntimeError(f"Typst HTML export failed for {stem}:\n{result.stderr[-6000:]}")
        html=dest.read_text(encoding="utf-8")
        if not re.search(r"<html(?:\s|>)",html,re.I):
            raise RuntimeError(f"Not an HTML document: {dest}")
        html,n=re.subn(r"</head\s*>",CSS+"\n</head>",html,count=1,flags=re.I)
        if n!=1:
            raise RuntimeError(f"HTML head not found: {dest}")
        if "扫描" not in html and "教材" not in html:
            raise RuntimeError(f"Export missing its source content: {dest}")
        dest.write_text(html,encoding="utf-8")
        shutil.copy2(src,args.output/f"{stem}.typ")
        index.append(dict(id=stem,title=title,source_pdf_pages=pages,
                          html=stem+".html",typst=stem+".typ",
                          status="reviewed selections only; full pages not accepted"))
        print(f"HTML OK {stem}: {len(html)} bytes",flush=True)
    (args.output/"index.json").write_text(
        json.dumps(dict(format="native-typst-html",accepted_full_pages=0,
                        items=index),ensure_ascii=False,indent=2)+"\n",encoding="utf-8")

if __name__=="__main__":
    main()
