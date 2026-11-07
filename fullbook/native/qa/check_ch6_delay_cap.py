#!/usr/bin/env python3
"""Scan-backed regression for Ch6 PDF208..220, without claiming full page acceptance."""
from pathlib import Path
import json,math
root=Path(__file__).resolve().parents[1]
audit=json.loads((root/"qa/second-pass-p208-p220.json").read_text(encoding="utf-8"))
meta=json.loads((root/"page-status.json").read_text(encoding="utf-8"))
fidelity=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))
assert audit["source_pdf_pages"]==445
assert audit["scope"]==[208,220]
assert len(audit["pages"])==13
assert audit["full_page_accepted"]==0
assert all(not x["accepted"] and not x["checks"]["full_text"] for x in audit["pages"])
assert audit["pages"][3]["normalized_similarity"]==0.5282
landmarks={
208:("高速 CMOS","6.1"),
209:("图6.1","figure-6-1","负传播延迟"),
210:("图6.2","图6.3","6.2","figure-6-2","figure-6-3"),
211:("(6.1)","(6.2)","(6.3)","(6.4a)","(6.4b)","(6.5a)","(6.5b)","0.34","0.6"),
212:("例6.1","14.5","33.5","12.5","30","(6.6)"),
213:("图6.4","图6.5","stacking"),
214:("图6.6","6.3","3.2W","1.6W"),
215:("(6.7)","(6.8)","(6.9)","load-components"),
216:("图6.8","图6.9","6.3.2"),
217:("图6.9","图6.10","(6.10)","米勒"),
218:("例6.2","40 ps","55 ps","1.9","2.2","inverter-chain"),
219:("例6.2","44 ps","59 ps","0.8","0.7","(6.11)"),
220:("图6.11","练习6.1","例6.3","nand3-network"),
}
for n,required in landmarks.items():
  s=meta["pages"][n-1]
  q=fidelity["pages"][n-1]
  a=audit["pages"][n-208]
  assert s["pdf_page"]==q["pdf_page"]==a["pdf_page"]==n
  assert s["status"]==q["editorial_state"]=="partially-transcribed"
  assert not s.get("human_verified",False)
  assert not all(q.get("checks",{}).values())
  name=f"{n-23}-page-{n:03d}"
  src=root/"web"/(name+".typ")
  layout=root/"web"/(name+"-layout.typ")
  assert src.is_file() and layout.is_file()
  body=src.read_text(encoding="utf-8")
  assert all(t in body for t in required),(n,[t for t in required if t not in body])
  assert "#image(" not in body
  assert f'#include "{name}.typ"' in layout.read_text(encoding="utf-8")
# Source image numerical invariants, independent of OCR agreement.
assert math.isclose(1.6+2*.25,2.1)
assert math.isclose(.5+2*.25,1)
assert math.isclose(40e-12/(.7*(12.5e3/10)*24),1.9047619e-15,rel_tol=1e-6)
assert math.isclose(55e-12/(.7*(30e3/20)*24),2.18253968e-15,rel_tol=1e-6)
assert math.isclose(1.2/(2*.7*60e-6),14.5e3,rel_tol=.03)
assert math.isclose(1.2/(2*.7*25e-6),33.5e3,rel_tol=.03)
print("PDF208–220: independent OCR, page geometry and key math landmark regressions passed; strict acceptance 0/445.")
