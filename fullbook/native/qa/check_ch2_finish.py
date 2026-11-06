#!/usr/bin/env python3
"""Source grounded tests for chapter 2 end PDF 77–86, not a 1:1 visual gate."""
from pathlib import Path
import json
import math
import re

NATIVE=Path(__file__).resolve().parents[1]
WEB=NATIVE/"web"
STATUS=json.loads((NATIVE/"page-status.json").read_text(encoding="utf-8"))
assert STATUS["source_pdf_pages"]==445 and len(STATUS["pages"])==445
REQUIRED={
  77:["2.40","图2.20",'A_b = W Y'],
  78:["2.41","2.42",'A_("sw")','C_("eq")'],
  79:["2.43","2.44","2.45","例2.12",'0.22 " fF"'],
  80:["2.46","2.47","图2.21","0.16","0.18"],
  81:["例2.13","0.25","2.9","NMOS 电压"],
  82:["小结",'C_("GS")','C_("GD")','C_("GB")'],
  83:["2.10","2.11","表P2.1","P2.1","Springer-Verlag"],
  84:["P2.1","P2.2","P2.3","P2.4","P2.5"],
  85:["P2.6","P2.7","P2.8","300", "0.8"],
  86:["P2.9","P2.10","200", "400"],
}
for n, terms in REQUIRED.items():
    status=STATUS["pages"][n-1]
    assert status["pdf_page"]==n
    assert status["status"]=="partially-transcribed"
    assert status["figures_verified"] is False
    assert status["layout_verified"] is False
    src=WEB/f"{n-23:02d}-page-{n:03d}.typ"
    layout=WEB/f"{n-23:02d}-page-{n:03d}-layout.typ"
    assert src.is_file() and layout.is_file(), n
    text=src.read_text(encoding="utf-8")
    assert all(term in text for term in terms),(n,[term for term in terms if term not in text])
    assert '#image(' not in text, n
    assert "\\mathrm(" not in text, n
    lay=layout.read_text(encoding="utf-8")
    assert '#include "'+src.name+'"' in lay,n
    assert "506.8346pt" in lay and "729.6pt" in lay,n
# Preserve source-printing ambiguity without silently rewriting to conventional MOS formulae.
chapter_summary=(WEB/"59-page-082.typ").read_text(encoding="utf-8")
assert "原页印作" in chapter_summary
assert "alpha_1" in chapter_summary and "alpha_2" in chapter_summary
assert "beta_1" in chapter_summary and "beta_2" in chapter_summary
assert "排印疑点" in chapter_summary
# Example 2.12 numerical conservation, one-sided substrate step.
nominal=1.6*(.3+.05)*.4
small=nominal/math.sqrt(1+1.2)
keq=(2/1.2)*(math.sqrt(2.2)-1)
assert abs(nominal-.22)<.006
assert abs(small-.16)<.01
assert abs(keq-.8)<.01
assert abs(nominal*keq-.18)<.01
# Example 2.13 total overlap capacitance.
fringe=2*4*8.85e-14/math.pi*math.log1p(100)*1e11 # fF/um
assert abs(fringe-.1)<.01
assert abs(fringe+.15-.25)<.01
# Cross-page exercises are genuinely numbered P2.1 through P2.10.
exercise="".join((WEB/f"{n-23:02d}-page-{n:03d}.typ").read_text() for n in range(83,87))
for n in range(1,11):
    assert re.search(rf"\bP2\.{n}\b",exercise),n
print("Chapter 2 finish validated: pages77..86; formulas 2.40..2.47; examples 2.12/2.13; P2.1..P2.10")
