#!/usr/bin/env python3
"""PDF285–292 source scan-backed page and exercise anchors; strict 1:1 unaccepted."""
from pathlib import Path
import json
root=Path(__file__).resolve().parents[1]
s=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
a=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
q=json.loads((root/"qa/source-audit-p285-p292.json").read_text(encoding="utf-8"))
assert q["source_pdf_pages"]==445 and q["scope"]==[285,292]
assert len(q["pages"])==8 and q["strict_full_pages_accepted"]==0
check={
 285:("7.6","7.7","7.8","P7.1","P7.2","chain","C_f"),
 286:("P7.2","P7.3","figP72","figP73"),
 287:("P7.3","P7.4","P7.5","P7.6","P7.7","figP75"),
 288:("P7.7","P7.8","P7.9","figP77","figP78","50"),
 289:("P7.9","P7.10","P7.11","figP79","figP710"),
 290:("P7.11","P7.12","P7.13","P7.14","P7.15","figP711","figP713"),
 291:("图 P7.14","图 P7.15","figP714","figP715"),
 292:("第 8 章","8.1","半导体存储器","SRAM","DRAM","ROM")
}
for n,strings in check.items():
 src=(root/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
 lay=(root/"web"/f"{n-23}-page-{n}-layout.typ").read_text(encoding="utf-8")
 assert all(x in src for x in strings),(n,[x for x in strings if x not in src])
 assert f'#include "{n-23}-page-{n}.typ"' in lay
 assert "#image(" not in src
 assert s[n-1]["status"]==a[n-1]["editorial_state"]=="partially-transcribed"
 assert not s[n-1]["human_verified"] and not a[n-1]["page_source_verified"]
 assert len(q["pages"][n-285]["rendered_source_sha256"])==64
fig=(root/"figures/ch7-exercises-ch8-native.typ").read_text(encoding="utf-8")
for name in ("chain","figP72","figP73","figP75","figP77","figP78","figP79","figP710","figP711","figP713","figP714","figP715"):
 assert f"#let {name}(" in fig
print("Pass12: source scanned PDF285–292 anchors/figures/status valid; strict 0/445.")
