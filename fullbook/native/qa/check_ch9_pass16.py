#!/usr/bin/env python3
"""Source-guided DRAM/ROM PDF333–340 checks. Not a strict 1:1 pass."""
from pathlib import Path
import json,math
root=Path(__file__).resolve().parents[1]
a=json.loads((root/"qa/source-audit-p333-p340.json").read_text(encoding="utf-8"))
s=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
q=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["scope"]==[333,340] and len(a["pages"])==8 and a["strict_full_pages_accepted"]==0
need={333:("9.4","9.4.1","图9.12"),334:("图9.13","9.4.2"),335:("图9.14","图9.15"),336:("图9.16","例9.3"),337:("0.55","0.45","图9.17"),338:("9.4.3","图9.18"),339:("9.5","9.5.1","图9.19"),340:("图9.20","NAND","NOR")}
for n,words in need.items():
 p=(root/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
 assert all(x in p for x in words),(n,[x for x in words if x not in p])
 assert s[n-1]["status"]==q[n-1]["editorial_state"]=="partially-transcribed"
 assert not s[n-1]["human_verified"] and not all(q[n-1]["checks"].values())
 assert len(a["pages"][n-333]["source_render_sha256"])==64
fig=(root/"figures/ch9-dram-rom-native.typ").read_text(encoding="utf-8")
for n in range(12,21): assert f"#let fig9{n}(" in fig
assert "figure9later" in fig
assert math.isclose((10*0.5+1)/11,0.55,abs_tol=0.01)
assert math.isclose((10*0.5)/11,0.45,abs_tol=0.01)
assert a["numeric"]["delta_reference_mV"]==90
print("Pass16 DRAM/ROM PDF333–340 native landmarks, source scan hashes and charge-sharing checked; 0/445 accepted.")
