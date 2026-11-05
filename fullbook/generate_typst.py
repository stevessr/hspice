#!/usr/bin/env python3
"""Generate the 445-page Typst source and 23 compilation blocks."""
from pathlib import Path
import json
ROOT=Path(__file__).resolve().parent
starts=[20,47,87,127,167,208,254,292,322]
titles=['第1章 深亚微米数字集成电路设计','第2章 MOS晶体管','第3章 制造、版图和模拟',
'第4章 MOS反相器电路','第5章 静态MOS门电路','第6章 高速CMOS逻辑设计',
'第7章 传输门和动态逻辑设计','第8章 半导体存储器的设计','第9章 存储器设计中的其他课题']
def emit(a,b,rel):
    lines=['// Scanned-page visual facsimile; not editable body text.',
        '#set document(title: "数字集成电路分析与设计——深亚微米工艺（第三版）·视觉复刻")',
        '#set page(width: 506.8346pt, height: 729.6pt, margin: 0pt, fill: white)']
    for i in range(a,b+1):
        lines.append(f'#image("{rel}pages/page-{i-1:03d}.png", width: 506.8346pt, height: 729.6pt, fit: "stretch")')
        if i<b:lines.append('#pagebreak()')
    return '\n'.join(lines)+'\n'
def main():
    (ROOT/'chunks').mkdir(exist_ok=True)
    (ROOT/'main.typ').write_text(emit(1,445,''),encoding='utf-8')
    chunks=[]
    for first in range(1,446,20):
        last=min(first+19,445)
        file=f'chunks/{first:03d}-{last:03d}.typ'
        (ROOT/file).write_text(emit(first,last,'../'),encoding='utf-8')
        chunks.append(dict(file=file,start_page=first,end_page=last))
    obj=dict(source_pages=445,page_size_pt=[506.8346,729.6],
        mode='image-only visual Typst facsimile; not editable transcription',
        chapters=[dict(start_pdf_page=x,title=y) for x,y in zip(starts,titles)],chunks=chunks)
    (ROOT/'manifest.json').write_text(json.dumps(obj,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print('Generated 445 pages and',len(chunks),'Typst chunks')
if __name__=='__main__':main()
