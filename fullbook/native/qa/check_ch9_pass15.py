#!/usr/bin/env python3
"""PDF325–332 source formula and editing regression, not strict page acceptance."""
from pathlib import Path
import json, math
r=Path(__file__).resolve().parents[1]
a=json.loads((r/"qa/source-audit-p325-p332.json").read_text(encoding="utf-8"))
s=json.loads((r/"page-status.json").read_text(encoding="utf-8"))["pages"]
q=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["scope"]==[325,332] and a["strict_full_pages_accepted"]==0 and len(a["pages"])==8
tokens={325:("图9.3","练习9.1","figure9(3)"),326:("图9.4","figure9(4)","miss"),327:("图9.5","例9.1","150"),328:("240","320","560","9.3"),329:("图9.6","图9.7","figure9(6)"),330:("图9.8","图9.9","figure9(9)"),331:("例9.2","figure9(10)"),332:("图9.11","SEU")}
for n,words in tokens.items():
 text=(r/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
 assert all(x in text for x in words),(n,[x for x in words if x not in text])
 assert s[n-1]["status"]==q[n-1]["editorial_state"]=="partially-transcribed"
 assert not s[n-1]["human_verified"] and not all(q[n-1]["checks"].values())
 assert len(a["pages"][n-325]["source_scan_sha256"])==64
m=a["math"]
assert m["tag_fF"]/m["in_fF"]==m["ratio"]==150
assert math.isclose(150**0.25,3.5,abs_tol=0.02)
assert m["tag_delay_ps"]==240 and m["match_res_kOhm"]*m["match_fF"]==320
assert m["tag_delay_ps"]+m["match_delay_ps"]==m["total_ps"]==560
print("Pass15 CAM and FPGA source landmarks, timing, status OK; 0/445 accepted.")
