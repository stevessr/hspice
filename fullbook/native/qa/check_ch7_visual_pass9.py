#!/usr/bin/env python3
"""Optical scan-to-native progress is not literal/schematic 1:1 acceptance."""
from pathlib import Path
import json
r=Path(__file__).resolve().parents[1]
a=json.loads((r/"qa/visual-audit-p261-p268-pass9.json").read_text(encoding="utf-8"))
s=json.loads((r/"page-status.json").read_text(encoding="utf-8"))["pages"]
q=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["scope"]==[261,268] and a["strict_full_page_accepted"]==0
assert len(a["pages"])==8
assert round(sum(p["baseline_f1"] for p in a["pages"])/8,5)==a["baseline_mean_f1"]
assert round(sum(p["final_f1"] for p in a["pages"])/8,5)==a["final_mean_f1"]
assert a["final_mean_f1"]>a["baseline_mean_f1"]
assert a["pages"][3]["final_f1"]>a["pages"][3]["baseline_f1"]
assert a["pages"][4]["final_f1"]<a["pages"][4]["baseline_f1"]
fig=(r/"figures/ch7-transmission-mux-native.typ").read_text(encoding="utf-8")
assert "]))" not in fig, "Stray closing ) became visible in rendered SVG before this fix."
assert 'else if kind=="hiz" [（b）高阻态]' not in fig
for p in a["pages"]:
 n=p["pdf_page"]
 assert not p["accepted"]
 assert not s[n-1]["human_verified"] and not s[n-1]["figures_verified"]
 assert not q[n-1]["page_source_verified"]
print("PDF261–268 overlay regression tracked; strict full-page 1:1 accepted: zero.")
