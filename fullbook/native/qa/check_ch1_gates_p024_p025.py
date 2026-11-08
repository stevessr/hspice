#!/usr/bin/env python3
"""Source-anchored PDF24-25 logic gates; HTML export must preserve all three tables."""
from pathlib import Path
root=Path(__file__).resolve().parents[1]/"web"
g=(root/"05-page-024.typ").read_text(encoding="utf-8")
a=(root/"06-page-025.typ").read_text(encoding="utf-8")
for anchor in ("表1.1","DSM 器件","DSM 互连","90 nm","65 nm","STI",
               "1.3.1","#gate-symbol(kind: \"inverter\")",
               "#gate-symbol(kind: \"nand\")","#gate-symbol(kind: \"nor\")",
               "*图1.3","浅沟槽隔离","电迁移","天线效应"):
  assert anchor in g,anchor
assert "#grid(" not in g, "HTML exporter ignores grids"
assert "#table(" in g
assert g.count("table.header(")==4
for anchor in ("A C + B C + A D + B D","(A+B)(C+D)","xor",
               "overline(B)","A S + B overline(S)","DeMorgan","(1.1)"):
  assert anchor in a,anchor
assert "SOURCE PDF PAGE 024" in g and "SOURCE PDF PAGE 025" in a
print("Chapter 1 PDF24–25: semantic gate tables, captions and source math anchors OK; full 1:1 not accepted.")
