#!/usr/bin/env python3
"""Regenerate print-ready Typst chapters and practice sheets from canonical Markdown.

Requires Pandoc >= 3.1. `content/` is the single source of course text.
The two Pandoc output aliases below need normalization for Typst 0.14.
"""
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parent.parent
CONTENT = ROOT / 'content'

pairs = [(CONTENT / '00-reading-guide.md', ROOT / 'typst' / 'reading-guide.typ')]
for group, target in [('chapters', 'sections'), ('appendices', 'appendices'), ('practice', 'practice')]:
    pairs.extend((source, ROOT/'typst'/target/(source.stem + '.typ'))
                 for source in sorted((CONTENT/group).glob('*.md')))
pairs.extend((source, ROOT/'typst'/'practice'/'answers'/(source.stem + '.typ'))
             for source in sorted((CONTENT/'practice'/'answers').glob('*.md')))

for source, target in pairs:
    target.parent.mkdir(parents=True, exist_ok=True)
    converted = subprocess.run(
        ['pandoc', '--from=markdown+pipe_tables+tex_math_dollars+fenced_code_blocks',
         '--to=typst', '--wrap=none', str(source)], capture_output=True, text=True
    )
    if converted.returncode:
        raise SystemExit(f'Pandoc error in {source}: {converted.stderr}')
    typst = (converted.stdout
             .replace('#blockquote[', '#quote(block: true)[')
             .replace('#horizontalrule', '#line(length: 100%)'))
    target.write_text('// GENERATED FILE -- edit Markdown and run scripts/sync_typst.py\n' + typst,
                      encoding='utf-8')
    print(f'{source.relative_to(ROOT)} -> {target.relative_to(ROOT)}')
