#!/usr/bin/env python3
"""Chapter10 source-scan RC/Elmore edits PDF357–364, numerical regressions."""
from pathlib import Path
import math,json
r=Path(__file__).resolve().parents[1]
a=json.loads((r/"qa/source-audit-p357-p364.json").read_text(encoding="utf-8"))
s=json.loads((r/"page-status.json").read_text(encoding="utf-8"))["pages"]
q=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["source_pdf_pages"]==445 and a["scope"]==[357,364] and len(a["pages"])==8
assert a["strict_full_pages_accepted"]==0
marks={357:("10.2.2","10.3","10.4","10.5"),358:("图10.5","艾蒙"),359:("图10.6","例10.1","10.6"),360:("10.2.3","10.7","图10.7","图10.8"),361:("例10.2","14.8","92.5"),362:("例10.3","1080","1.3"),363:("图10.9","10.3"),364:("图10.10",'R_("eqn")')}
for n,words in marks.items():
 p=(r/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
 assert all(x in p for x in words),(n,[x for x in words if x not in p])
 assert s[n-1]["status"]==q[n-1]["editorial_state"]=="draft-transcribed"
 assert s[n-1]["editorial_typst_draft"] is True and s[n-1]["source_scan_landmarks_checked"] is True
 assert not s[n-1]["human_verified"] and not all(q[n-1]["checks"].values())
 assert len(a["pages"][n-357]["source_render_sha256"])==64
x=a["numerical_reference"]["example102"]
assert math.isclose(x["fanout_fF"]+x["self_fF"]+x["wire_fF"],x["load_fF"])
assert math.isclose(6.25*x["load_fF"],x["without_R_ps"])
assert math.isclose(6.25*3.2+(6.25+0.0054)*11.6,x["with_R_ps"],abs_tol=0.05)
y=a["numerical_reference"]["example103"]
assert math.isclose(0.027*(20000/0.5),y["wire_ohm"])
assert math.isclose(0.1*20000/1000,y["wire_pF"])
assert math.isclose(0.125*1+(0.125+1.08)*1,y["elmore_ns"],abs_tol=0.05)
assert "#let figure10more(" in (r/"figures/ch10-rc-elmore-native.typ").read_text(encoding="utf-8")
print("Pass18 RC/Elmore PDF357–364 math, figure and status landmarks passed; strict 0/445.")
