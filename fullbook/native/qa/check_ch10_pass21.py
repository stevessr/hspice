#!/usr/bin/env python3
"""Source guided Chapter10 conclusion/Chapter11 power, PDF381–388."""
import json,math
from pathlib import Path
root=Path(__file__).resolve().parents[1]
a=json.loads((root/"qa/source-audit-p381-p388.json").read_text(encoding="utf-8"))
p=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
f=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["scope"]==[381,388] and a["source_pdf_pages"]==445 and len(a["pages"])==8
assert a["strict_full_pages_accepted"]==0
marks={
381:("图10.28","10.7","54 mΩ","27 mΩ","42 mΩ","21 mΩ"),
382:("10.8","C_\"lateral\"","Delta V","M. Celik"),
383:("P10.1","P10.2","P10.3","P10.4","P10.5","P10.6","图P10.4"),
384:("P10.7","P10.8","P10.9","P10.10","P10.11","图P10.8","100 fF"),
385:("P10.12","18 mm","0.4 μm","25×"),
386:("第11章","11.1","11.2","电源分布"),
387:("11.1","11.2","1.2","100","1.2 \"mΩ\""),
388:("图11.1","图11.2","IR","BGA","DIP")}
for n,tokens in marks.items():
 s=(root/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
 assert "SOURCE PDF PAGE "+str(n) in s[:95] and "MACHINE-OCR DRAFT ONLY" not in s
 assert "#image(" not in s
 assert all(z in s for z in tokens),(n,[z for z in tokens if z not in s])
 x=p[n-1]; y=f[n-1]
 assert x["status"]==y["editorial_state"]=="draft-transcribed"
 assert x["editorial_typst_draft"] and x["source_scan_landmarks_checked"]
 assert x["proofread_round"]=="2026-11-08-source-scan-ch10end-ch11power-pass21"
 assert not x["human_verified"] and not x["layout_verified"] and not all(y["checks"].values())
 assert len(a["pages"][n-381]["source_render_sha256"])==64
assert math.isclose((a["milestones"]["reference_values"]["vdd_v"]*.1/a["milestones"]["reference_values"]["idd_a"])*1000,1.2)
fig=(root/"figures/ch10-summary-ch11-power-native.typ").read_text(encoding="utf-8")
assert all("#let "+s+"()" in fig for s in ("fig1028","figp104","figp105","figp106","figp108","fig111","fig112"))
print("Pass21: source-based Chapter10 conclusion & Chapter11 PDF381–388 anchors passed; strict 0/445.")
