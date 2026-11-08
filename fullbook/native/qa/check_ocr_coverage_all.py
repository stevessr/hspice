#!/usr/bin/env python3
"""Editable OCR page coverage, not 1:1 acceptance."""
from pathlib import Path
import json
r=Path(__file__).resolve().parents[1]
a=json.loads((r/"qa/ocr-draft-coverage.json").read_text(encoding="utf-8"))
s=json.loads((r/"page-status.json").read_text(encoding="utf-8"))["pages"]
q=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["source_pdf_pages"]==445 and a["machine_draft_pages"]==124
assert a["ocr_characters"]==118061 and a["strict_full_pages_accepted"]==0
assert [p["pdf_page"] for p in a["pages"]]==[*range(1,20),*range(341,446)]
for p in a["pages"]:
 n=p["pdf_page"]
 src=r/p["source_file"]
 assert src.is_file() and len(src.read_text(encoding="utf-8"))>80
 assert f"SOURCE PDF PAGE {n:03d}" in src.read_text(encoding="utf-8")[:150]
 assert "#image(" not in src.read_text(encoding="utf-8")
 assert s[n-1]["machine_ocr_characters"]==p["machine_ocr_characters"]
 assert s[n-1]["status"]==q[n-1]["editorial_state"]=="draft-transcribed"
 assert not s[n-1].get("human_verified",False) and not all(q[n-1]["checks"].values())
for n in range(20,341):assert s[n-1]["status"]=="partially-transcribed",n
assert all(x["status"]!="not-started" for x in s)
print("Editable Typst page sources: 445/445; editorial selection 321 + machine OCR 124, strict 1:1 0/445.")
