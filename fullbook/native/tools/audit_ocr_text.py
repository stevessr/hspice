#!/usr/bin/env python3
"""Check page coverage. --require-proofread must fail for an unverified OCR draft."""
from pathlib import Path
import argparse,json,re,sys
p=argparse.ArgumentParser()
p.add_argument('directory',type=Path)
p.add_argument('--require-proofread',action='store_true')
a=p.parse_args()
root=a.directory
data=json.loads((root/'page-status.json').read_text(encoding='utf-8'))
n=data['source_pages']
assert len(data['pages'])==n
assert [r['page'] for r in data['pages']]==list(range(1,n+1))
for i in range(1,n+1):
    path=root/'editable_pages'/f'page-{i:03d}.typ'
    assert path.is_file()
    text=path.read_text(encoding='utf-8')
    assert f'PDF PAGE {i:03d}' in text
    assert '#image("pages/page-' not in text
refs='\n'.join(p.read_text(encoding='utf-8') for p in (root/'chapters').glob('chapter-*.typ'))
nums=sorted(int(x) for x in re.findall(r'page-(\d{3})\.typ',refs))
assert nums==list(range(1,n+1))
verified=sum(x.get('human_verified') is True for x in data['pages'])
print(f'OCR coverage: {n}/{n}; editorial verification: {verified}/{n}')
if a.require_proofread and verified!=n:
    sys.exit('The 445-page textbook is not fully proofread.')
