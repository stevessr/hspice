#!/usr/bin/env python3
"""Keep source status, fidelity dashboard, and Typst page filenames in agreement.

The authoritative full-page acceptance rule is intentionally independent of OCR
completion, source coverage and successful Typst compilation.
"""
from pathlib import Path
import json
root = Path(__file__).resolve().parents[1]
source = json.loads((root / "page-status.json").read_text(encoding="utf-8"))
fidelity = json.loads((root / "qa/fidelity-status.json").read_text(encoding="utf-8"))
assert source["source_pdf_pages"] == 445
assert fidelity["source_pages"] == 445
assert len(source["pages"]) == len(fidelity["pages"]) == 445
for i, (a, b) in enumerate(zip(source["pages"], fidelity["pages"]), 1):
    assert a["pdf_page"] == b["pdf_page"] == i
    assert a["status"] == b["editorial_state"], (i, a["status"], b["editorial_state"])
    checks = b.get("checks", {})
    for key in fidelity["required_checks"]:
        assert checks.get(key) is True or checks.get(key) is False, (i, key)
    accepted = all(checks[k] is True for k in fidelity["required_checks"])
    if accepted:
        evidence = b.get("evidence", {})
        for key in ("reference_scan_sha256", "typst_source_sha256",
                    "reviewer", "reviewed_at", "comparison_notes"):
            assert evidence.get(key), (i, key)
        assert a["status"] == "verified", i
    else:
        assert a["status"] != "verified", i
for n in range(20, 269):
    stem = f"{n-23:02d}-page-{n:03d}" if n >= 26 else f"{n-19:02d}-page-{n:03d}"
    assert (root / "web" / f"{stem}.typ").is_file(), n
    assert (root / "web" / f"{stem}-layout.typ").is_file(), n
    assert source["pages"][n-1]["status"] == "partially-transcribed", n
assert fidelity["full_pages_accepted"] == 0, "Full-page acceptance must be evidence-backed"
print("Source progress and fidelity dashboard agree: scanned PDF pages 20–268 edited; strict 0/445 accepted.")
