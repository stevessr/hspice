#!/usr/bin/env python3
"""Chapter 5 final-source-page scan evidence; do not accept full pages."""
from pathlib import Path
import json, math
root=Path(__file__).resolve().parents[1]
status=json.loads((root/"page-status.json").read_text(encoding="utf-8"))
record=json.loads((root/"qa/second-pass-p201-p207.json").read_text(encoding="utf-8"))
assert record["range"]==[201,207]
assert record["full_page_accepted"]==0
assert len(record["pages"])==7
landmarks={
201:("图5.31","图5.32","edp-rank","(3/2) V_T"),
202:("例5.9","32.4","36","130","5.10","W_(\"eq\")"),
203:("5.11","5.12","P5.1","P5.2","P5.3","P5.4","P5.5"),
204:("图P5.4","图P5.5","P5.6","2lambda","0.13"),
205:("P5.7","P5.8","P5.9","P5.10","P5.11","100","75"),
206:("P5.11","P5.12","P5.13","P5.14","200 MHz","80 fF"),
207:("P5.14","P5.15","P5.16","P5.17","P5.18","P5.19","rc-charge","jk-stimulus")
}
for n,tokens in landmarks.items():
 p=status["pages"][n-1]
 assert p["pdf_page"]==n and p["status"]=="partially-transcribed"
 assert p.get("second_pass_ocr") is True
 assert p.get("layout_verified") is False and p.get("figures_verified") is False
 assert not p.get("human_verified",False)
 stem=f"{n-23}-page-{n:03d}"
 src=root/"web"/(stem+".typ")
 layout=root/"web"/(stem+"-layout.typ")
 assert src.is_file() and layout.is_file()
 text=src.read_text(encoding="utf-8")
 assert all(t in text for t in tokens),(n,[t for t in tokens if t not in text])
 assert "#image(" not in text
 assert f'#include "{stem}.typ"' in layout.read_text(encoding="utf-8")
assert math.isclose(10e6*.1*20e-15*1.8**2*500e6,32.4)
assert math.isclose(50e6*.05*10e-15*1.2**2*1e9,36)
assert math.isclose(32.4*(2e-9)**2,129.6e-18)
assert math.isclose(36*(1e-9)**2,36e-18)
assert (3/2)*.4 == .6000000000000001 or math.isclose((3/2)*.4,.6)
assert min(p["normalized_similarity"] for p in record["pages"])<.7
figure=(root/"figures/ch5-ending-native.typ").read_text(encoding="utf-8")
assert all(f"#let {x}(" in figure for x in ("edp-rank","rc-charge","jk-stimulus"))
print("Source PDF201..207, chapter5 final exercises and EDP verified at landmarks; full acceptance 0/445.")
