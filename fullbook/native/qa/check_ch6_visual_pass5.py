#!/usr/bin/env python3
"""Source-vs-SVG optical progression on PDF229–236; never auto-pass 1:1."""
import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]
audit=json.loads((root/"qa/visual-audit-p229-p236-pass5.json").read_text(encoding="utf-8"))
s=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
f=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert audit["scope"]==[229,236] and len(audit["pages"])==8
assert audit["strict_full_page_acceptance"]==0
assert round(sum(x["final_f1"] for x in audit["pages"])/8,5)==audit["mean_final_f1"]
assert audit["mean_final_f1"]>audit["mean_baseline_f1"]
assert audit["pages"][2]["improvement"]<0, "Page231 requires explicit regression tracking"
for i,p in enumerate(audit["pages"]):
 n=229+i
 assert p["pdf_page"]==n and not p["fully_accepted"]
 assert not p["text_by_character_verified"] and not p["original_figure_geometry_verified"]
 assert 0<=p["final_f1"]<1
 assert s[n-1]["status"]=="partially-transcribed"
 assert not s[n-1]["human_verified"] and not s[n-1]["layout_verified"]
 assert not f[n-1]["page_source_verified"]
 assert not all(f[n-1]["checks"].values())
print("PDF229-236 source-vs-SVG pixel audit: strict full-page acceptance zero.")
