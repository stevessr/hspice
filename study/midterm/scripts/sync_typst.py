#!/usr/bin/env python3
"""Generate chapter Typst from source Markdown using Pandoc >= 3.1.
Edit content/*.md, then run python3 scripts/sync_typst.py.
"""
from pathlib import Path
import subprocess
ROOT=Path(__file__).resolve().parent.parent
items=[(ROOT/'content'/'00-reading-guide.md', ROOT/'typst'/'reading-guide.typ')]
for kind,subdir in [('chapters','sections'),('appendices','appendices')]:
    items += [(f, ROOT/'typst'/subdir/(f.stem+'.typ')) for f in sorted((ROOT/'content'/kind).glob('*.md'))]
for src,dst in items:
    dst.parent.mkdir(parents=True,exist_ok=True)
    p=subprocess.run(['pandoc','--from=markdown+pipe_tables+tex_math_dollars+fenced_code_blocks','--to=typst','--wrap=none',str(src)],capture_output=True,text=True)
    if p.returncode: raise SystemExit(f'{src}: {p.stderr}')
    # Pandoc 3.1 emits #blockquote[...] but Typst 0.14 provides #quote.
    # Normalize the output instead of maintaining hand-edited generated chapters.
    typst = (p.stdout
             .replace('#blockquote[', '#quote(block: true)[')
             .replace('#horizontalrule', '#line(length: 100%)'))
    dst.write_text('// GENERATED FILE -- edit Markdown and run scripts/sync_typst.py\n'+typst,encoding='utf-8')
    print(f'{src.relative_to(ROOT)} -> {dst.relative_to(ROOT)}')
