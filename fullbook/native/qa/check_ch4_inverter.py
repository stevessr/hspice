#!/usr/bin/env python3
"""Source-based chapter 4 editorial checks for PDF127–136; not 1:1 acceptance."""
import json,re,math
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
WEB=ROOT/"web"
status=json.loads((ROOT/"page-status.json").read_text(encoding="utf-8"))
assert status["source_pdf_pages"]==445 and len(status["pages"])==445
req={
127:["第4章","4.1","4.2","4.12","静态电路","动态电路"],
128:["图4.1","VTC",'"(4.1)"',"inverter-vtc"],
129:["图4.2","图4.3","VTC","inverter-vtc"],
130:["4.3","4.3.1","SSNM","single-source"],
131:["图4.4","图4.5",'"(4.2)"',"SSNM_H","SSNM_L","noise-chain"],
132:["图4.6","图4.7","4.3.2","MSNM","noise-margins"],
133:["图4.8",'"(4.3)"',"NM_H","NM_L","noise-margins"],
134:["例4.1","4.4","电阻负载","缓冲器"],
135:["图4.9",'"(4.4)"',"I_(\"DS\")","iv-load-line"],
136:['"(4.5)"','"(4.6a)"','"(4.6b)"','"(4.6c)"','"(4.6d)"','"(4.7)"',"R_L"],
}
for n,tokens in req.items():
 p=status["pages"][n-1]
 assert p["pdf_page"]==n and p["status"]=="partially-transcribed"
 assert p["figures_verified"] is False and p["layout_verified"] is False
 source=WEB/f"{n-23}-page-{n:03d}.typ"
 layout=WEB/f"{n-23}-page-{n:03d}-layout.typ"
 assert source.is_file() and layout.is_file()
 txt=source.read_text(encoding="utf-8")
 assert all(t in txt for t in tokens),(n,[t for t in tokens if t not in txt])
 assert '#image(' not in txt,n
 lay=layout.read_text(encoding="utf-8")
 assert "506.8346pt" in lay and "729.6pt" in lay
 assert '#include "'+source.name+'"' in lay
# Original book records two-line formula numbers, no invented 4.2a/4.2b.
assert (WEB/"108-page-131.typ").read_text().count('"(4.2)"')==1
assert (WEB/"110-page-133.typ").read_text().count('"(4.3)"')==1
# Simple physical sanity of resistor-load design.
Vdd,Vt,k,rl=1.8,.4,1e-3,20e3
vol=Vdd/(1+k*rl*(Vdd-Vt))
assert 0<vol<Vdd
assert 0<(Vdd-vol)**2/rl<(Vdd**2)/rl
print("Chapter 4 selected scan pages127–136: VTC/SSNM/NM and equations4.1–4.7 OK")
