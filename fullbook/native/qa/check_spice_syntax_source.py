#!/usr/bin/env python3
"""Check source-scan-edited SPICE appendix A.3.1–A.3.3, PDF421–423.

Not a full fidelity certificate. Original source PDF is not committed or uploaded.
"""
from pathlib import Path
import json

root=Path(__file__).resolve().parents[1]
pages=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
anchors={
    421: ("A.3.1", "A.3.2", "paramname=realnumber", ".param Supply=1.8",
          ".lib 'bsim3v3.cmos.18um'", ".opt scale=0.1u", ".tran 50ps 5ns",
          ".plot tran v(3)", "Cload 3 0 10fF", "lambda", "7."),
    422: ("A.3.2", "Supply", ".param Supply=1.8", ".lib '../bsim3v3.cmos.18um'",
          ".opt scale=0.1um", ".opt scale = length", "Mn 3 2 0 0 nmos",
          "20lambda^2", "4lambda", "filepath"),
    423: ("A.3.3", "10 kΩ", "Vxxx", "Ixxx", "Rxxx", "Cxxx", "Lxxx", "Mxxx",
          "Dxxx", "L=0.2u W=0.4u", "8 个文字", "节点", "0"),
}
for n,terms in anchors.items():
    p=pages[n-1]
    src=(root/"web"/f"{n-23}-page-{n:03d}.typ").read_text(encoding="utf-8")
    assert all(w in src for w in terms),(n,[w for w in terms if w not in src])
    assert src.startswith(f"// SOURCE PDF PAGE {n}"),n
    assert "MACHINE-OCR DRAFT ONLY" not in src
    assert "#image(" not in src
    assert p["pdf_page"]==n and p["status"]=="draft-transcribed"
    assert p["proofread_round"]=="2026-11-08-appendix-spice-source-syntax-recheck"
    assert p["text_checked_against_scan"] is True
    assert p["human_verified"] is False and p["layout_verified"] is False
print("SPICE source appendix PDF421–423 syntax examples and native tables checked; final 1:1 approval remains outstanding.")
