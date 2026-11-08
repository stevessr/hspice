#!/usr/bin/env python3
"""Pass11 scan-backed editable chapter 7 source/text/math/figure checks, not strict 1:1."""
from pathlib import Path
import json,math
root=Path(__file__).resolve().parents[1]
a=json.loads((root/"qa/source-audit-p277-p284.json").read_text(encoding="utf-8"))
s=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
f=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["source_pdf_pages"]==445 and a["scope"]==[277,284]
assert len(a["pages"])==8 and a["strict_full_pages_accepted"]==0
required={
 277:("图7.27","图7.28","fig727","fig728","多米诺"),
 278:("例7.7","fig-example77","xor","sum","overline"),
 279:("7.5.1","7.5.2","图7.29","fig729","5/3","2/3","0.8"),
 280:("图7.30","fig730","V^","C_x","保持器"),
 281:("图7.31","例7.8","fig731","fig-example78","AB+C"),
 282:("7.5.3","图7.32","fig732","0.8","5.42","1.08"),
 283:("图7.33","图7.34","例7.9","fig733","fig734"),
 284:("7.5.4","图7.35","fig735","fig-example79","自复位")
}
for n,words in required.items():
 assert a["pages"][n-277]["pdf_page"]==n
 assert len(a["pages"][n-277]["rendered_png_sha256"])==64
 body=(root/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
 layout=(root/"web"/f"{n-23}-page-{n}-layout.typ").read_text(encoding="utf-8")
 assert all(x in body for x in words),(n,[x for x in words if x not in body])
 assert f'#include "{n-23}-page-{n}.typ"' in layout
 assert "#image(" not in body
 assert s[n-1]["status"]==f[n-1]["editorial_state"]=="partially-transcribed"
 assert not s[n-1]["human_verified"] and not s[n-1]["layout_verified"]
 assert not f[n-1]["page_source_verified"]
 assert not all(f[n-1]["checks"].values())
 assert not a["pages"][n-277]["full_page_accepted"]
fig=(root/"figures/ch7-domino-continuation-native.typ").read_text(encoding="utf-8")
for name in ("fig727","fig728","fig-example77","fig729","fig730","fig731","fig-example78","fig732","fig733","fig734","fig-example79","fig735"):
 assert f"#let {name}(" in fig
assert math.isclose(20/12,5/3)
assert math.isclose(8/12,2/3)
assert math.isclose(math.sqrt(2/3),0.816496580927726)
assert math.isclose(0.8*1.2/(0.8+5),0.17,abs_tol=0.005)
q=5*1.2-0.8*0.73
assert math.isclose(q,5.42,abs_tol=0.005)
assert math.isclose(q/5,1.08,abs_tol=0.005)
print("Pass11: PDF277–284 editable native landmarks and source math checked; strict full pages 0/445")
