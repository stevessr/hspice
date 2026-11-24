#!/usr/bin/env python3
"""Chapter1 original scanned PDF20–23 content anchors (not full 1:1 geometry)."""
from pathlib import Path
r=Path(__file__).resolve().parents[1]/"web"
checks={
  20:("本章提要","1.1","1.9","VLSI","RTL","VHDL","Verilog","GDS-II","速度","功耗"),
  21:("MOS","NMOS","CMOS","GaAs","SiGe","TTL","ECL","SPICE","CAD","SSI","MSI","十微米"),
  22:("Moore's law","0.7","LSI","VLSI","1M","metal pitch","0.35","0.13","90 nm","65 nm","IR","短沟道"),
  23:("图 1.1","图 1.2","IBM","互连","CMOS","显微照片"),
}
names={20:"01",21:"02",22:"03",23:"04"}
for n,landmarks in checks.items():
  s=(r/f"{names[n]}-page-{n:03d}.typ").read_text(encoding="utf-8")
  assert "SOURCE PDF PAGE" in s, n
  assert not "Editable editorial excerpt" in s, n
  assert all(word in s for word in landmarks),(n,[word for word in landmarks if word not in s])
  assert "#image(" not in s
  print(f"PDF {n}: {len(landmarks)} original-scan landmarks retained in editable source.")
assert "unverified" in (r/"01-page-020.typ").read_text(encoding="utf-8")
assert "incomplete" in (r/"04-page-023.typ").read_text(encoding="utf-8")
print("No page given 1:1 acceptance; source micrograph image bytes absent.")

# 2026-11-24 original scan reflow: retain cross-page continuity and exact process terms.
import json
p20=(r/"01-page-020.typ").read_text(encoding="utf-8")
p21=(r/"02-page-021.typ").read_text(encoding="utf-8")
p22=(r/"03-page-022.typ").read_text(encoding="utf-8")
assert "制造工艺之\n" in p20 and "间进行适当的平衡" in p21
assert "间进行适当的平衡" not in p20
assert "SPICE#super[①]" in p21 and "$s$ 因子等比例地缩小" in p21
assert "二次镶嵌" in p22 and "一次镶嵌" not in p22
assert "重要处理能力" in p22 and "重复处理能力" not in p22
assert "以万计量的标准" in p22
assert "Verilog#super[①]" in p20 and "GDS-II 格式#super[②]" in p20
state=json.loads((r.parent/"page-status.json").read_text(encoding="utf-8"))
fidelity=json.loads((r.parent/"qa/fidelity-status.json").read_text(encoding="utf-8"))
audit=json.loads((r.parent/"qa/source-audit-p020-p022-reflow.json").read_text(encoding="utf-8"))
assert state["source_pdf_sha256"]==audit["source_pdf_sha256"]
for item in audit["pages"]:
    n=item["pdf_page"]
    assert state["pages"][n-1]["source_scan_landmarks_checked"]
    assert fidelity["pages"][n-1]["evidence"]["reference_scan_sha256"]==item["reference_scan_sha256"]
    assert not state["pages"][n-1]["layout_verified"]
    assert not fidelity["pages"][n-1]["page_source_verified"]
print("PDF20–22 scan reflow corrections retained; full-page acceptance remains pending.")
