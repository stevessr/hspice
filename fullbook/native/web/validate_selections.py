#!/usr/bin/env python3
"""Validate continuous Typst page-selection sources and page-size layouts."""
from pathlib import Path
import re
root=Path(__file__).resolve().parent
pages={}
for src in root.glob("*-page-???.typ"):
    match=re.fullmatch(r"(\d{2,3})-page-(\d{3})\.typ", src.name)
    assert match, src
    ordinal,page=map(int,match.groups())
    assert page==ordinal+23,src.name
    assert page not in pages,src.name
    assert re.search(rf"\b{page:03d}\b", src.read_text(encoding="utf-8")[:240]),src
    layout=src.with_name(src.stem+"-layout.typ")
    assert layout.is_file(),layout
    content=layout.read_text(encoding="utf-8")
    assert '#include "'+src.name+'"' in content,layout
    assert "506.8346pt" in content and "729.6pt" in content,layout
    pages[page]=src
assert sorted(pages)==list(range(26,147)),sorted(pages)
print("Native partial selections cover source pages 26..146, 121 pages; full-page acceptance 0")
