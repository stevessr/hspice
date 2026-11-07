#!/usr/bin/env python3
"""Review basic source landmarks and numerical examples on PDF137–146.
This is NOT a certification of full-page Typst fidelity.
"""
from pathlib import Path
import json,math
ROOT=Path(__file__).resolve().parents[1]; WEB=ROOT/"web"
data=json.loads((ROOT/"page-status.json").read_text(encoding="utf-8"))
assert data["source_pdf_pages"]==445 and len(data["pages"])==445
required={
137:['"(4.8a)"','"(4.8b)"',"V_(\"IL\")"],
138:['"(4.8c)"','"(4.8d)"','"(4.8e)"','"(4.8f)"','"(4.9)"',"例4.2"],
139:["例4.2","例4.3","0.08","0.46","0.77","0.38","0.43","NMOS1"],
140:["例4.3","0.085","0.558","0.972","0.473","0.828","0.78"],
141:["4.5.1","饱和增强型负载","NMOS"],
142:["图4.10",'"(4.10)"','"(4.11)"',"K_R","nmos-load"],
143:['"(4.12)"',"例4.4","0.73","0.88"],
144:["例4.5","0.1","270","0.6","100"],
145:["4.5.2",'"(4.13)"',"图4.11","1.7","nmos-load"],
146:["4.6","4.6.1","cmos-inverter","PMOS","NMOS"],
}
for n,tokens in required.items():
 p=data["pages"][n-1]
 assert p["pdf_page"]==n and p["status"]=="partially-transcribed"
 assert p["layout_verified"] is False and p["figures_verified"] is False
 src=WEB/f"{n-23}-page-{n:03d}.typ"
 lay=WEB/f"{n-23}-page-{n:03d}-layout.typ"
 assert src.is_file() and lay.is_file(),n
 text=src.read_text(encoding="utf-8")
 assert all(t in text for t in tokens),(n,[t for t in tokens if t not in text])
 assert '#image(' not in text
 frame=lay.read_text(encoding="utf-8")
 assert "506.8346pt" in frame and "729.6pt" in frame
 assert '#include "'+src.name+'"' in frame
# Basic book example checks independent of source string matching:
k=.00043*2;R=20000;Vdd=1.2;Vt=.4
assert abs((Vt+1/(k*R))-.45814)<.002
vih=Vt+math.sqrt(8*Vdd/(3*k*R))-1/(k*R)
assert abs(vih-.7732)<.003
v=.99-.2*math.sqrt(.73+.88)
assert abs(v-.73)<.01
print("Chapter4 NMOS load/CMOS pages137–146: formula and source-parameter checks OK")
