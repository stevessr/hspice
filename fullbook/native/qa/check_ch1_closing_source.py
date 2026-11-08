#!/usr/bin/env python3
"""Scan-based Chapter 1 closing-page audit (PDF041–046), not 1:1 acceptance."""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[1]
WEB = ROOT / "web"
STATUS = json.loads((ROOT / "page-status.json").read_text(encoding="utf-8"))["pages"]
assert len(STATUS) == 445

pages = {}
for pdf_page in range(41, 47):
    name = f"{pdf_page-23:02d}-page-{pdf_page:03d}"
    source = WEB / f"{name}.typ"
    wrapper = WEB / f"{name}-layout.typ"
    assert source.is_file() and wrapper.is_file(), pdf_page
    src = source.read_text(encoding="utf-8")
    layout = wrapper.read_text(encoding="utf-8")
    assert "SOURCE PDF PAGE" in src.splitlines()[0], pdf_page
    assert "#set document(" in src, pdf_page
    assert "#image(" not in src, pdf_page
    assert f'#include "{name}.typ"' in layout, pdf_page
    assert "506.8346pt" in layout and "729.6pt" in layout, pdf_page
    assert STATUS[pdf_page-1].get("human_verified") is not True, pdf_page
    assert STATUS[pdf_page-1].get("layout_verified") is not True, pdf_page
    pages[pdf_page] = src

landmarks = {
    41: ("低 $k$", "SOI", "dual-gate", "L dif i / dif t",
         "2005 年", "2010 年", "58%", "21%", "图 1.21", "historical-trends"),
    42: ("图 1.22", "图 1.23", "58%/年", "21%/年",
         "50 M", "12.5 M", "12 500", "[35]", "SOC/IP", "UDL",
         "design-gap", "soc-concept", "数字信号处"),
    43: ("图 1.24", "1.7", "1.8", "参考文献", "Rabaey",
         "Weste", "Veendrick", "Keating", "理器（DSP", "soc-blocks"),
    44: ("P1.1", "P1.2", "P1.3", "P1.4", "P1.5", "P1.6", "P1.7",
         "overline(", "Gajski", "Wolf", "ITRS 2001", "table.header"),
    45: ("P1.7", "P1.8", "P1.9", "inverter-chain", "rc-step",
         "switch-capacitor", "12.5", "30", "100", "0.6", "1.2"),
    46: ("P1.10", "P1.11", "P1.12", "0.18", "0.13", "2 GHz",
         "30 GHz", "25 fF", "30 ps", "current-charge"),
}
for n, terms in landmarks.items():
    missing = [x for x in terms if x not in pages[n]]
    assert not missing, (n, missing)

# Chapters 1.7/1.8 and problem pages are continuous and in source order.
assert pages[41].index("图 1.21") < pages[41].index("58%")
assert pages[42].index("图 1.22") < pages[42].index("图 1.23")
assert pages[43].index("1.7") < pages[43].index("1.8")
for n, a, b in ((44, "P1.1", "P1.7"),
                (45, "P1.7", "P1.9"),
                (46, "P1.10", "P1.12")):
    assert pages[n].index(a) < pages[n].index(b), n

# The historical reference list is split exactly across original scanned pages.
for n in (1, 2, 3, 4):
    assert f"\\n{n}. " in pages[43], n
for n in (5, 6, 7, 8, 9):
    assert f"\\n{n}. " in pages[44], n
assert pages[44].count("table.header(") == 1
assert pages[44].count("overline(") >= 9

# Restore an originally interrupted word from the p42 -> p43 page break.
assert "数字信号处" in pages[42].split("#text(", 1)[0]
assert "理器（DSP" in pages[43].splitlines()[7:20].__str__()

# Exercises in the original textbook are questions only; worked solutions
# must live in separate study materials rather than in textbook page sources.
for text in (pages[45], pages[46]):
    for forbidden in ('50 " MHz"', 't_("path")', '0.5 " mA"',
                      '9.59 times 10^7', "R C ln 2"):
        assert forbidden not in text, forbidden

figure = (ROOT / "figures/chapter1-ending.typ").read_text(encoding="utf-8")
assert "#let switch-capacitor()" in figure
for required in ('R_1=30', 'R_2=12.5', 'C_("load")', 'V_("DD")=1.2'):
    assert required in figure, required
assert "#image(" not in figure

print("Chapter 1 source PDF041–046: ITRS/SOC references, source exercises, cross-page continuity and native figures OK; strict 1:1 status remains unverified.")
