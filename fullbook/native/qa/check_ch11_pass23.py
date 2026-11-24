#!/usr/bin/env python3
"""Pass23 PDF397–404 source-guided Chapter11 timing, skew, power and clocks."""
from pathlib import Path
import json,math
r=Path(__file__).resolve().parents[1]
a=json.loads((r/"qa/source-audit-p397-p404.json").read_text(encoding="utf-8"))
s=json.loads((r/"page-status.json").read_text(encoding="utf-8"))["pages"]
f=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["scope"]==[397,404] and len(a["pages"])==8 and a["strict_full_pages_accepted"]==0
marks={
397:("11.3","11.3.1","偏斜","等待时间"),
398:("图11.16","图11.17","抖动","T_\"cycle\""),
399:("图11.18","图11.19","11.3.2","RMS"),
400:("图11.20","11.6","11.7","T_\"DMAX\"","T_\"DMIN\""),
401:("图11.21","图11.22","11.3.3","噪声"),
402:("图11.23","11.3.4","1.6 \"W\"","500 \"MHz\""),
403:("图11.24","图11.25","11.3.5","环形振荡器"),
404:("图11.26","图11.27","图11.28","11.3.6")}
for n,ks in marks.items():
 text=(r/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
 assert "SOURCE PDF PAGE "+str(n) in text[:100] and "#image(" not in text
 assert "MACHINE-OCR DRAFT ONLY" not in text
 assert all(k in text for k in ks),(n,[k for k in ks if k not in text])
 p=s[n-1];q=f[n-1]
 assert p["status"]==q["editorial_state"]=="draft-transcribed"
 assert p["editorial_typst_draft"] and p["source_scan_landmarks_checked"]
 assert p["proofread_round"]=="2026-11-08-source-scan-ch11-clock-pass23"
 assert not p["human_verified"] and not p["layout_verified"] and not all(q["checks"].values())
 assert len(a["pages"][n-397]["source_render_sha256"])==64
v=a["numerical_reference"]
assert math.isclose(v["clock_power_C_nF"]*v["clock_power_Vdd_V"]**2*v["clock_frequency_MHz"]/1000,v["clock_power_W"])
fig=(r/"figures/ch11-clock-timing-native.typ").read_text(encoding="utf8")
assert all(f"#let fig11{i}()" in fig for i in range(16,29))
print("Pass23 PDF397–404 timing/power/diagram tests passed. Strict 1:1 full page remains zero.")
