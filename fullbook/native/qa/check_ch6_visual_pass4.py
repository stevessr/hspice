#!/usr/bin/env python3
"""Require visual-audit evidence without treating SVG overlap as acceptance."""
from pathlib import Path
import json
root=Path(__file__).resolve().parents[1]
ledger=json.loads((root/"qa/visual-audit-p213-p228-pass4.json").read_text(encoding="utf-8"))
p=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
f=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert ledger["scope"]==[213,228] and len(ledger["pages"])==16
assert ledger["source_pages"]==445 and ledger["full_pages_accepted"]==0
assert round(sum(x["post_refinement_visual_f1"] for x in ledger["pages"])/16,4)==ledger["post_refinement_mean_f1"]
for i,row in enumerate(ledger["pages"]):
 n=213+i
 assert row["pdf_page"]==n
 assert 0<=row["post_refinement_visual_f1"]<1
 assert row["human_accepted"] is False and row["layout_accepted"] is False
 assert row["source_text_fully_verified"] is False
 assert p[n-1]["status"]=="partially-transcribed"
 assert not p[n-1].get("human_verified",False)
 assert f[n-1]["page_source_verified"] is False
 assert not all(f[n-1]["checks"].values())
print("Source-vs-SVG pages 213–228: 16 page measurements, zero fully accepted.")
