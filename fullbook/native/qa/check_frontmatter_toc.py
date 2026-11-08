#!/usr/bin/env python3
"""Check native Typst front cover/title and original printed textbook contents."""
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
WEB = ROOT / "web"
PROGRESS = json.loads((ROOT / "page-status.json").read_text(encoding="utf-8"))
assert len(PROGRESS["pages"]) == PROGRESS["source_pdf_pages"] == 445

TOC_PAGES = (14, 15, 16, 17, 18, 19)
EXPECTED_ENTRIES = {14: 33, 15: 39, 16: 39, 17: 39, 18: 37, 19: 39}
EXPECTED_MAJOR = {
    "第1章": 1, "第2章": 28, "第3章": 68, "第4章": 108,
    "第5章": 148, "第6章": 189, "第7章": 235, "第8章": 273,
    "第9章": 303, "第10章": 335, "第11章": 367, "附录A": 400, "附录B": 414,
}
found = {}
for n in (*TOC_PAGES, 1, 2):
    src = WEB / f"{n:03d}-page-{n:03d}.typ"
    s = src.read_text(encoding="utf-8")
    item = PROGRESS["pages"][n-1]
    assert item["pdf_page"] == n
    assert item["status"] == "draft-transcribed"
    assert item["editorial_typst_draft"] is True
    assert item["source_scan_landmarks_checked"] is True
    assert item["human_verified"] is False and item["layout_verified"] is False
    assert f"SOURCE PDF PAGE {n:03d}" in s[:90]
    assert "MACHINE-OCR DRAFT ONLY" not in s
    layout = WEB / f"{n:03d}-page-{n:03d}-layout.typ"
    assert f'#include "{src.name}"' in layout.read_text(encoding="utf-8")
    if n == 1 or n == 2:
        for name in ("David A. Hodges", "Horace G. Jackson", "Resve A. Saleh"):
            assert name in s, (n, name)
        assert "电子工业出版社" in s
        continue

    assert "#table(" in s and "原书印刷页码" in s, n
    assert "stroke:none" in s and "table.header(" not in s, (n, "source TOC has no grid or artificial header")
    assert ("目　录" in s) == (n == 14), (n, "repeated TOC heading is absent in continuation scans")
    # Extract triple cells without invoking a Typst interpreter.
    rows = []
    for line in s.splitlines():
        matches = re.findall(r'\[#text\("([^"]+)"\)\]', line)
        if len(matches) == 3:
            rows.append((matches[0], matches[1], int(matches[2])))
    assert len(rows) == EXPECTED_ENTRIES[n], (n, len(rows))
    assert all(a and b and 1 <= p <= 425 for a,b,p in rows)
    nums = [p for _,_,p in rows]
    assert nums == sorted(nums), (n, "page number regression")
    for key, title, page in rows:
        if key in EXPECTED_MAJOR:
            assert key not in found, key
            found[key] = page
assert found == EXPECTED_MAJOR, (found, EXPECTED_MAJOR)
print("Front title + six scanned TOC pages: 226 source-checked entries, 11 chapter anchors + 2 appendices; accepted full pages still 0/445.")
