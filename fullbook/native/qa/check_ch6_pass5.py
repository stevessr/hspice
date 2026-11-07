#!/usr/bin/env python3
"""Scan landmarks for source PDF229..236: no automatic strict 1:1 acceptance."""
from pathlib import Path
import json, math
root=Path(__file__).resolve().parents[1]
audit=json.loads((root/"qa/second-pass-p229-p236.json").read_text(encoding="utf-8"))
source=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
q=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert audit["scope"]==[229,236] and len(audit["pages"])==8
assert audit["full_page_accepted"]==0
assert all(x["independent_psm6_status"]=="timed_out_not_available" for x in audit["pages"])
terms={
229:("6.5","6.5.1","图6.17","图6.18","图6.19","fig617","fig618","fig619"),
230:("6.5.2","(6.16)","(6.17)","(6.18)","fig620","FO4"),
231:("(6.19)","(6.20)","例6.8","7.5","0.5","图6.21","fig621"),
232:("(6.21)","(6.22)","(6.23)","fig622","sqrt","gamma"),
233:("图6.23","图6.24","例6.9","5.84","fig623","fig624"),
234:("6.5.3","例6.9","142.8","128","图6.25","fig625"),
235:("(6.24)","(6.25)","tau_(\"nand\")","tau_(\"nor\")","fig626"),
236:("例6.10","18.2","9.1","55","0.5","1.5","22","fig-example610")
}
for n, tokens in terms.items():
 s=root/"web"/f"{n-23}-page-{n:03d}.typ"
 layout=root/"web"/f"{n-23}-page-{n:03d}-layout.typ"
 body=s.read_text(encoding="utf-8")
 assert all(t in body for t in tokens),(n,[t for t in tokens if t not in body])
 assert "#image(" not in body
 assert layout.exists() and f'#include "{s.name}"' in layout.read_text(encoding="utf-8")
 item=source[n-1];f=q[n-1]
 assert item["pdf_page"]==f["pdf_page"]==n
 assert item["status"]==f["editorial_state"]=="partially-transcribed"
 assert not item["human_verified"] and not item["figures_verified"] and not item["layout_verified"]
 assert not f["page_source_verified"] and not all(f["checks"].values())
 assert audit["pages"][n-229]["strictly_accepted"] is False
fig=(root/"figures/ch6-path-sizing-native.typ").read_text(encoding="utf-8")
for name in ("fig617","fig618","fig619","fig620","fig621","fig622","fig623","fig624","fig625","fig626","fig-example610"):
 assert "#let "+name+"(" in fig
assert math.isclose(3*12500*2e-15*.1,7.5e-12,rel_tol=1e-10)
assert math.isclose(1/2,.5)
assert 5.84<200**(1/3)<5.86
assert 3.75<200**.25<3.77
assert math.isclose(3*7.5*(200**(1/3)+.5),142.84,rel_tol=5e-4)
assert math.isclose(4*7.5*(200**.25+.5),127.82,rel_tol=.001)
assert math.isclose((4*3*5*100)**(1/3),18.1712,rel_tol=2e-5)
assert 54<5*200/18.2<56
assert 9<3*(5*200/18.2)/18.2<9.2
print("Source PDF229–236 formulas and editable diagrams present; 0/445 strict acceptance.")
