#!/usr/bin/env python3
"""Require scanned PDF269–276 visual evidence, never auto-accept pages from F1."""
from pathlib import Path
import json
r=Path(__file__).resolve().parents[1]
audit=json.loads((r/"qa/visual-audit-p269-p276-pass10.json").read_text(encoding="utf-8"))
status=json.loads((r/"page-status.json").read_text(encoding="utf-8"))["pages"]
fidelity=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert audit["scope"]==[269,276] and len(audit["pages"])==8
assert audit["strict_full_page_accepted"]==0
assert round(sum(x["baseline_f1"] for x in audit["pages"])/8,5)==audit["baseline_mean_f1"]
assert round(sum(x["refined_f1"] for x in audit["pages"])/8,5)==audit["refined_mean_f1"]
assert audit["refined_mean_f1"]>audit["baseline_mean_f1"]
assert audit["pages"][3]["refined_f1"]>audit["pages"][3]["baseline_f1"]
for page in audit["pages"]:
 n=page["pdf_page"]
 assert not page["accepted"] and not page["all_electrical_nodes_verified"]
 assert 0<=page["refined_f1"]<1
 assert status[n-1]["status"]=="partially-transcribed"
 assert not status[n-1]["human_verified"] and not status[n-1]["layout_verified"]
 assert not fidelity[n-1]["page_source_verified"]
 assert not all(fidelity[n-1]["checks"].values())
fig=(r/"figures/ch7-latch-domino-pass9.typ").read_text(encoding="utf-8")
assert all("#let "+x+"(" in fig for x in ("fig718","mux-network","mux-ladder","mux-rc","fig-example75","fig721","fig722","fig725","fig726"))
assert fig.count("#let fig721()")==1
body=(r/"web/249-page-272.typ").read_text(encoding="utf-8")
assert "#fig-example75()" in body
assert "#fig721()" in body
print("PDF269–276 8 optical measurements recorded, strict accepted pages still zero.")
