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
print("PDF20-25 editorial native Typst coverage checked; no full-page acceptance claimed.")
