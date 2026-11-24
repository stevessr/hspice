#!/usr/bin/env python3
"""Chapter7 second scan PDF253–260; never turn landmarks into strict acceptance."""
from pathlib import Path
import json, math
r=Path(__file__).resolve().parents[1]
a=json.loads((r/"qa/source-rescan-p253-p260-20261108.json").read_text(encoding="utf-8"))
s=json.loads((r/"page-status.json").read_text(encoding="utf-8"))["pages"]
f=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert len(a["pages"])==8 and a["scope"]==[253,260]
assert a["source_pdf_pages"]==445 and a["strict_accepted_full_pages"]==0
assert len(a["key_equations"])==6
landmarks={
253:("图 P6.12","图 P6.13","P6.14","P6.15","P6.16","FO4","90","45","22"),
254:("第 7 章","7.1","7.2","7.3","7.8","high-impedance","high-Z"),
255:("7.2.1","图7.1","fig71","V_(\"DD\")-V_(\"TN\")","高阻态"),
256:("图7.2","fig72","V_(\"TN1\")","V_(\"TN2\")","V_(\"TN3\")"),
257:("图7.3","图7.4","feedthrough-panel","fig73","C_(\"gnd\")"),
258:("图7.5","(7.1)","(7.2)","(7.3)","例7.1","C_(\"gnd\")"),
259:("0.73","0.05","-0.67","图7.6","7.2.3","fig76"),
260:("(7.4)","(7.5)","(7.6)","例7.2","0.8","104","1.04")
}
for n,tokens in landmarks.items():
 path=r/"web"/f"{n-23}-page-{n:03d}.typ"
 typ=path.read_text(encoding="utf-8")
 for t in tokens: assert t in typ,(n,t)
 assert "#image(" not in typ
 assert (r/"web"/f"{n-23}-page-{n:03d}-layout.typ").exists()
 assert s[n-1]["status"]==f[n-1]["editorial_state"]=="partially-transcribed"
 assert s[n-1]["human_verified"] is False and f[n-1]["page_source_verified"] is False
 assert not all(f[n-1]["checks"].values())
 assert a["pages"][n-253]["accepted"] is False
fig=(r/"figures/ch7-pass-transistor-native.typ").read_text(encoding="utf-8")
for func in ("fig-p612","fig-p613","fig71","fig72","fig73","feedthrough-panel","fig75","fig76"):
 assert "#let "+func+"(" in fig
assert math.isclose(0.05*1.2/(0.05+0.2),0.24)
assert math.isclose(0.25*1.2/(0.25+0.2),2/3)
assert math.isclose((100*0+20*1.2)/120,.2)
assert math.isclose((20*0+20*1.2)/40,.6)
assert math.isclose((20*0+100*1.2)/120,1.0)
assert math.isclose(120-0.8*20,104)
assert math.isclose(104/100,1.04)
print("PDF253–260 second-source scan landmarks present; strict accepted pages remain zero.")
