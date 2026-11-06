#!/usr/bin/env python3
"""Source-checked editorial guards for scan pages 97-106, not full-page acceptance."""
from pathlib import Path
import json,re,math
N=Path(__file__).resolve().parents[1]
WEB=N/"web"
data=json.loads((N/"page-status.json").read_text(encoding="utf-8"))
assert data["source_pdf_pages"]==445 and len(data["pages"])==445
terms={
 97:["图3.6","例3.1","0.2","10","11","3.3","scaled-wires"],
 98:["图3.7","GDS-II","DRC","200","100","gds-flow"],
 99:["图3.8","图3.9","3 lambda","2 lambda","contacts"],
 100:["3.4","3.4.1","SPICE","LEVEL 1","BSIM"],
 101:["图3.10","3.4.2","Mxxx D G S B","AD","AS","PD","PS"],
 102:["3.2","例3.2","L_(\"eff\")","W_(\"eff\")","M1 drainn","scale=0.1u"],
 103:["3.3","3.4","3.5","3.6","3.7","3.8","3.9","PHI","GAMMA","KP"],
 104:["3.10","3.11","CJ","CJSW","MOS LEVEL 1"],
 105:["图3.11","例3.3",".model NMOS1","lambda=0"],
 106:["图3.12","3.6.1","BSIM3","分箱","bsim-grid"],
}
for n,tokens in terms.items():
 p=data["pages"][n-1]
 assert p["pdf_page"]==n and p["status"]=="partially-transcribed"
 assert p["layout_verified"] is False and p["figures_verified"] is False
 src=WEB/f"{n-23:02d}-page-{n:03d}.typ"
 wrapper=WEB/f"{n-23:02d}-page-{n:03d}-layout.typ"
 assert src.is_file() and wrapper.is_file(),n
 s=src.read_text(encoding="utf-8")
 assert all(t in s for t in tokens),(n,[t for t in tokens if t not in s])
 assert '#image(' not in s
 assert '#include "'+src.name+'"' in wrapper.read_text(encoding="utf-8")
 assert "506.8346pt" in wrapper.read_text(encoding="utf-8")
# Source edition formula numbering: p96 has no 3.2 or 3.3 labels; equation 3.2
# starts at p102 and is shared by Leff and Weff.
p96=(WEB/"73-page-096.typ").read_text(encoding="utf-8")
p102=(WEB/"79-page-102.typ").read_text(encoding="utf-8")
assert not re.search(r'\(3\.[23]\)',p96)
assert p102.count('"(3.2)"')==1 and "L_(\"eff\")" in p102 and "W_(\"eff\")" in p102
p103=(WEB/"80-page-103.typ").read_text(encoding="utf-8")
assert all(f'\"(3.{i})\"' in p103 for i in range(3,10))
# Ohmic calculation for the book's historical metal wire example.
def r_wire(rho_uohm_cm,w_um,t_um,l_um):
 return rho_uohm_cm*1e-8*(l_um*1e-6)/(w_um*1e-6*t_um*1e-6)
assert math.isclose(r_wire(2.7,5,1,35),.189,rel_tol=.03)
assert 9.5<r_wire(2.7,.18,.5,35)<11
assert 10<r_wire(1.7,.13,.4,35)<12
print("Chapter3 DRC/SPICE editorial check: PDF97..106 and source equations3.2–3.11 OK")
