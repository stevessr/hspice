#!/usr/bin/env python3
"""Scan-guided device-level schematic QA p179–181, beyond Boolean-text boxes."""
from pathlib import Path
r=Path(__file__).resolve().parents[1]
src=(r/"figures/ch5-complex-sequential-native.typ").read_text(encoding="utf-8")
for anchor in ("#let vmos(","#let aoi21()=", "#let example53()=", "#let xor-panel(",
               "#let xor-xnor()=","p:true","bar(a)","bar(b)","// PUN: A-B in series",
               "// PDN: C in series", "Two p-parallel groups in series",
               "ground(","vmos("):
    assert anchor in src,anchor
assert src.count("#vmos(")>=20 or src.count("vmos(")>20,"schematics lost transistor symbols"
for page,terms in {
  179:('" (5.5)"',"图5.12","对偶","NMOS","PMOS"),
  180:("例5.3","图5.13","example53","A B+C D","伪 NMOS"),
  181:("图5.14","5.4",'f_("XOR")','f_("XNOR")',"xor-xnor"),
}.items():
    s=(r/"web"/f"{page-23}-page-{page}.typ").read_text(encoding="utf-8")
    for term in terms:
        if term=='" (5.5)"': term='"(5.5)"'
        assert term in s,(page,term)
    assert "#image(" not in s,(page,"unexpected raster page")
import json
data=json.loads((r/"page-status.json").read_text(encoding="utf-8"))
assert not any(data["pages"][i-1]["layout_verified"] for i in (179,180,181))
print("p179–181: editable AOI21/AOI22 XOR/XNOR transistor topologies anchored; 1:1 not accepted")
