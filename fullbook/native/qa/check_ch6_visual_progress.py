#!/usr/bin/env python3
"""Source/SVG optical progress is diagnostic only: never turn F1 into acceptance."""
import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]
r=json.loads((root/"qa/visual-audit-p209-p212-pass3.json").read_text(encoding="utf-8"))
status=json.loads((root/"page-status.json").read_text(encoding="utf-8"))
matrix=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))
assert r["scope"]==[209,212] and len(r["pages"])==4
assert r["strict_fidelity_accepted_pages"]==0
for i,rec in enumerate(r["pages"]):
 n=209+i
 assert rec["pdf_page"]==n
 assert rec["accepted"] is False
 assert 0<=rec["initial_f1"]<=rec["math_display_spacing_round_f1"]<1
 assert status["pages"][n-1]["status"]=="partially-transcribed"
 assert status["pages"][n-1].get("layout_verified") is False
 assert matrix["pages"][n-1]["page_source_verified"] is False
 assert not all(matrix["pages"][n-1]["checks"].values())
print("PDF209..212 visual audit ledger consistent; zero pages certified 1:1.")
