#!/usr/bin/env python3
"""Chapter7 PDF269–276 scan-backed math/topology landmarks and strict QA gates."""
from pathlib import Path
import json, math
r=Path(__file__).resolve().parents[1]
a=json.loads((r/"qa/source-audit-p269-p276.json").read_text(encoding="utf-8"))
s=json.loads((r/"page-status.json").read_text(encoding="utf-8"))["pages"]
f=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["source_pdf_pages"]==445 and a["scope"]==[269,276] and a["strict_full_pages_accepted"]==0
assert len(a["pages"])==8
required={
269:("(7.10)","(7.11)","图7.18","fig718","t_(\"Elmore\")"),
270:("例7.4","MUX1","MUX2","mux-rc","29C_(\"eff\")","21C_(\"eff\")","9f C_g","6f C_g"),
271:("7.3.3","图7.19","图7.20","fig719","fig720","4/3","2/3"),
272:("例7.5","7.4","图7.21","fig721","8/3","5/3"),
273:("图7.22","fig722","TG1","TG2","INV2","反馈"),
274:("图7.23","图7.24","7.5","fig723","fig724","多米诺逻辑"),
275:("图7.25","例7.6","fig725","预充","求值","底管"),
276:("图7.26","fig726","多米诺级","M_P","M_N")
}
for n,words in required.items():
 body=(r/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
 layout=(r/"web"/f"{n-23}-page-{n}-layout.typ").read_text(encoding="utf-8")
 assert all(w in body for w in words),(n,[w for w in words if w not in body])
 assert f'#include "{n-23}-page-{n}.typ"' in layout
 assert "#image(" not in body
 assert s[n-1]["status"]==f[n-1]["editorial_state"]=="partially-transcribed"
 assert not s[n-1]["human_verified"] and not s[n-1]["layout_verified"]
 assert not f[n-1]["page_source_verified"] and not all(f[n-1]["checks"].values())
 assert not a["pages"][n-269]["full_page_accepted"]
fig=(r/"figures/ch7-latch-domino-pass9.typ").read_text(encoding="utf-8")
for name in ("fig718","mux-rc","fig719","fig720","fig721","fig722","fig723","fig724","fig725","fig726"):
 assert f"#let {name}(" in fig
# These identities detect the wrong C2 gate-cap coefficient found during scan review.
C1=(5,1,0)
C2=(6,2,0)
C3=(4,1,3)
t1=[C1[k]+2*C2[k]+3*C3[k] for k in range(3)]
assert t1==[29,8,9], t1
C4=(5,1,0)
C5=(8,1,3)
t2=[C4[k]+2*C5[k] for k in range(3)]
assert t2==[21,3,6], t2
assert math.isclose(4/3, (3*(4/3))/3)
assert math.isclose(4*2/3,8/3)
print("PDF269-276 original scan formula/figure landmarks OK; strict 1:1 accepted: 0/445.")
