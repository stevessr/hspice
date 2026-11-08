#!/usr/bin/env python3
"""Chapter8/9 PDF293–324 editable draft + scan-derived source landmarks; not 1:1."""
from pathlib import Path
import json
root=Path(__file__).resolve().parents[1]
qa=json.loads((root/"qa/source-audit-p293-p324.json").read_text(encoding="utf-8"))
pages=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
quality=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert qa["source_pdf_pages"]==445 and qa["scope"]==[293,324] and qa["strict_full_pages_accepted"]==0
assert len(qa["pages"])==32
must={
 293:("8.1.1","图8.1","256"), 294:("8.1.2","图8.2","SRAM"), 
 295:("8.1.3","Flash","EPROM"), 296:("8.2","图8.3","MOS"),
 297:("图8.4","图8.5"), 298:("图8.6","例8.1","FO4"),
 299:("8.3","8.3.1","图8.7"), 300:("图8.8","6T"),
 301:("图8.9","8.3.2"), 302:("图8.10","3～4"),
 303:("例8.2","200","mu"), 304:("8.3.3","图8.11"),
 305:("8.3.4","图8.12"), 306:("例8.3","8.4","8.4.1"),
 307:("图8.13","ATD"), 308:("图8.14","图8.15","8.4.2"),
 309:("图8.16","图8.17"), 310:("8.4.3","8.4.4","图8.18"),
 311:("图8.19","图8.20"), 312:("图8.20","V_(\"DD\")"),
 313:("图8.21","图8.22","t_(\"sense\")"),
 314:("图8.22","图8.23"), 315:("图8.23","图8.24","26"),
 316:("8.5","图8.25","图8.26"), 317:("图8.26","图8.27"),
 318:("8.6","8.7","8.8","P8.1"), 319:("P8.7","设计题1"),
 320:("图D8.2","FO4"), 321:("设计题2","HSPICE","180"),
 322:("第9章","9.1"), 323:("9.2","图9.1","CAM"), 324:("图9.2","CAM")
}
for n,marks in must.items():
 q=qa["pages"][n-293]
 assert q["pdf_page"]==n and len(q["scan_sha256"])==64
 stem=f"{n-23}-page-{n}"
 body=(root/"web"/(stem+".typ")).read_text(encoding="utf-8")
 layout=(root/"web"/(stem+"-layout.typ")).read_text(encoding="utf-8")
 assert all(m in body for m in marks),(n,[m for m in marks if m not in body])
 assert "#image(" not in body and f'#include "{stem}.typ"' in layout
 assert pages[n-1]["status"]==quality[n-1]["editorial_state"]=="partially-transcribed"
 assert not pages[n-1]["human_verified"] and not quality[n-1]["page_source_verified"]
 assert not q["full_page_accepted"] and not all(quality[n-1]["checks"].values())
fig=(root/"figures/ch8-sram-cam-native.typ").read_text(encoding="utf-8")
for name in ("memory-array","sram","decoder","sense","precharge","timing","columns","partition","cam","figure8","figure9"):
 assert f"#let {name}(" in fig
assert round((2*0.2)/2,1)==0.2 # 2pF x 0.2V / 2ns = 0.2mA
print("PDF293–324 source landmarks + editable diagrams/status OK; 0/445 full pages accepted.")
