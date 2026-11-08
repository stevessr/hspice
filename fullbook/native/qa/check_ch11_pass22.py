#!/usr/bin/env python3
"""Chapter11 source-specific PDF389–396 native scan/edit test, no false 1:1 progress."""
import json,math
from pathlib import Path
r=Path(__file__).resolve().parents[1]
a=json.loads((r/"qa/source-audit-p389-p396.json").read_text(encoding="utf8"))
s=json.loads((r/"page-status.json").read_text(encoding="utf8"))["pages"]
f=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf8"))["pages"]
assert a["scope"]==[389,396] and a["source_pdf_pages"]==445 and len(a["pages"])==8
marks={389:("11.2.1","11.2.2","100 \"mV\"","图11.3","图11.4"),390:("11.2.2","MTTF","11.3","图11.5"),391:("例11.1","8.95 times 10^5","11.4","11.5","11.2.3"),392:("图11.6","图11.7","电源网格"),393:("图11.8","图11.9","11.2.4","图11.10"),394:("图11.11","图11.12","C_\"decap\"","11.2.5"),395:("11.2.5","图11.13","IR","EM"),396:("图11.14","图11.15","EM","IR")}
for n,words in marks.items():
 text=(r/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf8")
 assert f"SOURCE PDF PAGE {n}" in text[:110]
 assert "MACHINE-OCR DRAFT ONLY" not in text and "#image(" not in text
 assert all(w in text for w in words),(n,[w for w in words if w not in text])
 p=s[n-1];q=f[n-1]
 assert p["status"]==q["editorial_state"]=="draft-transcribed"
 assert p["editorial_typst_draft"] and p["source_scan_landmarks_checked"]
 assert p["proofread_round"]=="2026-11-08-source-scan-ch11-power-em-pass22"
 assert not p["human_verified"] and not p["layout_verified"] and not all(q["checks"].values())
 assert len(a["pages"][n-389]["source_render_sha256"])==64
v=a["source_points"]["example_BGA"]
assert math.isclose(v["rails"]*v["inductance_nH"]*v["current_mA"]/v["change_ps"]*1000,v["noise_mV"])
assert math.isclose(a["source_points"]["black_example"]["jmax_A_cm2"],8.95e5)
fig=(r/"figures/ch11-power-grid-em-native.typ").read_text(encoding="utf8")
assert all(f"#let fig11{i}()" in fig for i in range(3,16))
assert a["strict_full_pages_accepted"]==0
print("Pass22: PDF389-396 numeric, source figure and status landmarks accepted as partial; 1:1 0/445.")
