#!/usr/bin/env python3
"""Verify page coverage and exact 300dpi image dimensions."""
from pathlib import Path
import json
from PIL import Image
ROOT=Path(__file__).resolve().parent
m=json.loads((ROOT/'manifest.json').read_text(encoding='utf-8'))
assert m['source_pages']==445 and len(m['chunks'])==23
for i in range(445):
    f=ROOT/'pages'/f'page-{i:03d}.png'
    assert f.is_file() and f.stat().st_size>1000,str(f)
    with Image.open(f) as im:assert im.size==(2112,3040),(i,im.size)
src=(ROOT/'main.typ').read_text(encoding='utf-8')
assert src.count('#image(')==445
assert src.count('#pagebreak()')==444
for c in m['chunks']:
    txt=(ROOT/c['file']).read_text(encoding='utf-8')
    count=c['end_page']-c['start_page']+1
    assert txt.count('#image(')==count
    assert txt.count('#pagebreak()')==count-1
print('Verified all 445 pages, 23 chunks and original dimensions')
