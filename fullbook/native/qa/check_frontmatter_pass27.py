#!/usr/bin/env python3
"""Regression checks for front matter PDF003–013; not full-page acceptance."""
import json
import re
from pathlib import Path

root = Path(__file__).resolve().parents[1]
state = json.loads((root / "page-status.json").read_text(encoding="utf-8"))
fidelity = json.loads((root / "qa/fidelity-status.json").read_text(encoding="utf-8"))
audit = json.loads((root / "qa/source-audit-p003-p013.json").read_text(encoding="utf-8"))
assert audit["scope"] == [3, 13]
assert len(audit["pages"]) == 11
assert audit["source_pdf_pages"] == state["source_pdf_pages"] == fidelity["source_pages"]
assert audit["source_pdf_sha256"] == state["source_pdf_sha256"]
assert audit["strict_full_pages_accepted"] == 0
for n, record in enumerate(audit["pages"], 3):
    assert record["pdf_page"] == n
    assert re.fullmatch(r"[0-9a-f]{64}", record["source_render_sha256"])
    source = (root / "web" / f"{n:03d}-page-{n:03d}.typ").read_text(encoding="utf-8")
    assert f"SOURCE PDF PAGE {n:03d}" in source[:100]
    assert "MACHINE-OCR DRAFT ONLY" not in source
    page = state["pages"][n-1]
    assert page["pdf_page"] == n
    assert page["editorial_typst_draft"] and page["source_scan_landmarks_checked"]
    assert page["status"] == fidelity["pages"][n-1]["editorial_state"]
    assert not page["human_verified"] and not page["layout_verified"]
    assert not all(fidelity["pages"][n-1]["checks"].values())
p3 = (root / "web/003-page-003.typ").read_text(encoding="utf-8")
assert len(re.findall(r"(?<!\\)@phei\.com\.cn", p3)) == 0, "Unescaped email creates a Typst reference"
assert p3.count(r"\@phei.com.cn") == 2
print("Frontmatter scan-record structure, editorial states and escaped email regression passed.")
