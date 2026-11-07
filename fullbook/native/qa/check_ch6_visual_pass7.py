#!/usr/bin/env python3
"""Verify second-pass source-to-SVG pixel measurements and strict rejection."""
from pathlib import Path
import json
base=Path(__file__).resolve().parents[1]
d=json.loads((base/"qa/visual-audit-p245-p252-pass7.json").read_text(encoding="utf-8"))
s=json.loads((base/"page-status.json").read_text(encoding="utf-8"))["pages"]
q=json.loads((base/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert d["scope"]==[245,252] and len(d["pages"])==8 and d["strict_full_pages_accepted"]==0
assert round(sum(x["baseline_f1"] for x in d["pages"])/8,5)==d["baseline_mean_f1"]
assert round(sum(x["refined_f1"] for x in d["pages"])/8,5)==d["refined_mean_f1"]
assert d["pages"][3]["refined_f1"]>d["pages"][3]["baseline_f1"]
assert d["pages"][7]["refined_f1"]>d["pages"][7]["baseline_f1"]
for row in d["pages"]:
 n=row["pdf_page"]
 assert 0<=row["refined_f1"]<1
 assert row["accepted"] is False
 assert s[n-1]["status"]=="partially-transcribed" and not s[n-1]["layout_verified"]
 assert not q[n-1]["page_source_verified"] and not all(q[n-1]["checks"].values())
print("PDF245–252 SVG scan audit present; strict 1:1 passes: zero.")
