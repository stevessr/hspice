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
    ("04-page-027", "原书第27页：理想逻辑电路与数字电平特性", [27]),
    ("05-page-028", "原书第28页：连续信号与噪声容限", [28]),
    ("06-page-029", "原书第29页：瞬态特性与传播延迟", [29]),
    ("07-page-030", "原书第30页：瞬态续图与功耗数据", [30]),
    ("08-page-031", "原书第31页：静态和动态功耗公式", [31]),
    ("09-page-032", "原书第32页：MOS晶体管结构", [32]),
    ("10-page-033", "原书第33页：CMOS反相器", [33]),
    ("11-page-034", "原书第34页：NMOS反相器与互连", [34]),
    ("12-page-035", "原书第35页：互连电阻与耦合", [35]),
    ("13-page-036", "原书第36页：时钟树与偏斜", [36]),
    ("14-page-037", "原书第37页：串扰与分布RLC", [37]),
    ("15-page-038", "原书第38页：CAD物理设计流程", [38]),
    ("16-page-039", "原书第39页：SPICE电路分析", [39]),
    ("17-page-040", "原书第40页：ITRS工艺路线图", [40]),
    ("18-page-041", "原书第41页：电压、功耗与电流趋势", [41]),
    ("19-page-042", "原书第42页：ITRS设计生产力与SoC", [42]),
    ("20-page-043", "原书第43页：SoC实例、章节小结", [43]),
    ("21-page-044", "原书第44页：习题P1.1—P1.7与半加器", [44]),
    ("22-page-045", "原书第45页：反相器、RC延迟与开关", [45]),
    ("23-page-046", "原书第46页：习题P1.10—P1.12", [46]),
    ("24-page-047", "原书第47页：MOS晶体管章节提要", [47]),
    ("25-page-048", "原书第48页：MOS器件及四端结构", [48]),
    ("26-page-049", "原书第49页：NMOS结构与沟道", [49]),
    ("27-page-050", "原书第50页：PMOS剖面与阈值", [50]),
    ("28-page-051", "原书第51页：CMOS阱与隔离结构", [51]),
    ("29-page-052", "原书第52页：能带与载流子平衡", [52]),
    ("30-page-053", "原书第53页：氧化层电容与反型沟道", [53]),
    ("31-page-054", "原书第54页：MOS电荷和平带状态", [54]),
    ("32-page-055", "原书第55页：耗尽层宽度和电荷", [55]),
    ("33-page-056", "原书第56页：强反型和体偏置耗尽电荷", [56]),
    ("34-page-057", "原书第57页：阈值电压与体效应", [57]),
    ("35-page-058", "原书第58页：表2.1阈值符号及例2.4", [58]),
    ("36-page-059", "原书第59页：阈值注入例2.5与线性区引言", [59]),
    ("37-page-060", "原书第60页：沟道电荷与载流子迁移率", [60]),
    ("38-page-061", "原书第61页：线性区方程与夹断", [61]),
    ("39-page-062", "原书第62页：饱和区及沟道长度调制", [62]),
    ("40-page-063", "原书第63页：长短沟道、速度饱和比较", [63]),
    ("41-page-064", "原书第64页：图2.11与高电场对比", [64]),
    ("42-page-065", "原书第65页：迁移率退化和速度饱和", [65]),
    ("43-page-066", "原书第66页：临界电场和分段速度模型", [66]),
    ("44-page-067", "原书第67页：高场线性和饱和电流方程", [67]),
    ("45-page-068", "原书第68页：长短沟道极限与例2.6", [68]),
    ("46-page-069", "原书第69页：例2.7与驱动电流比", [69]),
    ("47-page-070", "原书第70页：例2.8和α功率定律", [70]),
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
        if not re.search(r"<body(?:\\s|>)", html, re.I) or len(html) < 600:
            raise RuntimeError(f"Export missing its source content: {dest}")
        if stem == "03-page-026":
            missing = [token for token in ("图1.4", "图1.5", "触发器", "激励表") if token not in html]
            if missing or "<svg" not in html.lower() or "<table" not in html.lower():
                print("HTML DEBUG:", html[:1800], flush=True)
                raise RuntimeError(f"Incomplete native diagram/page HTML: missing={missing}; inline SVG={'<svg' in html.lower()}; semantic table={'<table' in html.lower()}")
        if stem == "04-page-027":
            missing = [token for token in ("1.3.2", "图 1.6", "扇出", "扇入") if token not in html]
            if missing or "<svg" not in html.lower():
                raise RuntimeError(f"Incomplete source-page-027 HTML: missing={missing}; SVG={'<svg' in html.lower()}")
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
