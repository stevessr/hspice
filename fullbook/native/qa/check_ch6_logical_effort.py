#!/usr/bin/env python3
"""Text/math and source page provenance gates for logical effort PDF237–244."""
from pathlib import Path
import math,json
r=Path(__file__).resolve().parents[1]
a=json.loads((r/"qa/source-audit-p237-p244.json").read_text(encoding="utf-8"))
s=json.loads((r/"page-status.json").read_text(encoding="utf-8"))["pages"]
q=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["scope"]==[237,244] and len(a["pages"])==8 and a["strict_pages_accepted"]==0
terms={
 237:("6.6.1","逻辑强度","4/3","5/3","D=sum"),
 238:("图6.27","fig627","4/3","5/3","输入电容比"),
 239:("图6.28","表6.1","fig628","5/3","7/3","9/3","P_(\"nand\")"),
 240:("表6.2","例6.11","157.5","222.2","fig-example610"),
 241:("6.6.2","图6.29","例6.12","fig629","55","9.1"),
 242:("例6.12","2/3","4/3","le-panel"),
 243:("例6.13","400/90","1.45","9.3","fig613path"),
 244:("例6.14","13.3","fig614a","fig614b","14.5")
}
for n,expected in terms.items():
 src=r/"web"/f"{n-23}-page-{n:03d}.typ"
 lay=r/"web"/f"{n-23}-page-{n:03d}-layout.typ"
 text=src.read_text(encoding="utf-8")
 assert all(x in text for x in expected),(n,[x for x in expected if x not in text])
 assert "#image(" not in text
 assert lay.is_file() and f'#include "{src.name}"' in lay.read_text(encoding="utf-8")
 assert s[n-1]["pdf_page"]==q[n-1]["pdf_page"]==n
 assert s[n-1]["status"]==q[n-1]["editorial_state"]=="partially-transcribed"
 assert not s[n-1]["human_verified"] and not s[n-1]["layout_verified"]
 assert not q[n-1]["page_source_verified"] and not all(q[n-1]["checks"].values())
 assert not a["pages"][n-237]["accepted"]
fig=(r/"figures/ch6-logical-effort-native.typ").read_text(encoding="utf-8")
for fn in ("fig627","fig628","fig629","fig613path","fig614a","fig614b"):
 assert "#let "+fn+"(" in fig
assert math.isclose((4/3)*(5/3)*100,222.222222,rel_tol=1e-8)
assert 6<((4/3)*(5/3)*100)**(1/3)<6.1
assert (2/3+4/3)/2==1
assert math.isclose((400/90)**.25,1.4516,rel_tol=.001)
assert math.isclose(4*1.45+1+1.5+1,9.3)
assert math.isclose(7.5*(3*6+1+.5+1.5),157.5)
assert 13 < 4*((2)*(4/3)*10)**.25+4 <13.2
assert 13.2 < 4*((4/3)**2*(5/3)*10)**.25+4 < 13.5
print("PDF237–244 source logical effort quantities present; strict accepted pages remain 0.")
