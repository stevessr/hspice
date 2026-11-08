#!/usr/bin/env python3
"""Non-acceptance checks for scan-backed Chapter 1 PDF20–40."""
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
assert "overline(a+b)" in (w/"06-page-025.typ").read_text(encoding="utf-8")
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


# Pages PDF026–040: retain source page mapping and semantic details.
chapter1_sources = {}
for page in range(26, 41):
    stem = f"{page-23:02d}-page-{page:03d}"
    src = w / f"{stem}.typ"
    layout = w / f"{stem}-layout.typ"
    assert src.is_file() and layout.is_file(), page
    source = src.read_text(encoding="utf-8")
    wrapper = layout.read_text(encoding="utf-8")
    assert "#set document(" in source, page
    assert "#image(" not in source, page
    assert f'#include "{stem}.typ"' in wrapper, page
    assert "506.8346pt" in wrapper and "729.6pt" in wrapper, page
    chapter1_sources[page] = source

landmarks = {
  26: ("图1.4", "图1.5", "DFF", "0→1", "1→0", "excitation"),
  27: ("1.3.2", "图 1.6", "ideal-gate", "ideal-vtc", "fanout", "fanin"),
  28: ("1.3.3", "图1.7", '"NMH"', '"NML"', "V_(\"IH\")"),
  29: ("1.3.4", "t_(\"pHL\")", "t_(\"pLH\")", "50%", "10%", "90%", "transition-chart"),
  30: ("ISSCC", "图 1.9", "100 W", "1.4 倍", "power-scatter", "同时，逻辑门、"),
  31: ("存储器、时钟、模拟电路", '"(1.2)"', '"(1.3)"', '"(1.4)"', '"(1.5)"', "1.4.1"),
  32: ("1.4.1", "图 1.10", "多晶硅", "阈值电压", "重掺杂", "V_(\"GS\")",
       "V_(\"DS\")", "PMOS", "原书脚注", "mos-cross"),
  33: ("1.4.2", "图 1.11", "NMOS", "CMOS", "耗尽型器件", "稳态功耗",
       "R_L", "cmos-inverter"),
  34: ("图 1.12", "1.4.3", "深亚微米互连", "8 层", "0.35 μm",
       "图 1.13", "图 1.14", "resistor-inverter"),
  35: ("图 1.13", "图 1.14", "图 1.15", "RC", "IR 下降",
       "C_(\"small\")", "C_(\"large\")", "平方成正比", "wire-coupling", "rc-ir"),
  36: ("图 1.16", "图 1.17", "图 1.18", "时钟偏差", "clock skew",
       "10%", "0.25 μm", "0.18 μm", "低 $k$", "clock-tree"),
  37: ("图 1.17", "图 1.18", "图 1.19", "L dif i / dif t",
       "自感应", "互感应", "adjacent-buses", "rlcladder"),
  38: ("1.5", "ASIC", "GDS-II", "CAD", "RTL", "图 1.20",
       "定制 IC", "电路模", "design-cycle"),
  39: ("SPICE", "非线性直流", "1%", "±20%", "±50%",
       "100 ps", "100 ns", "i(t) = v(t) / R",
       "i(t) = C (dif v(t)) / (dif t)", "1.6"),
  40: ("ITRS", "表 1.2", "0.7", "OPC", "PSM", "10 Å", "高 $k$",
       "1 B", "4 B", "I_(\"off\")", "I_(\"on\")", "http://public.itrs.net"),

}
for page, required in landmarks.items():
    missing = [item for item in required if item not in chapter1_sources[page]]
    assert not missing, (page, missing)

# Check chapter 1 printed page 11 -> 12 continuation, not a fabricated restart.
p30 = chapter1_sources[30]
p31 = chapter1_sources[31]
assert "同时，逻辑门、" in p30 and "存储器、时钟、模拟电路" in p31
assert p30.index("1.3.5") < p30.index("图 1.9") < p30.index("同时，逻辑门、")
# CAD/SPICE printed page break must preserve the interrupted Chinese word.
assert "电路模" in chapter1_sources[38] and "拟器。" in chapter1_sources[39]
# A synthetic teaching summary table must not masquerade as textbook content.
assert "#table(" not in chapter1_sources[39]
assert chapter1_sources[39].index("i(t) = v(t) / R") < chapter1_sources[39].index("i(t) = C")
# 39->40 continues the original printed sentence across page boundary.
assert "在未来的几年" in chapter1_sources[39]
assert "中，工艺技术、设计技术" in chapter1_sources[40]
# Scan table 1.2 contains precisely nine milestone years and six native columns.
p40 = chapter1_sources[40]
for year in (1995, 1997, 1999, 2001, 2004, 2007, 2010, 2013, 2016):
    assert f"[{year}]" in p40, year
assert p40.count("table.header(") == 1


# Figure 1.5's printed eight-state excitation table must remain fully editable.
p26 = chapter1_sources[26]
assert p26.count("[0→1]") == 2 and p26.count("[1→0]") == 2
# No claimed full-page acceptance without visual evidence.
import json
state = json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
for page in range(26, 41):
    assert state[page-1].get("human_verified") is not True, page
    assert state[page-1].get("layout_verified") is not True, page

print("PDF20–40 scan-backed native Typst landmarks and cross-page continuity OK; no 1:1 acceptance claimed.")
