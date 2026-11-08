#!/usr/bin/env python3
"""Pass19: source-grounded coupling capacitance and Miller effect, PDF365–372."""
import json,math,re
from pathlib import Path
root=Path(__file__).resolve().parents[1]
a=json.loads((root/"qa/source-audit-p365-p372.json").read_text(encoding="utf-8"))
status=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
fidelity=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["source_pdf_pages"]==445 and a["scope"]==[365,372] and len(a["pages"])==8
assert a["strict_full_pages_accepted"]==0
expected={
365:("10.8","10.9","10.10","R_\"int\""),
366:("例10.4","20 mm","0.67","84","168","143"),
367:("10.4.1","图10.11","图10.12","70%"),
368:("10.11","图10.13","图10.14","0.03"),
369:("10.12","10.13","0.0070","0.070","0.025"),
370:("0.2","0.1","0.08","图10.16"),
371:("10.4.2","图10.17","图10.18","侵略者","受害者"),
372:("10.14","10.15","10.16","图10.19","3^n")}
for n,tokens in expected.items():
 src=(root/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
 assert "SOURCE PDF PAGE "+str(n) in src
 assert "MACHINE-OCR DRAFT ONLY" not in src and "#image(" not in src
 assert all(token in src for token in tokens),(n,[token for token in tokens if token not in src])
 p=status[n-1];q=fidelity[n-1]
 assert p["status"]==q["editorial_state"]=="draft-transcribed"
 assert p["editorial_typst_draft"] and p["source_scan_landmarks_checked"]
 assert p["proofread_round"]=="2026-11-08-source-scan-ch10-capacitance-pass19"
 assert not p["human_verified"] and not p["layout_verified"] and not all(q["checks"].values())
 assert len(a["pages"][n-365]["source_render_sha256"])==64
x=a["example104"]
assert math.isclose((90*(84+143)+(90+154)*(143+168))*7/1000000,x["elmore_ns"],abs_tol=.02)
assert x["segment_count"]==7 and x["size_multiplier"]==140
assert math.isclose(.035*(.8/.4),.070,rel_tol=1e-9)
assert a["source_text_discrepancy"]["printed"]=="0.0070 fF/μm"
assert a["source_text_discrepancy"]["downstream_pdf370_uses"]=="0.070 fF/μm"
f=(root/"figures/ch10-coupling-native.typ").read_text(encoding="utf-8")
assert all(f"#let fig10{i}()" in f for i in range(11,20))
# Additional source-checked line-delay segment is not an OCR summary.
p365 = (root/"web"/"342-page-365.typ").read_text(encoding="utf-8")
assert 't_"segment"' in p365 and 'C_"int" L/(2N)' in p365

print("Pass19 PDF365–372 source/figure/equation/numeric checks passed. Strict full-page accepted remains 0/445.")
