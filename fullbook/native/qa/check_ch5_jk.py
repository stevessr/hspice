#!/usr/bin/env python3
"""Proofread scan landmarks for PDF pages 187–188; partial pages only."""
from pathlib import Path
import json
root=Path(__file__).resolve().parents[1]
pages=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
landmarks={
187:("图5.19","图5.20","5.6.4","jk-truth","master-slave","一次锁存"),
188:("练习5.5","5.6.5","图5.21","建立时间","保持时间","edge-triggered-jk"),
}
for page,tokens in landmarks.items():
    p=pages[page-1]
    assert p["pdf_page"]==page and p["status"]=="partially-transcribed",page
    assert p.get("layout_verified") is False and p.get("figures_verified") is False
    assert not p.get("human_verified",False)
    name=f"{page-23}-page-{page:03d}"
    src=root/"web"/f"{name}.typ"
    layout=root/"web"/f"{name}-layout.typ"
    assert src.is_file() and layout.is_file(),page
    text=src.read_text(encoding="utf-8")
    missing=[value for value in tokens if value not in text]
    assert not missing,(page,missing)
    assert "#image(" not in text
    l=layout.read_text(encoding="utf-8")
    assert "506.8346pt" in l and "729.6pt" in l
    assert f'#include "{src.name}"' in l
fig=(root/"figures"/"ch5-jk-native.typ").read_text(encoding="utf-8")
assert all(token in fig for token in ("#let jk-truth()", "#let jk-symbol(", "#let jk-feedback()", "#let master-slave()", "#let edge-triggered-jk()"))
print("Ch5 PDF187-188 JK/master-slave/edge-triggered editorial landmark check OK; no full-page acceptance")
