#!/usr/bin/env python3
"""Import page-001.txt...page-445.txt into machine-draft editable Typst; never OCRs."""
from pathlib import Path
import argparse,json
p=argparse.ArgumentParser()
p.add_argument('--input',required=True,type=Path)
p.add_argument('--output',required=True,type=Path)
p.add_argument('--pages',type=int,default=445)
a=p.parse_args()
assert 1<=a.pages<=445
pages=a.output/'editable_pages'
chapters=a.output/'chapters'
pages.mkdir(parents=True,exist_ok=True)
chapters.mkdir(parents=True,exist_ok=True)
status=[]
for n in range(1,a.pages+1):
    inp=a.input/f'page-{n:03d}.txt'
    if not inp.is_file():raise SystemExit(f'Missing source page {n}: {inp}')
    raw=inp.read_text(encoding='utf-8')
    parts=[x.strip() for x in raw.replace('\r\n','\n').split('\n\n') if x.strip()]
    lines=[f'// SOURCE PDF PAGE {n:03d}; UNVERIFIED MACHINE OCR']
    lines.extend('#text('+json.dumps(x,ensure_ascii=False)+')' for x in parts)
    if not parts:lines.append('#text(fill: red)[No OCR text: inspect the source scan]')
    (pages/f'page-{n:03d}.typ').write_text('\n\n'.join(lines)+'\n',encoding='utf-8')
    status.append(dict(page=n,characters=len(raw),human_verified=False))
outline=[('front',1,19),('01',20,46),('02',47,86),('03',87,126),
('04',127,166),('05',167,207),('06',208,253),
('07',254,291),('08',292,321),('09',322,445)]
main=['#set document(title: "扫描教材机器转写 Typst 初稿")',
'#set page(width: 506.8346pt, height: 729.6pt, margin: (top: 35pt, bottom: 40pt, left: 44pt, right: 43pt))',
'#set text(font: ("Noto Serif CJK SC", "DejaVu Serif"), size: 9.5pt, lang: "zh")']
for name,lo,hi in outline:
    if lo>a.pages:break
    path=chapters/f'chapter-{name}.typ'
    body=[f'// SOURCE PDF PAGES {lo}-{min(hi,a.pages)}; OCR unverified']
    for n in range(lo,min(hi,a.pages)+1):
        if n>lo: body.append('#pagebreak()')
        body.append(f'#include "../editable_pages/page-{n:03d}.typ"')
    path.write_text('\n'.join(body)+'\n',encoding='utf-8')
    if lo>1: main.append('#pagebreak()')
    main.append(f'#include "chapters/{path.name}"')
(a.output/'main.typ').write_text('\n'.join(main)+'\n',encoding='utf-8')
(a.output/'page-status.json').write_text(json.dumps(dict(source_pages=a.pages,pages=status),ensure_ascii=False,indent=2),encoding='utf-8')
print(f'Generated {a.pages} editable OCR page files; human-verified 0.')
