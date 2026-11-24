#!/usr/bin/env python3
"""Ch11 EM, industrial clock tree, and PLL/DLL: source pages 407–408."""
from pathlib import Path
import json
root=Path(__file__).resolve().parents[1]
src=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
f=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
a=json.loads((root/"qa/source-audit-p407-p408.json").read_text(encoding="utf-8"))
assert a["source_pdf_pages"]==445 and a["scope"]==[407,408] and len(a["pages"])==2
expected={
  407: ("SOURCE PDF PAGE 407","图 11.32","11.8","20 mA/μm²","J_(\"rms\")","11.33","11.34"),
  408: ("SOURCE PDF PAGE 408","图 11.33","图 11.34","11.4","锁相环","锁延迟环","RMS"),
}
for n,tokens in expected.items():
    text=(root/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
    assert all(t in text for t in tokens),(n,[t for t in tokens if t not in text])
    assert "MACHINE-OCR DRAFT ONLY" not in text and "#image(" not in text
    p,q=src[n-1],f[n-1]
    assert p["status"]==q["editorial_state"]=="draft-transcribed"
    assert p["editorial_typst_draft"] and p["source_scan_landmarks_checked"]
    assert p["proofread_round"]=="2026-11-08-ch11-em-pll-source-pass25"
    assert not p["human_verified"] and not p["layout_verified"]
    assert not all(q["checks"].values())
    assert len(a["pages"][n-407]["source_render_sha256"])==64
fig=(root/"figures/ch11-em-pll-native.typ").read_text(encoding="utf-8")
assert all(f"#let fig11{n}()" in fig for n in (32,33,34))
assert a["strict_full_pages_accepted"] == 0
print("Pass25: PDF407–408 native EM and PLL source records checked; no 1:1 page acceptance.")
