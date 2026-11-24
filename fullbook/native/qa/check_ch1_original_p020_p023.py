#!/usr/bin/env python3
"""Chapter1 original scanned PDF20–23 content anchors (not full 1:1 geometry)."""
from pathlib import Path
r=Path(__file__).resolve().parents[1]/"web"
checks={
  20:("本章提要","1.1","1.9","VLSI","RTL","VHDL","Verilog","GDS-II","速度","功耗"),
  21:("MOS","NMOS","CMOS","GaAs","SiGe","TTL","ECL","SPICE","CAD","SSI","MSI","十微米"),
  22:("Moore's law","0.7","LSI","VLSI","1M","metal pitch","0.35","0.13","90 nm","65 nm","IR","短沟道"),
  23:("图 1.1","图 1.2","IBM","互连","CMOS","显微照片"),
}
names={20:"01",21:"02",22:"03",23:"04"}
for n,landmarks in checks.items():
  s=(r/f"{names[n]}-page-{n:03d}.typ").read_text(encoding="utf-8")
  assert "SOURCE PDF PAGE" in s, n
  assert not "Editable editorial excerpt" in s, n
  assert all(word in s for word in landmarks),(n,[word for word in landmarks if word not in s])
  assert "#image(" not in s
  print(f"PDF {n}: {len(landmarks)} original-scan landmarks retained in editable source.")
assert "unverified" in (r/"01-page-020.typ").read_text(encoding="utf-8")
assert "incomplete" in (r/"04-page-023.typ").read_text(encoding="utf-8")
print("No page given 1:1 acceptance; source micrograph image bytes absent.")
