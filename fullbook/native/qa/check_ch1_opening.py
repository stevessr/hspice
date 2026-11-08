#!/usr/bin/env python3
"""Non-acceptance checks for source-scanned pages 20-25."""
from pathlib import Path
import re
root=Path(__file__).resolve().parents[1]
w=root/"web"
for n in range(20,26):
    name=f"{n-19:02d}-page-{n:03d}"
    source=(w/f"{name}.typ").read_text(encoding="utf-8")
    wrapper=(w/f"{name}-layout.typ").read_text(encoding="utf-8")
    assert f"SOURCE PDF PAGE {n:03d}" in source
    assert "#image(" not in source
    assert f'#include "{name}.typ"' in wrapper
    assert "506.8346pt" in wrapper and "729.6pt" in wrapper
assert "overline(A+B)" in (w/"06-page-025.typ").read_text(encoding="utf-8")
assert "NAND" in (w/"05-page-024.typ").read_text(encoding="utf-8")
builder=(w/"build_html.py").read_text(encoding="utf-8")
for n in range(20,26):
    assert f'{n-19:02d}-page-{n:03d}' in builder

# PDF24 scan (printed p.5): original table 1.1 has six device rows,
# seven interconnect effects and three independently editable logic gates.
p24=(w/"05-page-024.typ").read_text(encoding="utf-8")
assert all(term in p24 for term in (
    "表1.1", "短沟道效应", "速度饱和", "薄氧化层", "亚阈值电流",
    "DIBL", "热载流子效应", "RC 延迟", "IR 降低",
    "电容耦合", "电感耦合", "电迁移", "天线效应",
    'gate-symbol(kind: "inverter")',
    'gate-symbol(kind: "nand")',
    'gate-symbol(kind: "nor")', "图1.3",
)), "Missing source-backed Table 1.1 or Fig. 1.3 labels"
assert p24.count("table.header(") == 4  # DSM table + INV/NAND/NOR truth tables
assert "#image(" not in p24
# PDF25: preserve the original algebraic order and De Morgan identity.
p25=(w/"06-page-025.typ").read_text(encoding="utf-8")
assert all(term in p25 for term in (
    "积之和", "和之积", "XOR", "XNOR", "MUX",
    "F = A C + B C + A D + B D",
    "F = (A+B)(C+D)",
    "A overline(B) + overline(A) B",
    "F = A S + B overline(S)",
    "overline(a+b)", "overline(a dot b)", '"(1.1)"',
))
assert p25.index("F = A C") < p25.index("F = (A+B)") < p25.index("F = A xor B")

print("PDF20-25 editorial native Typst coverage checked; no full-page acceptance claimed.")
