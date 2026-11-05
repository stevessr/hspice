#!/usr/bin/env python3
"""Compile Typst images in 20-page chunks, combine with chapter bookmarks."""
from pathlib import Path
import json,subprocess
from pypdf import PdfReader,PdfWriter
ROOT=Path(__file__).resolve().parent
subprocess.run(['python3',str(ROOT/'validate.py')],check=True)
m=json.loads((ROOT/'manifest.json').read_text(encoding='utf-8'))
parts=ROOT/'build'/'parts';parts.mkdir(parents=True,exist_ok=True)
writer=PdfWriter()
for part in m['chunks']:
    source=ROOT/part['file'];output=parts/(source.stem+'.pdf')
    subprocess.run(['typst','compile','--root',str(ROOT),str(source),str(output)],
        cwd=ROOT,check=True,timeout=180)
    pdf=PdfReader(str(output))
    assert len(pdf.pages)==part['end_page']-part['start_page']+1,str(source)
    writer.append(str(output))
assert len(writer.pages)==445
writer.add_outline_item('封面与前置页',0)
for chapter in m['chapters']:
    writer.add_outline_item(chapter['title'],chapter['start_pdf_page']-1)
dest=ROOT/'build'/'digital-ic-book-445pages-typst.pdf'
writer.add_metadata({'/Title':'数字集成电路分析与设计——第三版·视觉复刻',
    '/Subject':'Image-based facsimile; not editable book transcription'})
with dest.open('wb') as f:writer.write(f)
assert len(PdfReader(str(dest)).pages)==445
print('Typst compiled 445 page facsimile:',dest)
