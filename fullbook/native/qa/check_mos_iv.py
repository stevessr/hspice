#!/usr/bin/env python3
"""Regression guards for the source-grounded editable MOS I–V editorial selections.

This verifies expected equation identifiers and source mappings, not full-book fidelity.
"""
from pathlib import Path
import json
import re

ROOT = Path(__file__).resolve().parents[1]
WEB = ROOT / "web"
STATUS = json.loads((ROOT / "page-status.json").read_text(encoding="utf-8"))
assert STATUS["source_pdf_pages"] == 445 and len(STATUS["pages"]) == 445
EXPECT = {
    58: ["表2.1", "例2.4", '+0.08 " V"', "2.10"],
    59: ["例2.5", "3.2 times 10^12", "2.4"],
    60: ["图2.8", "2.13", "2.14", "2.15", "2.16", "k'"],
    61: ["图2.9", "2.17a", "2.17b", "2.18", 'V_("Dsat")'],
    62: ["图2.10", "2.19", "2.20", "lambda"],
    63: ["2.5", '1.3 " V"', '0.6 " V"', "0.18"],
}
for n, markers in EXPECT.items():
    p = STATUS["pages"][n - 1]
    assert p["pdf_page"] == n, n
    assert p.get("status") == "partially-transcribed", n
    assert p.get("layout_verified") is False, n
    assert p.get("figures_verified") is False, n
    assert p.get("formulas_checked_against_scan") is True, n
    src = WEB / f"{n-23:02d}-page-{n:03d}.typ"
    layout = WEB / f"{n-23:02d}-page-{n:03d}-layout.typ"
    assert src.is_file() and layout.is_file(), n
    text = src.read_text(encoding="utf-8")
    assert all(marker in text for marker in markers), (n, [x for x in markers if x not in text])
    assert f"#include \"{src.name}\"" in layout.read_text(encoding="utf-8"), n
    assert not re.search(r"(?m)^\s*#image\s*\(", text), n
# Independently sanity-check the numerics used in the textbook examples.
oxide_cap=1.6e-6
implant_density=(oxide_cap*(0.4-0.08))/1.6e-19
assert abs(implant_density/3.2e12 - 1) < 1e-9
assert round(-0.99 + 0.88 + 0.188 - 0.002, 2) == 0.08
print("MOS scan-page editorial regression: 58-63 / equations 2.13-2.20 / status gates OK")
