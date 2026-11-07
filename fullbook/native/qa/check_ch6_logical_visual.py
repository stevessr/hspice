#!/usr/bin/env python3
"""Chapter6 PDF237–244 source-vs-SVG: require evidence without auto-acceptance."""
from pathlib import Path
import json
root=Path(__file__).resolve().parents[1]
r=json.loads((root/"qa/visual-audit-p237-p244.json").read_text(encoding="utf-8"))
status=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
qa=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert r["scope"]==[237,244] and len(r["pages"])==8 and r["full_page_strictly_accepted"]==0
assert round(sum(x["f1_before"] for x in r["pages"])/8,5)==r["baseline_mean_f1"]
assert round(sum(x["f1_after"] for x in r["pages"])/8,5)==r["final_mean_f1"]
assert r["pages"][5]["f1_after"]>r["pages"][5]["f1_before"]
for row in r["pages"]:
 n=row["pdf_page"]
 assert row["accepted"] is False
 assert not status[n-1]["human_verified"] and not status[n-1]["layout_verified"]
 assert not qa[n-1]["page_source_verified"]
print("Source PDF237–244 SVG audit recorded; strict pages accepted: 0")
