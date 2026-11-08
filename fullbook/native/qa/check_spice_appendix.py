#!/usr/bin/env python3
"""Check scan-guided editable appendices without conflating selections with full-page acceptance."""
from pathlib import Path
import json
import re

ROOT = Path(__file__).resolve().parents[1]
WEB = ROOT / "web"
START, END = 419, 445
DATA = json.loads((ROOT / "page-status.json").read_text(encoding="utf-8"))
assert DATA["source_pdf_pages"] == len(DATA["pages"]) == 445

EXPECTED = {
    419: ("A.1", "A.2"),
    420: (".param Supply=1.8", ".tran 50ps 5ns", "Cload 3 0 10fF"),
    421: (".opt scale=0.1u", ".plot tran v(3)"),
    422: (".param Supply=1.8", ".opt scale=0.1um", "Mn 3 2 0 0 nmos"),
    423: ("Vxxx", "Ixxx", "Rxxx", "Cxxx", "Lxxx", "Mxxx", "Dxxx"),
    424: ("10^9", "10^6", "10^(-3)", "10^(-15)", "Meg"),
    425: ("Mn 2 3 0 0 nmos", "Vsupply 5 0 15"),
    426: ("PULSE", "PWL", "2ns 4ns 3ns 20ns 50ns"),
    427: ("R7", "17Megohms", "Cin", "Lbig", "MOSFET"),
    428: (".tran tstep tstop", "PMOS", "NMOS"),
    429: (".tran 1m 10m", ".dc var1 start stop step"),
    430: (".dc V1 0 10 1", "Vdrain", ".plot dc V(5)", ".print tran V(5)"),
    431: (".ic V(5)=1.8 V(7)=0", "uic", "IV Characteristic of NMOS"),
    432: ("图 A.12", "图 A.13", ".plot tran V(3)"),
    433: ("B.1", "B.12", "双极结型晶体管"),
    434: ("图 B.1", "图 B.2", "beta_F"),
    435: ("(B.1)", "(B.2)", "tau_F"),
    436: ("(B.3)", "(B.4.1a)", "肖特基"),
    437: ("(B.4.1b)", "(B.4.5)", "integral"),
    438: ("B.5", "V_(\"CC\")", "V_(\"CE\")"),
    439: ("(B.5.1)", "(B.5.4)", "beta_F"),
    440: ("(B.5.5)", "肖特基", "0.4"),
    441: ("B.7", "B.8", "TTL"),
    442: ("图 B.7", "B.9", "1.6 kΩ"),
    443: ("BP1", "BP2", "BP3", "B.10"),
    444: ("B.11", "B.12", "54/74 TTL", "10 ns"),
    445: ("ISBN", "7-121-01666-4", "本书特点"),
}
# Correct spelling should not relapse to obvious machine-OCR confusions.
BAD_TOKENS = ("MACHINE-OCR DRAFT ONLY", "pnos ", "W-0.4u", ".Eran ", "Vgatee ")
for n in range(START, END + 1):
    entry = DATA["pages"][n - 1]
    assert entry["pdf_page"] == n, (n, "page mapping")
    assert entry["status"] == "draft-transcribed", (n, entry["status"])
    assert entry["editorial_typst_draft"] is True, n
    assert entry["source_scan_landmarks_checked"] is True, n
    assert entry["human_verified"] is False and entry["layout_verified"] is False, n
    assert entry["figures_verified"] is False, n
    stem = f"{n - 23:02d}-page-{n:03d}"
    source = WEB / f"{stem}.typ"
    assert entry["source_file"] == f"web/{stem}.typ", (n, entry["source_file"])
    text = source.read_text(encoding="utf-8")
    assert f"SOURCE PDF PAGE {n}" in text[:120], n
    assert "#set document" in text, n
    assert all(token in text for token in EXPECTED[n]), (n, "missing source-checked token")
    assert not any(token in text for token in BAD_TOKENS), (n, "OCR corruption")
    assert not re.search(r"#image\([^)]*page-\d{3}\.(?:png|jpg)", text), n
    layout = WEB / f"{stem}-layout.typ"
    assert layout.is_file() and f'#include "{stem}.typ"' in layout.read_text(encoding="utf-8"), n

print(f"Appendix scan-guided editable drafts pass: {START}-{END} ({END-START+1} pages); full-page accepted: 0/445.")
