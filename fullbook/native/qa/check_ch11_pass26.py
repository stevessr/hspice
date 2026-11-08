#!/usr/bin/env python3
"""Source scan assisted Typst audit: chapter 11 PDF409–418 PLL and exercises."""
import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]
a=json.loads((root/"qa/source-audit-p409-p418.json").read_text(encoding="utf8"))
pages=json.loads((root/"page-status.json").read_text(encoding="utf8"))["pages"]
fidelity=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf8"))["pages"]
assert a["scope"]==[409,418] and a["source_pdf_pages"]==445
assert len(a["pages"])==10 and a["strict_full_pages_accepted"]==0
expected={
409:("11.35","11.4.1","PLL","DLL"),
410:("11.36","11.37","PFD","feedback clock"),
411:("11.38","11.39","K_\"PD\"","F(s)"),
412:("11.9","11.40","G(s)","180°"),
413:("11.41","C_2","VCO","tau"),
414:("11.42","11.4.2","Alpha 21264"),
415:("11.43","11.44","11.5","Phaselock Techniques"),
416:("P11.1","P11.2","P11.3","400 μm"),
417:("P11.4","P11.5","P11.6","P11.7","0.6 ns"),
418:("P11.7","P11.8","P11.9","P11.10","10 mm"),
}
for n,anchors in expected.items():
    s=(root/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf8")
    assert f"SOURCE PDF PAGE {n}" in s[:100]
    assert "MACHINE-OCR DRAFT ONLY" not in s and "#image(" not in s
    assert all(k in s for k in anchors),(n,[k for k in anchors if k not in s])
    p,q=pages[n-1],fidelity[n-1]
    assert p["status"]==q["editorial_state"]=="draft-transcribed"
    assert p["editorial_typst_draft"] and p["source_scan_landmarks_checked"]
    assert p["proofread_round"]=="2026-11-08-ch11-pll-chapterend-source-pass26"
    assert not p["human_verified"] and not p["layout_verified"]
    assert not all(q["checks"].values())
    assert a["pages"][n-409]["pdf_page"]==n and len(a["pages"][n-409]["source_render_sha256"])==64
fig=(root/"figures/ch11-pll-summary-native.typ").read_text(encoding="utf8")
assert all(f"#let fig11{i}()" in fig for i in range(35,45))
exam=(root/"figures/ch11-exercises-native.typ").read_text(encoding="utf8")
assert all(f"#let figP{i}()" in exam for i in (112,113,114,116,117))
print("Pass26: PDF409–418 scanned PLL, DLL, references and problems source anchors verified; strict full-page 0/445.")
