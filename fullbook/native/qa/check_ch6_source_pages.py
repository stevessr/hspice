#!/usr/bin/env python3
"""Source-image third-pass landmarks for PDF209–212; editorial only."""
from pathlib import Path
import math, json
root=Path(__file__).resolve().parents[1]
status=json.loads((root/"page-status.json").read_text(encoding="utf-8"))
matrix=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))
landmarks={
 209: ("转变阈值电压","传播延迟","负传播延迟","50%点","10%","90%","V_(\"out\")","figure-6-1"),
 210: ("图6.2","图6.3","6.2","上拉","下拉","Delta V","figure-6-2","figure-6-3"),
 211: ("(6.1)","(6.2)","(6.3)","(6.4a)","(6.4b)","(6.5a)","(6.5b)","0.34","0.6","饱和状态"),
 212: ("例6.1","60","25","14.5","33.5","12.5","30","(6.6)","0.13","SPICE"),
}
for n,markers in landmarks.items():
 src=(root/"web"/f"{n-23}-page-{n:03d}.typ").read_text(encoding="utf-8")
 item=status["pages"][n-1]; gate=matrix["pages"][n-1]
 assert item["pdf_page"]==gate["pdf_page"]==n
 assert item["status"]=="partially-transcribed"
 assert item["source_text_manual_spotcheck"] is True
 assert not item["human_verified"] and not item["layout_verified"]
 assert all(x in src for x in markers),(n,[x for x in markers if x not in src])
 assert not all(gate["checks"].values()),n
 assert "#image(" not in src
fig=(root/"figures/ch6-propagation-faithful.typ").read_text(encoding="utf-8")
assert all(f"#let {name}(" in fig for name in ("trace","graph-panel","gate-chain","figure-6-1","rise-panel","figure-6-2","inverter-cell","figure-6-3"))
# Preserve source's two distinct resistance estimates (hand vs SPICE).
assert math.isclose((1.2/2)/(.7*60e-6),14.285714e3,rel_tol=1e-6)
assert math.isclose((1.2/2)/(.7*25e-6),34.285714e3,rel_tol=1e-6)
assert status["pages"][211]["status"]!="verified"
print("PDF209–212: original-scan paragraphs/math/figure landmarks structurally present, strict acceptance still 0.")
