#!/usr/bin/env python3
"""Verify recorded source-vs-SVG metrics but never certify a page based on F1."""
from pathlib import Path
import json
root=Path(__file__).resolve().parents[1]
a=json.loads((root/"qa/visual-audit-p253-p260.json").read_text(encoding="utf-8"))
s=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
q=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["scope"]==[253,260] and len(a["pages"])==8 and a["accepted_pages"]==0
assert round(sum(x["f1_baseline"] for x in a["pages"])/8,5)==a["mean_initial_f1"]
assert round(sum(x["f1_tuned"] for x in a["pages"])/8,5)==a["mean_tuned_f1"]
assert a["mean_tuned_f1"]>a["mean_initial_f1"]
for i,rec in enumerate(a["pages"]):
 n=i+253
 assert rec["pdf_page"]==n and not rec["fully_accepted"]
 assert not s[n-1]["human_verified"] and not s[n-1]["layout_verified"]
 assert not q[n-1]["page_source_verified"]
print("PDF253-260 SVG visual audit tracked; full 1:1 accepted = 0.")
