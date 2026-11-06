#!/usr/bin/env python3
"""Source-scan-aware chapter 3 audit, editorial scope only; not full-page acceptance."""
from pathlib import Path
import json
import re

ROOT=Path(__file__).resolve().parents[1]
WEB=ROOT/"web"
STATUS=json.loads((ROOT/"page-status.json").read_text(encoding="utf-8"))
assert STATUS["source_pdf_pages"]==445 and len(STATUS["pages"])==445
MUST={
  87:["3.1","3.2","3.3","3.4","3.5","3.10","3.11","BSIM3","SOI"],
  88:["3.2.1","200—300","0.35—1.25","CVD","100—200"],
  89:["图3.1","3.2.2","步骤1","fab-flow"],
  90:["步骤2","步骤3","步骤4","步骤5","STI","OPC","PSM"],
  91:["步骤2","步骤3","步骤4","步骤5","22 Å","自对准","n⁺","p⁺"],
  92:["图3.2","STI","10—12","硅化物","cmos-finished"],
  93:["3.2.4","金属层1","金属层2","接触孔","metal-steps"],
  94:["图3.3","M1—M6","CMP","Damascene","metal-stack"],
  95:["3.2.5","图3.4","图3.5",' "(3.1)" ','H_1','S_1'],
  96:["sheet resistance",'R_("sq") = rho/T','R = R_("sq") L/W','1.7','2.7','5.5'],
}
for n,tokens in MUST.items():
  p=STATUS["pages"][n-1]
  assert p["pdf_page"]==n and p["status"]=="partially-transcribed"
  assert p["figures_verified"] is False and p["layout_verified"] is False
  src=WEB/f"{n-23:02d}-page-{n:03d}.typ"
  layout=WEB/f"{n-23:02d}-page-{n:03d}-layout.typ"
  assert src.is_file() and layout.is_file(),n
  body=src.read_text(encoding="utf-8")
  assert all(v in body for v in tokens),(n,[v for v in tokens if v not in body])
  assert '#image(' not in body and '\\mathrm(' not in body,n
  frame=layout.read_text(encoding="utf-8")
  assert '#include "'+src.name+'"' in frame,n
  assert "506.8346pt" in frame and "729.6pt" in frame,n

# All source diagrams must use the printed 1-based process-stage indices.
fab=(ROOT/"figures/fabrication-native.typ").read_text(encoding="utf-8")
metal=(ROOT/"figures/interconnect-ch3-native.typ").read_text(encoding="utf-8")
assert "步骤 #(i + 1)" in fab and "步骤 #(i + 1)" in metal
assert "[#(i + 1).]" in fab
assert "步骤 #i" not in fab and "步骤 #i" not in metal
assert "[#i.]" not in fab

# Preserve original edition's formula numbering. PDF95 has (3.1);
# PDF96 does not number either sheet resistance or wire resistance.
page95=(WEB/"72-page-095.typ").read_text(encoding="utf-8")
page96=(WEB/"73-page-096.typ").read_text(encoding="utf-8")
assert 'quad "(3.1)"' in page95
assert not re.search(r'\(3\.[23]\)',page96)
assert '原扫描中未编号' in page96
# Baseline geometric/physical relationships; no process calibration claim.
def C_parallel(k,eps0,L,W,t):
  return k*eps0*L*W/t
def R_wire(rho,L,W,T):
  return rho*L/(W*T)
assert abs(C_parallel(4,8.85e-12,10e-6,1e-6,1e-6)-3.54e-16)<1e-20
assert abs(R_wire(2.7e-8,10e-6,1e-6,1e-6)-.27)<.0001
print("Chapter3 scan-based editorial check OK: PDF87..96; figures3.1..3.5; equation3.1; unnumbered Rsq")
