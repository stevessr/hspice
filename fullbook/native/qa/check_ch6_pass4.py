#!/usr/bin/env python3
"""Source PDF213–220 verification landmarks, not full-page 1:1 acceptance."""
from pathlib import Path
import json,math
r=Path(__file__).resolve().parents[1]
d=json.loads((r/"qa/second-pass-p213-p220.json").read_text(encoding="utf8"))
s=json.loads((r/"page-status.json").read_text(encoding="utf8"))
q=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf8"))
assert d["source_pdf_pages"]==445 and d["full_page_accepted"]==0
assert [x["pdf_page"] for x in d["pages"]]==list(range(213,221))
check={
 213:("图6.4","图6.5","fig64","fig65","M_0","M_2"),
 214:("图6.6","6.3","1.6W","3.2W","20%","25%","fig66"),
 215:("(6.7)","(6.8)","(6.9)","C_(\"fanout\")","fig67"),
 216:("图6.8","6.3.2","cap-inverter-panel","C_(\"DBn\")"),
 217:("图6.9","图6.10","(6.10)","miller-panel","C_(\"eff\")"),
 218:("例6.2","40","55","1.9","2.2","ch6-example6-2-no-area.sp"),
 219:("44","59","0.8","0.7","(6.11)","C_(\"DB12\")","C_(\"SDB34\")","ch6-example6-2-with-area.sp"),
 220:("图6.11","例6.3","练习6.1","fig611","fig-example63")
}
for n, tokens in check.items():
    src=r/"web"/f"{n-23}-page-{n:03d}.typ"
    layout=r/"web"/f"{n-23}-page-{n:03d}-layout.typ"
    text=src.read_text(encoding="utf8")
    for t in tokens:
        assert t in text,(n,t)
    assert "#image(" not in text
    assert f'#include "{src.name}"' in layout.read_text(encoding="utf8")
    p=s["pages"][n-1]
    f=q["pages"][n-1]
    assert p["status"]==f["editorial_state"]=="partially-transcribed"
    assert p["human_verified"] is False
    assert p["layout_verified"] is False
    assert p["figures_verified"] is False
    assert f["page_source_verified"] is False
    assert not all(f["checks"].values())
    assert not d["pages"][n-213]["strict_page_accepted"]
fig=(r/"figures/ch6-pass4-native.typ").read_text(encoding="utf8")
for func in ("fig64","fig65","fig66","fig67","cap-inverter-panel",
             "miller-panel","fig611","fig-example63"):
    assert f"#let {func}(" in fig
assert math.isclose(1.6+2*.25,2.1)
assert math.isclose(2*.8,1.6)
assert math.isclose(4*.8,3.2)
assert math.isclose(250e-6*1.2,300e-6)
print("Source PDF213–220 math/topology landmarks present; 0/445 full-page accepted.")
