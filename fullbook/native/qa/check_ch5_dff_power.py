#!/usr/bin/env python3
"""Double-scan evidence + source-landmark QA; no page is fully accepted here."""
from pathlib import Path
import json
import math

root = Path(__file__).resolve().parents[1]
web = root / "web"
status = json.loads((root / "page-status.json").read_text(encoding="utf-8"))
evidence = json.loads((root / "qa/second-pass-p187-p200.json").read_text(encoding="utf-8"))
assert status["source_pdf_pages"] == 445
assert len(status["pages"]) == 445
assert evidence["full_page_accepted"] == 0
assert [x["pdf_page"] for x in evidence["pages"]] == list(range(187, 201))
assert min(x["normalized_similarity"] for x in evidence["pages"]) < 0.8
assert all(not x["full_page_accepted"] for x in evidence["pages"])

landmarks = {
  189: ["5.7", "图5.22", "图5.23", "d-symbol", "D锁存器"],
  190: ["图5.24", "图5.25", "d-master-slave", "t_(\"setup\")", "t_(\"clk-q\")"],
  191: ["图5.26", "图5.27", "图5.28", "Q_(\"next\")"],
  192: ["5.8.1", "\"(5.7)\"", "\"(5.8)\"", "\"(5.9)\"", "charge-discharge"],
  193: ["图5.29", "\"(5.10)\"", "例5.5", "25%", "(4/2)/8"],
  194: ["例5.6", "250 MHz", "40.5", "46.3", "300 ps", "200 ps"],
  195: ["图5.30", "\"(5.11)\"", "\"(5.12)\"", "\"(5.13)\"", "short-circuit-current"],
  196: ["例5.7", "NOR", "0.18", "nor-hazard"],
  197: ["例5.7", ".tran", ".plot", "5.8.2"],
  198: ["5.8.2", "\"(5.14)\"", "\"(5.15)\"", "\"(5.16)\"", "I_(\"sub\")"],
  199: ["5.8.3", "\"(5.17)\"", "\"(5.18)\"", "250", "300", "mu \"A\"", "mu \"W\""],
  200: ["5.9", "\"(5.19)\"", "\"(5.20)\"", "\"(5.21)\"", "\"(5.22)\"", "\"(5.23)\""],
}
for page, tokens in landmarks.items():
    item = status["pages"][page - 1]
    assert item["pdf_page"] == page
    assert item["status"] == "partially-transcribed"
    assert item.get("second_pass_ocr") is True
    assert not item.get("human_verified", False)
    assert item.get("layout_verified") is False
    assert item.get("figures_verified") is False
    path = web / f"{page - 23}-page-{page:03d}.typ"
    layout = web / f"{page - 23}-page-{page:03d}-layout.typ"
    assert path.is_file() and layout.is_file()
    src = path.read_text(encoding="utf-8")
    assert all(x in src for x in tokens), (page, [x for x in tokens if x not in src])
    assert "#image(" not in src, page
    assert f'#include "{path.name}"' in layout.read_text(encoding="utf-8")
# Critical numerical checks supported by the original scans.
assert math.isclose(50e-15 * 1.8 ** 2 * 250e6, 40.5e-6, rel_tol=1e-10)
assert math.isclose((46.3 - 40.5)/40.5, 0.143209876543, rel_tol=1e-8)
assert math.isclose((4/2)/8, 0.25)
assert math.isclose(250e-6 * 1.2, 300e-6, rel_tol=1e-10)
assert evidence["source_confirmed_corrections"][0]["canonical"] == "250 MHz"
assert evidence["source_confirmed_corrections"][2]["canonical"] == "250 μA / 300 μW"
fig = (root/"figures/ch5-dff-power-native.typ").read_text(encoding="utf-8")
for item in ("d-symbol", "d-master-slave", "flipflop-timing", "charge-discharge", "short-circuit-current", "nor-hazard"):
    assert f"#let {item}(" in fig
print("Ch5 PDF187–200: double OCR + formula/figure source landmarks OK; 0 full pages accepted.")
