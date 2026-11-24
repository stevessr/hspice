#!/usr/bin/env python3
"""Chapter7 source PDF253..260 editorial guard, no false 1:1 acceptance."""
import json,math
from pathlib import Path
root=Path(__file__).resolve().parents[1]
audit=json.loads((root/"qa/source-audit-p253-p260.json").read_text(encoding="utf-8"))
status=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
fid=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert audit["scope"]==[253,260] and audit["source_pdf_pages"]==445
assert len(audit["pages"])==8 and audit["strict_full_pages_accepted"]==0
tokens={
 253:("P6.14","P6.15","P6.16","90","45","22","FO4"),
 254:("第7章","7.1","7.2","7.3","绪论","动态"),
 255:("7.2.1","图7.1","fig71","V_(\"DD\")-V_(\"TN\")"),
 256:("图7.2","fig72","V_(\"TN\")","PMOS"),
 257:("7.2.2","图7.3","图7.4","fig73","feedthrough-panel"),
 258:("图7.5","(7.1)","(7.2)","(7.3)","例7.1","fig75"),
 259:("7.2.3","图7.6","0.73","0.05","0.2","-0.67","fig76"),
 260:("(7.4)","(7.5)","(7.6)","例7.2","0.2","0.6","1.0")
}
for n,expected in tokens.items():
 src=root/"web"/f"{n-23}-page-{n:03d}.typ"
 lay=root/"web"/f"{n-23}-page-{n:03d}-layout.typ"
 t=src.read_text(encoding="utf-8")
 for needle in expected:
  assert needle in t,(n,needle)
 assert "#image(" not in t and '#include "'+src.name+'"' in lay.read_text(encoding="utf-8")
 a=status[n-1];b=fid[n-1]
 assert a["pdf_page"]==b["pdf_page"]==n
 assert a["status"]==b["editorial_state"]=="partially-transcribed"
 assert not a["human_verified"] and not a["layout_verified"]
 assert not b["page_source_verified"] and not all(b["checks"].values())
 assert not audit["pages"][n-253]["accepted"]
fig=(root/"figures/ch7-pass-transistor-native.typ").read_text(encoding="utf-8")
for fn in ("fig71","fig72","fig73","feedthrough-panel","fig75","fig76","fig-p612","fig-p613"):
 assert "#let "+fn+"(" in fig
assert math.isclose(.05*1.2/(.05+.2),.24)
assert math.isclose(.25*1.2/(.25+.2),2/3)
assert all(math.isclose(c*1.2/(a+c),expected) for a,c,expected in ((100,20,.2),(20,20,.6),(20,100,1.)))
print("PDF253..260 chapter transition, source geometry and numerical QA: strict 0/445.")
