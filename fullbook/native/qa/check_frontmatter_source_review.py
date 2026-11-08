#!/usr/bin/env python3
"""Scan-backed text quality checks for source PDF pages 4–5 and 7–13.

These are editorial landmark checks, NOT a complete-page 1:1 acceptance gate.
The original 150-page source scan was reviewed manually on 2026-11-08.
"""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[1]
PAGES = ROOT / "web"
STATE = json.loads((ROOT / "page-status.json").read_text(encoding="utf-8"))["pages"]
FIDELITY = json.loads((ROOT / "qa/fidelity-status.json").read_text(encoding="utf-8"))

LANDMARKS = {
    4: ("2001 年 7 月间", "MIT 林肯实验室", "230 余种", "100 余种", "吴佑寿"),
    5: ("出 版 说 明", "2000 年至 2001 年间", "WTO", "电子工业出版社", "40 余种"),
    7: ("译　者　序", "0.18 μm", "0.13 μm", "SPICE", "蒋安平",
        "wangxa@szpku.edu.cn", "2005 年 8 月"),
    8: ("关 于 作 者", "David A. Hodges", "Horace G. Jackson",
        "Resve A. Saleh", "Daniel M. Tellep", "NSERC/PMC-Sierra"),
    9: ("第三版前言", "0.35 μm", "0.18 μm", "0.13 μm",
        "浅沟槽隔离", "铜互连", "逻辑强度", "BSIM3", "砷化镓"),
    10: ("为什么购买本书", "先进的 CMOS 工艺", "先进的主题",
         "如何使用本书", "15 周", "12 周", "10 周"),
    11: ("第 1 章", "第 2 章", "第 3 章", "第 4 章", "第 5 章",
         "第 6 章", "高速 CMOS 逻辑设计", "有用的"),
    12: ("公式。其中", "第 7 章", "第 8 章", "第 9 章", "第 10 章",
         "第 11 章", "Elmore", "RLC", "Ldi/dt"),
    13: ("致　谢", "Mark Horowitz", "Resve Saleh", "Pallab Chatterjee",
         "Anantha Chandrakasan", "Mona Elwakkad Zaghloul", "Don Pederson"),
}
assert FIDELITY["source_pages"] == len(STATE) == 445
assert FIDELITY["full_pages_accepted"] == 0
for n, needles in LANDMARKS.items():
    src = PAGES / f"{n:03d}-page-{n:03d}.typ"
    txt = src.read_text(encoding="utf-8")
    meta = STATE[n - 1]
    assert f"SOURCE PDF PAGE {n:03d}" in txt[:90], n
    assert "MACHINE-OCR DRAFT ONLY" not in txt, n
    assert "未校对机器文本" not in txt, n
    assert "#image(" not in txt, n
    assert all(q in txt for q in needles), (n, [q for q in needles if q not in txt])
    assert meta["pdf_page"] == n
    assert meta["status"] == "draft-transcribed"
    assert meta["proofread_round"] == "2026-11-08-frontmatter-manual-source-review"
    assert meta["editorial_typst_draft"] is True
    assert meta["source_scan_landmarks_checked"] is True
    assert meta["text_checked_against_scan"] is True
    assert meta["human_verified"] is False and meta["layout_verified"] is False
    assert FIDELITY["pages"][n-1]["editorial_state"] == "draft-transcribed"
    assert not all(FIDELITY["pages"][n-1]["checks"].values())
# The final sentence of chapter 6's preview is deliberately continued across scan pages.
one = (PAGES / "011-page-011.typ").read_text(encoding="utf-8")
two = (PAGES / "012-page-012.typ").read_text(encoding="utf-8")
assert one.rstrip().endswith("有用的")
assert "公式。其中" in two.split("==", 1)[0]
print("Source review: frontmatter PDF4–5 and PDF7–13 textual landmarks and cross-page continuation OK; full-page 1:1 acceptance remains 0/445.")
