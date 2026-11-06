#!/usr/bin/env python3
"""Velocity-saturation source-aligned regression checks (not a 1:1 page-acceptance gate)."""
from pathlib import Path
import json
import math

ROOT=Path(__file__).resolve().parents[1]
WEB=ROOT/"web"
STATUS=json.loads((ROOT/"page-status.json").read_text(encoding="utf-8"))
EXPECTED={
 64:["图2.11","2.5.1","1.2 times 10^5"],
 65:["2.21","2.22","图2.12","270"],
 66:["2.23a","2.23b","2.24","图2.13"],
 67:["2.25","2.26","2.27","2.28","2.29"],
 68:["例2.6","图2.14","1.0","0.6"],
 69:["例2.7","585","256","2.3"],
 70:["例2.8","2.30a","0.34","0.60"],
}
assert STATUS["source_pdf_pages"]==445 and len(STATUS["pages"])==445
for n,tokens in EXPECTED.items():
 p=STATUS["pages"][n-1]
 assert p["pdf_page"]==n
 assert p["status"]=="partially-transcribed"
 assert p["formulas_checked_against_scan"] is True
 assert p["figures_verified"] is False
 assert p["layout_verified"] is False
 src=WEB/f"{n-23:02d}-page-{n:03d}.typ"
 assert src.is_file(),src
 body=src.read_text(encoding="utf-8")
 assert all(s in body for s in tokens),(n,[s for s in tokens if s not in body])
 assert '#image(' not in body and '#include "pages/page-' not in body
def vdsat(overdrive,ecl):
 return overdrive*ecl/(overdrive+ecl)
assert abs(vdsat(1.3,1.2)-0.6)<0.03
assert abs(vdsat(1.3,4.8)-1.0)<0.03
assert abs(vdsat(0.8,0.6)-0.34)<0.01
assert abs(vdsat(0.8,2.4)-0.60)<0.001
# Source example 2.7: cm dimensions -> microampere per micrometre.
def current_uA_per_um(ecl):
 v_sat=8e6
 c_ox=1.6e-6
 overdrive=0.8
 current_per_cm=v_sat*c_ox*overdrive**2/(overdrive+ecl)
 return current_per_cm*(1e6/1e4)
n,p=current_uA_per_um(0.6),current_uA_per_um(2.4)
assert math.isclose(n,585,rel_tol=.005)
assert math.isclose(p,256,rel_tol=.005)
assert abs(n/p-2.3)<0.05
print("Velocity saturation source regression: 64..70; equations 2.21–2.30a; examples 2.6–2.8 OK")
