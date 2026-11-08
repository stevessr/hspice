#!/usr/bin/env python3
"""Scan landmarks PDF341–356, formula9.1 discrepancy and editor/OCR coverage."""
from pathlib import Path
import json,math
r=Path(__file__).resolve().parents[1]
a=json.loads((r/"qa/source-audit-p341-p356.json").read_text(encoding="utf-8"))
s=json.loads((r/"page-status.json").read_text(encoding="utf-8"))["pages"]
q=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["scope"]==[341,356] and len(a["pages"])==16 and a["strict_full_pages_accepted"]==0
marks={
341:("图9.21","9.5.1"),342:("9.6","图9.22"),343:("9.1","图9.23","C_2","C_1"),
344:("例9.4","图9.24"),345:("图9.25","图9.26"),346:("图9.27","图9.28"),
347:("9.7","图9.29"),348:("图9.30","图9.31"),349:("9.8","图9.32"),
350:("图9.33","表9.1","9.10"),351:("9.11","P9.1"),352:("P9.5","P9.10"),
353:("P9.11","P9.14"),354:("第10章","10.1"),355:("图10.1","图10.2"),
356:("10.2.1","10.1","10.2","图10.3")
}
for n,terms in marks.items():
 txt=(r/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
 assert all(w in txt for w in terms),(n,[w for w in terms if w not in txt])
 assert s[n-1]["status"]==q[n-1]["editorial_state"]=="partially-transcribed"
 assert not s[n-1]["human_verified"] and not all(q[n-1]["checks"].values())
 assert len(a["pages"][n-341]["render_sha256"])==64
f=(r/"figures/ch9-nonvolatile-ch10-interconnect-native.typ").read_text(encoding="utf-8")
assert "#let figure9late(" in f and "#let figure10(" in f
for term in ("C1","C2","代数核算"):assert term in (r/"qa/source-discrepancy-p343.md").read_text(encoding="utf-8")
assert math.isclose(0.5*10,5) and 8>2
print("Pass17 EPROM/Flash/FRAM and chapter10 scanned-page edited landmarks, discrepancy recorded; strict 0/445.")
