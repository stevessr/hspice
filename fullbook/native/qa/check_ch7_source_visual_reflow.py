#!/usr/bin/env python3
"""Actual PDF253–260 SVG optical score ledger; zero strict certification."""
import json
from pathlib import Path
r=Path(__file__).resolve().parents[1]
a=json.loads((r/"qa/visual-audit-p253-p260-source-reflow.json").read_text(encoding="utf8"))
p=json.loads((r/"page-status.json").read_text(encoding="utf8"))["pages"]
f=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf8"))["pages"]
assert a["scope"]==[253,260] and len(a["pages"])==8 and a["strict_accepted_full_pages"]==0
assert round(sum(x["current_f1"] for x in a["pages"])/8,5)==a["current_mean_f1"]
assert round(sum(x["current_f1"] for x in a["pages"] if x["pdf_page"]!=254)/7,5)==a["current_mean_excluding_gray_page254"]
assert a["pages"][0]["delta"]<0
for item in a["pages"]:
 n=item["pdf_page"]
 assert item["accepted"] is False and item["not_verified"]
 assert p[n-1]["status"]=="partially-transcribed"
 assert not p[n-1]["human_verified"] and not p[n-1]["layout_verified"]
 assert not f[n-1]["page_source_verified"] and not all(f[n-1]["checks"].values())
print("Source-PDF vs Typst-SVG PDF253–260 review metrics recorded; strict 1:1 accepted=0.")
