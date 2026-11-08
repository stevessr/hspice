#!/usr/bin/env python3
"""Chapter10 pass20 scan-checked editable excerpts PDF373–380 and no false completion."""
import json,re,math
from pathlib import Path
root=Path(__file__).resolve().parents[1]
data=json.loads((root/"qa/source-audit-p373-p380.json").read_text(encoding="utf-8"))
status=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
fidelity=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert data["scope"]==[373,380] and data["source_pdf_pages"]==445 and len(data["pages"])==8
assert data["strict_full_pages_accepted"]==0
marks={
 373:("图10.20","图10.21","C_\"eff\"","同方向转变"),
 374:("10.4.3","10.17","图10.22","串扰"),
 375:("10.5","10.18","10.19","10.20","10.21","0.45"),
 376:("图10.23","10.22","Z_0","RLC"),
 377:("10.23","10.24","10.25","10.26","图10.24"),
 378:("10.27","10.28","10.6","天线效应"),
 379:("10.29","图10.25","100","面积"),
 380:("图10.26","图10.27","保护二极管","制造")
}
for n,words in marks.items():
 text=(root/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
 assert f"SOURCE PDF PAGE {n}" in text[:95] and "MACHINE-OCR DRAFT ONLY" not in text
 assert "#image(" not in text
 assert all(k in text for k in words),(n,[k for k in words if k not in text])
 a=status[n-1];b=fidelity[n-1]
 assert a["editorial_typst_draft"] and a["source_scan_landmarks_checked"]
 assert a["proofread_round"]=="2026-11-08-source-scan-ch10-rlc-pass20"
 assert a["status"]==b["editorial_state"]=="draft-transcribed"
 assert not a["human_verified"] and not a["layout_verified"]
 assert not all(b["checks"].values())
 assert len(data["pages"][n-373]["source_render_sha256"])==64
fig=(root/"figures/ch10-inductance-antenna-native.typ").read_text(encoding="utf-8")
assert all(f"#let fig10{i}()" in fig for i in range(20,29))
assert data["reference_values"]["activity_factors"]==[0,1,2]
assert math.isclose(data["reference_values"]["interconnect_inductance_pH_per_um"],.45)
# Primary-source second pass: setup/hold derating, RLC response, current returns, antenna layering.
for n,words in {
  373:("建立时间","保持时间"),
  374:("SPICE 瞬态分析",),
  376:('exp(-t/(R C))',"衰减振铃"),
  377:("time of flight","10.24"),
  378:("闭合电流回路","返回电流"),
  379:("逐层制造顺序",),
  380:("制造时刻","跨层跳线"),
}.items():
  source=(root/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
  assert all(x in source for x in words),(n,words)

print("Pass20 source-guided PDF373–380 landmarks, equations, editable figures and status passed; complete 1:1 0/445.")
