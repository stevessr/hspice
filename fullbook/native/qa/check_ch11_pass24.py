#!/usr/bin/env python3
"""Ch11 clock distribution: scanned PDF405–406, printed 386–387."""
from pathlib import Path
import json
root=Path(__file__).resolve().parents[1]
a=json.loads((root/"qa/source-audit-p405-p406.json").read_text(encoding="utf-8"))
s=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
f=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["source_pdf_pages"] == 445 and a["scope"] == [405,406]
assert len(a["pages"]) == 2 and a["strict_full_pages_accepted"] == 0
for n, tokens in {
  405: ("SOURCE PDF PAGE 405", "图 11.29", "图 11.30", "特征阻抗", "source-to-sink", "胖时钟总线"),
  406: ("SOURCE PDF PAGE 406", "图 11.31", "图 11.32", "11.3.7", "门控时钟", "IR 压降", "RMS"),
}.items():
    x=(root/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
    assert all(t in x for t in tokens), (n, [t for t in tokens if t not in x])
    assert "MACHINE-OCR DRAFT ONLY" not in x and "#image(" not in x
    p,q=s[n-1],f[n-1]
    assert p["status"] == q["editorial_state"] == "draft-transcribed"
    assert p["editorial_typst_draft"] and p["source_scan_landmarks_checked"]
    assert p["proofread_round"] == "2026-11-08-ch11-clock-distribution-source-pass24"
    assert not p["human_verified"] and not p["layout_verified"]
    assert not all(q["checks"].values())
    assert len(a["pages"][n-405]["source_render_sha256"]) == 64
g=(root/"figures/ch11-clock-distribution-native.typ").read_text(encoding="utf-8")
assert all(f"#let fig11{n}()" in g for n in (29,30,31))
print("Pass24: scanned clock distribution PDF405–406 and editable native figure anchors checked; 0/445 full page accepted.")
