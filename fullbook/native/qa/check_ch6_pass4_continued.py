#!/usr/bin/env python3
"""Chapter 6 continuation PDF221..228: scan landmarks, no false 1:1 acceptance."""
from pathlib import Path
import json,math
root=Path(__file__).resolve().parents[1]
audit=json.loads((root/"qa/second-pass-p221-p228.json").read_text(encoding="utf8"))
status=json.loads((root/"page-status.json").read_text(encoding="utf8"))
qa=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf8"))
assert audit["source_pdf_pages"]==445 and audit["scope"]==[221,228]
assert len(audit["pages"])==8 and audit["strict_full_page_acceptance"]==0
landmarks={
221:("例6.3","13W","fig612","C_L+C_X+C_Y"),
222:("6.3.3","(6.12)","例6.4","9.6","1.2","10.8","(6.13)"),
223:("图6.13","图6.14","fig613","fig614","VTC"),
224:("图6.15","例6.5","fig615","斜波"),
225:("例6.5","t_r/4","t_(\"pHL,step\")"),
226:("(6.14)","(6.15)","fig616","0.7"),
227:("例6.6","例6.7","68","81","74.5","22.5","27","99","fig-inverter-4"),
228:("例6.7","练习6.2","6.2lambda","105","97.6","30","18.8")
}
for n,tokens in landmarks.items():
    item=status["pages"][n-1]
    f=qa["pages"][n-1]
    assert item["pdf_page"]==f["pdf_page"]==n
    assert item["status"]==f["editorial_state"]=="partially-transcribed"
    assert item["second_pass_ocr"] is True
    assert not item["human_verified"] and not item["layout_verified"]
    assert not f["page_source_verified"] and not all(f["checks"].values())
    src=root/"web"/f"{n-23}-page-{n:03d}.typ"
    lay=root/"web"/f"{n-23}-page-{n:03d}-layout.typ"
    text=src.read_text(encoding="utf8")
    for token in tokens:
      assert token in text,(n,token)
    assert "#image(" not in text
    assert f'#include "{src.name}"' in lay.read_text(encoding="utf8")
    assert not audit["pages"][n-221]["human_verified"]
assert math.isclose(4*2*(.4+.8),9.6)
assert math.isclose(9.6+1.2,10.8)
assert math.isclose(6.25e3*10.8e-15,67.5e-12)
assert math.isclose(7.5e3*10.8e-15,81e-12)
assert math.isclose(2*(22.5+27),99)
assert math.isclose((4*720/75)**.5,6.19677335,rel_tol=1e-8)
assert math.isclose(2*(18.8+30),97.6)
print("PDF221–228 source equations/figures and second-scan evidence OK, strict full-page acceptance 0.")
