#!/usr/bin/env python3
"""Ensure PDF277–284 source math and native diagrams without falsely accepting 1:1."""
from pathlib import Path
import math
import json
root=Path(__file__).resolve().parents[1]
ledger=json.loads((root/"qa/source-audit-p277-p284-pass11.json").read_text(encoding="utf-8"))
status=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
fidelity=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert ledger["source_pdf_pages"]==445 and ledger["scope"]==[277,284]
assert ledger["strict_full_page_accepted"]==0 and len(ledger["pages"])==8
tokens={
277:("图7.27","图7.28","fig727","fig728","多米诺"),
278:("例7.7","fig-example77","Sum","overline","偏斜"),
279:("7.5.1","7.5.2","图7.29","fig729","5/3","2/3","0.8"),
280:("图7.30","图7.31","fig730","电荷共享","保持器","C_(\"out\")"),
281:("例7.8","图7.31","fig731","fig-example78","C_(\"GD\")"),
282:("7.5.3","图7.32","fig732","0.8","0.17","5 \" fF\"","1.08","0.73"),
283:("图7.33","图7.34","例7.9","fig733","fig734"),
284:("7.5.4","图7.35","fig735","自复位","后充")
}
for n,expected in tokens.items():
 bodyfile=root/"web"/f"{n-23}-page-{n:03d}.typ"
 layout=root/"web"/f"{n-23}-page-{n:03d}-layout.typ"
 body=bodyfile.read_text(encoding="utf-8")
 missing=[t for t in expected if t not in body]
 assert not missing,(n,missing)
 assert "#image(" not in body and "#image(" not in layout.read_text(encoding="utf-8")
 assert f'#include "{bodyfile.name}"' in layout.read_text(encoding="utf-8")
 assert status[n-1]["pdf_page"]==fidelity[n-1]["pdf_page"]==n
 assert status[n-1]["status"]==fidelity[n-1]["editorial_state"]=="partially-transcribed"
 assert not status[n-1]["human_verified"] and not status[n-1]["layout_verified"]
 assert not fidelity[n-1]["page_source_verified"]
 assert not all(fidelity[n-1]["checks"].values())
 assert not ledger["pages"][n-277]["strictly_accepted"]
diagram=(root/"figures/ch7-domino-advanced-native.typ").read_text(encoding="utf-8")
for name in ("fig727","fig728","fig-example77","fig729","fig730","fig731","fig-example78","fig732","fig733","fig734","fig735"):
 assert "#let "+name+"(" in diagram
discrepancy=ledger["known_source_arithmetic_discrepancy"][0]
assert discrepancy["pdf_page"]==282
assert math.isclose(1*40*.05+2*12*.05,3.2)
assert discrepancy["printed_result"]=="5 fF"
assert math.isclose((.8*1.2)/(.8+5),.1655172414,rel_tol=1e-7)
assert math.isclose((5*1.2-.8*.73)/5,1.0832)
assert (root/"web/259-page-282.typ").read_text(encoding="utf-8").count("5 \" fF\"")>=2
print("PDF277–284 source landmarks and math discrepancies recorded; 0 strict pages accepted.")
