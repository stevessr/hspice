#!/usr/bin/env python3
"""Scan-backed editorial validation, PDF147–156. Not full-page acceptance."""
from pathlib import Path
import json,math
root=Path(__file__).resolve().parents[1];w=root/"web"
m=json.loads((root/"page-status.json").read_text(encoding="utf-8"))
assert m["source_pdf_pages"]==445 and len(m["pages"])==445
terms={
147:["图4.12","fig412-circuit","fig412-loadline","fig412-vtc","fig412-current","PMOS","n-off","n-sat"],
148:['"(4.14)"','"(4.15)"',"chi","mu_n","mu_p"],
149:["例4.6","0.6","0.53","100","400","n-lin"],
150:['"(4.16)"',"V_(\"IL\")","I_(\"DN\")"],
151:['"(4.17)"','"(4.18)"','"(4.19)"',"例4.7"],
152:["例4.7","PMOS1","NMOS1","0.626","0.909","0.891"],
153:["4.6.2","1.41","0.83","0.7","1.0","15%"],
154:["图4.13","4.7","cmos-layout","AS","AD","PS","PD"],
155:["图4.14",' "(4.20)" ','"(4.21)"',"0.065","pseudo-nmos"],
156:["例4.8","2.0","0.065","800","400","4.8",".dc Vin"]
}
for n,words in terms.items():
 p=m["pages"][n-1]
 assert p["pdf_page"]==n and p["status"]=="partially-transcribed",n
 assert not p["layout_verified"] and not p["figures_verified"],n
 path=w/f"{n-23}-page-{n:03d}.typ"
 lay=w/f"{n-23}-page-{n:03d}-layout.typ"
 assert path.is_file() and lay.is_file(),n
 src=path.read_text(encoding="utf-8")
 assert all(t in src for t in words),(n,[t for t in words if t not in src])
 assert "#image(" not in src,n
 wrapper=lay.read_text(encoding="utf-8")
 assert "506.8346pt" in wrapper and "729.6pt" in wrapper,n
 assert '#include "'+path.name+'"' in wrapper,n
# Figure 4.12 PDF147 is four panels, not two generic graphs.
fig412=(root/"figures/ch4-figure-4-12-native.typ").read_text(encoding="utf-8")
s147=(w/"124-page-147.typ").read_text(encoding="utf-8")
for name in ("circuit","loadline","vtc","current"):
    assert f"#let fig412-{name}()" in fig412
    assert f"fig412-{name}()" in s147
assert "#image(" not in fig412
for landmark in ('V_("DD")', 'V_("out")', 'V_("in")', 'I_("DN")', 'I_("DP")',
                 'V_("TN")', 'V_("IL")', 'V_("IH")', 'V_("TP")',
                 "n-off", "n-sat"):
    assert landmark in fig412 or landmark in s147, landmark
assert "负载线" in fig412 and "电压传输特性" in fig412
# Source panel topology: a complementary series pair, an arch-shaped
# I-V load line, a falling VTC, and a peaked CMOS through-current.
assert all(token in fig412 for token in (
    "PMOS", "NMOS", "curve.cubic", "curve.move", "curve.cubic((84pt,-99pt)"
))
# Compare printed examples with independent arithmetic.
for wp,chi_expected,v_expected in ((.4,1,.6),(.1,2,.533333333)):
 chi=math.sqrt(.1*24/(wp*6))
 vs=(.8+.4*chi)/(1+chi)
 assert abs(chi-chi_expected)<1e-10
 assert abs(vs-v_expected)<.0002
chi=math.sqrt(.4*24/(.8*6))
vs=(1.8-.5+.5*chi)/(1+chi)
assert abs(chi-1.41421356)<1e-6 and abs(vs-.83137)<.001
assert abs(1.8-.909-.891)<1e-10
assert abs(.626-0-.626)<1e-10
assert abs(800/400-2)<1e-12
# PDF151: retain the original intermediate velocity-saturation equations, not only final results.
s151=(w/"128-page-151.typ").read_text(encoding="utf-8")
assert all(t in s151 for t in ("完整速度饱和模型", "mu_p E_(\"cP\")/2",
    "(4.17)", "(4.18)", "(4.19)", "dif V_(\"out\")", "例4.7"))
assert m["pages"][150]["formulas_checked_against_scan"] is True
# PDF152: plot the actual labeled example instead of reusing figure 4.12's generic five-region sketch.
s152=(w/"129-page-152.typ").read_text(encoding="utf-8")
figure=(root/"figures/ch4-cmos-continued-native.typ").read_text(encoding="utf-8")
assert 'cmos-example-vtc' in s152 and '#cmos-example-vtc()' in s152
assert '#let cmos-example-vtc()' in figure and 'html.frame' in figure
assert all(t in figure for t in ('0.626', '0.8', '0.909', '1.8', 'V_(\"OH\")', 'V_(\"OL\")'))
assert not m["pages"][151]["layout_verified"]
# PDF153–154: source figure 4.13 mask layers / contacts must survive editing.
s153=(w/"130-page-153.typ").read_text(encoding="utf-8")
s154=(w/"131-page-154.typ").read_text(encoding="utf-8")
geo=(root/"figures/ch4-cmos-continued-native.typ").read_text(encoding="utf-8")
assert all(t in s153 for t in ("4.6.2", "金属层 1", "多晶硅", "接触层",
     "扩散层", "阱塞", "例4.7", "0.83", "15%"))
assert all(t in s154 for t in ("4.7", "伪 NMOS", "四个晶体管接触点", "有比", "#cmos-layout()"))
assert "#let cmos-layout()" in geo and "#image(" not in geo
assert all(t in geo for t in ("Gnd", 'V_(\"DD\")', "输入", "输出", "阱塞",
    "多晶硅", "金属层1", "接触点"))
assert m["pages"][152]["text_checked_against_scan"] is True
assert m["pages"][153]["text_checked_against_scan"] is True
assert not m["pages"][153]["figures_verified"]
print("Chapter 4 scan-backed PDF147–156: equations4.14–4.21, examples4.6–4.8 OK")
