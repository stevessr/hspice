#!/usr/bin/env python3
"""Scan-backed editorial validation, PDF147–156. Not full-page acceptance."""
from pathlib import Path
import json,math
root=Path(__file__).resolve().parents[1];w=root/"web"
m=json.loads((root/"page-status.json").read_text(encoding="utf-8"))
assert m["source_pdf_pages"]==445 and len(m["pages"])==445
terms={
147:["图4.12","five-regions","through-current","III","PMOS"],
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
print("Chapter 4 scan-backed PDF147–156: equations4.14–4.21, examples4.6–4.8 OK")
