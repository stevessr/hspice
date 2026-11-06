#!/usr/bin/env python3
"""Editable MOS capacitance and subthreshold page-integrity checks, not 1:1 proofread."""
import json
import math
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
WEB=ROOT/"web"
data=json.loads((ROOT/"page-status.json").read_text(encoding="utf-8"))
assert data["source_pdf_pages"]==445 and len(data["pages"])==445
markers={
  71:["2.30b","2.31","图2.15","例2.9","130","220"],
  72:["图2.16","2.32","亚阈值","50"],
  73:["2.33","例2.10","0.140","0.212","72"],
  74:["2.34","图2.17","1.6","22"],
  75:["图2.18","例2.11","0.64","0.32","0.43","2.35"],
  76:["图2.19","2.36","2.37","2.38","2.39"],
}
for n,values in markers.items():
  p=data["pages"][n-1]
  assert p["pdf_page"]==n
  assert p["status"]=="partially-transcribed"
  assert p["formulas_checked_against_scan"] is True
  assert p["layout_verified"] is False
  assert p["figures_verified"] is False
  file=WEB/f"{n-23:02d}-page-{n:03d}.typ"
  assert file.is_file(),file
  contents=file.read_text(encoding="utf-8")
  assert all(v in contents for v in values),(n,[v for v in values if v not in contents])
  assert '#image(' not in contents
# Quantitative cross-checks derived from the textbook examples.
alpha=math.log(220/130)/math.log((1.8-0.5)/(1.35-0.5))
assert abs(alpha-1.25)<0.03
k_s=220/(1.8-0.5)**1.25
assert abs(k_s-160)<3
assert abs(160*(.9-.5)**1.25-50)<2
s_mV=(.212-.140)*1e3
assert abs(s_mV-72)<1e-6
assert abs(.4*1.6-.64)<1e-10
assert abs((2/3)*.64-.43)<.01
print("Subthreshold and capacitance pages 71-76: formula markers and examples 2.9-2.11 OK")
