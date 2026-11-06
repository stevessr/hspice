#!/usr/bin/env python3
"""Editorial source-page gate for chapter 3 final 117-126; not full-page proof."""
import re,json
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
WEB=ROOT/"web"
meta=json.loads((ROOT/"page-status.json").read_text(encoding="utf-8"))
assert len(meta["pages"])==445 and meta["source_pdf_pages"]==445
MUST={
117:["图3.15","闩锁","latchup-pnpn"],
118:["图3.16","PD-SOI","FD-SOI","BOX","soi-section"],
119:["表3.1","VTO","KP","GAMMA","PHI","LAMBDA","CJ","JS","TPG","UO"],
120:["表3.2","BINUNIT","MOBMOD","NCH","TOX","WMAX","LINT"],
121:["表3.2","RDSW","VSAT","DIBL","NFACTOR","U0"],
122:["表3.2","CAPMOD","CJSWG","CGDO","CGSO","KT1","PB"],
123:["3.10","3.11","P3.1","SPICE2","HSPICE","spice-nmos-iv-test"],
124:["表P3.1","P3.2","P3.3","1000","280","276","741","4.75"],
125:["P3.4","P3.5","P3.6","P3.7","P3.8","100"],
126:["P3.8","P3.9","P3.10","P3.11","P3.12","P3.13","P3.14","100"],
}
for n,tokens in MUST.items():
 p=meta["pages"][n-1]
 assert p["pdf_page"]==n and p["status"]=="partially-transcribed"
 assert p["layout_verified"] is False and p["figures_verified"] is False
 src=WEB/f"{n-23:02d}-page-{n:03d}.typ"
 lay=WEB/f"{n-23:02d}-page-{n:03d}-layout.typ"
 assert src.is_file() and lay.is_file(),n
 txt=src.read_text(encoding="utf-8")
 assert all(t in txt for t in tokens),(n,[t for t in tokens if t not in txt])
 assert '#image(' not in txt,n
 frame=lay.read_text(encoding="utf-8")
 assert "506.8346pt" in frame and "729.6pt" in frame
 assert '#include "'+src.name+'"' in frame
# Original print has exactly 12 bibliographical items and 14 exercises.
refs=(WEB/"100-page-123.typ").read_text(encoding="utf-8")
assert len(re.findall(r"(?m)^\d{1,2}\. ",refs))==12
exercises="\n".join((WEB/f"{n-23:02d}-page-{n:03d}.typ").read_text(encoding="utf-8") for n in range(123,127))
for i in range(1,15): assert f"P3.{i}" in exercises,i
# Table P3.1 exact four measured rows:
p124=(WEB/"101-page-124.typ").read_text(encoding="utf-8")
for row in ("[0],[1.2],[1.2],[1000]","[0],[0.8],[1.2],[280]","[0],[0.8],[0.8],[276]","[0.4],[1.2],[1.2],[741]"):assert row in p124,row
assert "[JS],[单位面积衬底结饱和电流],[A/m²],[—]" in (WEB/"96-page-119.typ").read_text(encoding="utf-8")
print("Chapter3 ending source check: PDF117..126, tables3.1/3.2, references and P3.1..P3.14 OK")
