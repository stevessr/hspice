#!/usr/bin/env python3
"""Require source and native-figure landmarks for PDF261–268 without 1:1 claims."""
from pathlib import Path
import json,math
r=Path(__file__).resolve().parents[1]
a=json.loads((r/"qa/second-pass-p261-p268.json").read_text(encoding="utf-8"))
s=json.loads((r/"page-status.json").read_text(encoding="utf-8"))["pages"]
q=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["scope"]==[261,268] and len(a["pages"])==8 and a["strict_accepted_pages"]==0
markers={
261:("7.3","图 7.7","fig77","电荷泄漏"),
262:("7.3.1","图 7.8","图 7.9","fig78","fig79","F=AS"),
263:("图 7.10","图 7.11","fig710","fig711","四选一"),
264:("图 7.12","图 7.13","fig712","fig713","错误"),
265:("例 7.3","fig-example73","overline(C)","真值表"),
266:("7.3.2","图 7.14","图 7.15","fig715","R_(\"on\")"),
267:("图 7.16","fig716","R_N","R_P","I_(\"Dlin,p\")"),
268:("(7.7)","(7.8)","(7.9)","fig717","0.83","1.1")
}
for n,tokens in markers.items():
 p=r/"web"/f"{n-23}-page-{n:03d}.typ"
 lay=r/"web"/f"{n-23}-page-{n:03d}-layout.typ"
 assert p.is_file() and lay.is_file()
 txt=p.read_text(encoding="utf-8")
 assert all(t in txt for t in tokens),(n,[t for t in tokens if t not in txt])
 assert "#image(" not in txt
 assert f'#include "{p.name}"' in lay.read_text(encoding="utf-8")
 assert s[n-1]["status"]==q[n-1]["editorial_state"]=="partially-transcribed"
 assert not s[n-1]["human_verified"] and not s[n-1]["layout_verified"]
 assert q[n-1]["page_source_verified"] is False
 assert not all(q[n-1]["checks"].values())
 assert a["pages"][n-261]["strictly_accepted"] is False
fig=(r/"figures/ch7-transmission-mux-native.typ").read_text(encoding="utf-8")
for f in ["fig77","fig78","fig79","fig710","fig711","fig712","fig713","fig714","fig-example73","fig715","fig716","fig717"]:
 assert "#let "+f+"(" in fig
assert math.isclose(25*30/(25+30),13.636363636,rel_tol=1e-6)
assert math.isclose((1*4.8)/(1+4.8),.827586,rel_tol=1e-5)
assert math.isclose(104/100,1.04)
prev=(r/"web"/"237-page-260.typ").read_text(encoding="utf-8")
assert "1.04" in prev and "16" in prev and "7.2.4" in prev
print("PDF260 source correction + PDF261–268 equation/figure landmarks present, strict 0/445.")
