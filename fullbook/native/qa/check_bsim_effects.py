#!/usr/bin/env python3
"""Review gate for BSIM3 scan-page 107–116 editorial subsets, not 1:1 acceptance."""
import json,re,math
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
WEB=ROOT/"web"
meta=json.loads((ROOT/"page-status.json").read_text(encoding="utf-8"))
assert meta["source_pdf_pages"]==445 and len(meta["pages"])==445
expected={
107:["3.12","3.13","3.14","3.15","3.16","NCH","NSUB","K1","K2"],
108:["图3.13","3.17","SCE","RSCE","short-channel-threshold"],
109:["图3.14","3.18","3.19","3.20","VSAT","dibl-threshold"],
110:["例3.4","0.18","1.8","SPICE","iv-simulation"],
111:["例3.5","2.8","3.6.6"],
112:["例3.6","亚阈值","3.6.6","电容模型"],
113:["3.22","3.23","CJSWG","RDSW","3.7.1"],
114:["3.24","3.25","例3.7","300"],
115:["例3.7","-40","100","3.7.3","temperature-current"],
116:["3.7.4","3.7.5","热载流子","闩锁"],
}
for n,terms in expected.items():
 p=meta["pages"][n-1]
 assert p["pdf_page"]==n and p["status"]=="partially-transcribed"
 assert p["layout_verified"] is False and p["figures_verified"] is False
 s=WEB/f"{n-23:02d}-page-{n:03d}.typ"
 lay=WEB/f"{n-23:02d}-page-{n:03d}-layout.typ"
 assert s.is_file() and lay.is_file(),n
 body=s.read_text(encoding="utf-8")
 assert all(v in body for v in terms),(n,[v for v in terms if v not in body])
 assert '#image(' not in body,n
 frame=lay.read_text(encoding="utf-8")
 assert "506.8346pt" in frame and "729.6pt" in frame
 assert '#include "'+s.name+'"' in frame
# Temperature and threshold sanity (not an independent BSIM3 physical validation).
mu_ratio=(400/300)**(-1.5)
assert .64<mu_ratio<.66
assert abs((.4/1.2)*100 - 33.333)<.01
assert "CJSWG" in (WEB/"90-page-113.typ").read_text(encoding="utf-8")
print("BSIM3 scan-page review 107–116: equation markers, workflow continuity and temperature checks OK")
