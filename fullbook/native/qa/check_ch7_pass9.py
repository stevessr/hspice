#!/usr/bin/env python3
"""Chapter7 source pages261–268 figure/mathematical landmarks; NOT whole page acceptance."""
import json,math
from pathlib import Path
r=Path(__file__).resolve().parents[1]
a=json.loads((r/"qa/source-audit-p261-p268.json").read_text(encoding="utf-8"))
status=json.loads((r/"page-status.json").read_text(encoding="utf-8"))["pages"]
qa=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["scope"]==[261,268] and a["source_pages"]==445
assert len(a["pages"])==8 and a["accepted_full_pages"]==0
expected={
261:("7.3","图7.7","fig77","soft errors"),
262:("7.3.1","图7.8","图7.9","fig78","fig79"),
263:("图7.10","图7.11","fig710","fig711","XNOR"),
264:("图7.12","图7.13","fig712","fig713"),
265:("例7.3","overline(B)","table.header","fig714"),
266:("7.3.2","图7.14","图7.15","fig714","fig715","R_(\"TG\")"),
267:("图7.16","fig716","I_(\"Dsat,n\")","I_(\"Dlin,n\")"),
268:("图7.17","fig717","(7.7)","(7.8)","(7.9)","0.83")
}
for n,tokens in expected.items():
 src=r/"web"/f"{n-23}-page-{n:03d}.typ"
 lay=r/"web"/f"{n-23}-page-{n:03d}-layout.typ"
 text=src.read_text(encoding="utf8")
 for token in tokens:
  assert token in text,(n,token)
 assert "#image(" not in text
 assert f'#include "{src.name}"' in lay.read_text(encoding="utf8")
 s=status[n-1];q=qa[n-1]
 assert s["status"]==q["editorial_state"]=="partially-transcribed"
 assert not s["human_verified"] and not s["layout_verified"]
 assert not q["page_source_verified"] and not all(q["checks"].values())
 assert not a["pages"][n-261]["strictly_accepted"]
fig=(r/"figures/ch7-pass9-native.typ").read_text(encoding="utf8")
for n in range(77,80):
 assert f"#let fig{n}(" in fig
for n in range(710,718):
 assert f"#let fig{n}(" in fig
assert math.isclose(2*12500*30000/(25000+30000),13636.3636,rel_tol=.00001)
assert math.isclose(12500*60000/(12500+60000),10344.8276,rel_tol=.00001)
assert math.isclose(.83*12.5,10.375)
print("PDF261–268 native source math and topology placeholders present; strict acceptance0/445.")
