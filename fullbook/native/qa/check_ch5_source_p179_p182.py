#!/usr/bin/env python3
"""Source-scan landmarks PDF179–182; confirms native circuits, not page acceptance."""
from pathlib import Path
import json

root = Path(__file__).resolve().parents[1]
web = root / "web"
figures = (root / "figures/ch5-complex-sequential-native.typ").read_text(encoding="utf-8")
source = {
    page: (web / f"{page-23}-page-{page:03d}.typ").read_text(encoding="utf-8")
    for page in range(179, 183)
}

# The pair of source PDF179 '↔' symbols denotes *dual* transformations.
assert source[179].count('quad "↔" quad') == 2
assert '图5.12' in source[179] and 'aoi21' in source[179]
assert 'example53()' in source[180]
assert 'A B+C D' in source[180]

# The source PDF181 starts with the cross-page pseudo-NMOS figure, not a
# textual placeholder. One gate-tied-to-ground pMOS plus four nMOS devices.
pseudo = figures.split("#let pseudo-nmos-aoi22()=", 1)[1].split("#let xor-panel(", 1)[0]
assert pseudo.count("#vmos(") == 5
assert "#vmos(183pt,23pt,[0],p:true)" in pseudo
assert "#ground(141pt,37pt)" in pseudo
assert "#wire(157pt,37pt,141pt,37pt)" in pseudo
assert "#wire(110pt,150pt,252pt,150pt)" in pseudo
assert "#pseudo-nmos-aoi22()" in source[181]
assert source[181].rstrip().endswith("需"), "scan page boundary should not silently drop continuation"

# Source PDF182 resumes that exact term and contains Fig5.15's 8-device
# transistor implementation, including the critical middle NMOS crossbar.
assert '要注意的是' in source[182] and '下拉树' in source[182]
assert '图 5.14(b)' in source[182] and '多路选择器' in source[182]
assert '锁存器' in source[182] and '触发器' in source[182]
mux = figures.split("#let mux2() =", 1)[1].split("#let bistable() =", 1)[0]
assert mux.count("#vmos(") == 8, "CMOS MUX must have four pMOS plus four nMOS"
assert mux.count("p:true") == 4
assert "#wire(239pt,150pt,355pt,150pt)" in mux
assert "#node(296pt,150pt)" in mux
for gate in ('[$bar(a)$]', '[$bar(b)$]', '[$bar(s)$]', '[s]'):
    assert gate in mux, gate
assert "#mux2()" in source[182]
assert all("#image(" not in s for s in source.values())

status = json.loads((root / "page-status.json").read_text(encoding="utf-8"))
assert all(
    not status["pages"][i-1]["layout_verified"] and
    not status["pages"][i-1]["figures_verified"]
    for i in range(179, 183)
)
print("Source PDF179–182: native duality/AOI/pseudo-NMOS/MUX and continuation checks passed; strict full-page acceptance unchanged.")
