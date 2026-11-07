#!/usr/bin/env python3
"""Chapter6 PDF245–252 source math/exercise QA; never auto-accept scanned pages."""
import json,math
from pathlib import Path
r=Path(__file__).resolve().parents[1]
data=json.loads((r/"qa/second-pass-p245-p252.json").read_text(encoding="utf-8"))
status=json.loads((r/"page-status.json").read_text(encoding="utf-8"))["pages"]
qa=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert data["scan_pages"]==[245,252] and len(data["pages"])==8 and data["strict_full_pages_accepted"]==0
assert data["known_print_inconsistencies"][0]["pdf_page"]==248
terms={
245:("6.6.3","图6.30","例6.15","分支强度","4.5","fig630"),
246:("例6.16","A=8","B=64","x","y","fig-example616"),
247:("6.7","17.7","5.1","18","旁路负载"),
248:('"LE"_i times "FO"_i times P_i',"C_(\"load\")","12.5","30","tau_(\"nand\")"),
249:("6.8","6.9","P6.1","P6.2","P6.3","H. Veendrick"),
250:("P6.4","P6.5","fig-p64","fig-p65","50 fF"),
251:("P6.6","P6.7","P6.8","P6.9","fig-p66","fig-p68","fig-p69"),
252:("P6.10","P6.11","P6.12","P6.13","fig-p69-cont","fig-p610","fig-p611")
}
for n,vals in terms.items():
 src=r/"web"/f"{n-23}-page-{n:03d}.typ"
 layout=r/"web"/f"{n-23}-page-{n:03d}-layout.typ"
 text=src.read_text(encoding="utf-8")
 assert all(x in text for x in vals),(n,[x for x in vals if x not in text])
 assert "#image(" not in text
 assert layout.exists() and f'#include "{src.name}"' in layout.read_text(encoding="utf-8")
 assert status[n-1]["status"]==qa[n-1]["editorial_state"]=="partially-transcribed"
 assert not status[n-1]["human_verified"] and not status[n-1]["layout_verified"]
 assert not qa[n-1]["page_source_verified"] and not all(qa[n-1]["checks"].values())
 assert data["pages"][n-245]["strictly_accepted"] is False
assert math.isclose((4/3)**3*6*4.5,64)
assert 3*4+3==15
assert math.isclose(64/16,4)
fig=(r/"figures/ch6-branch-exercises-native.typ").read_text(encoding="utf-8")
for name in ("fig630","fig-example616","fig-p64","fig-p65","fig-p66","fig-p68","fig-p69","fig-p611"):
 assert "#let "+name+"(" in fig
print("PDF245–252 source math, chapter exercises, and editorial gates checked; strict 0/445.")
