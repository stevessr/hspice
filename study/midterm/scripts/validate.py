#!/usr/bin/env python3
"""Validate the canonical Markdown and optionally the generated Typst files."""
from pathlib import Path
import re
import sys

root = Path(__file__).resolve().parent.parent
content = root/'content'
core_files = sorted((content/'chapters').glob('*.md')) + sorted((content/'appendices').glob('*.md'))
assert len(core_files) == 15, f'Expected 9 chapters and 6 appendices, got {len(core_files)}'
questions = sorted((content/'practice').glob('[0-9]*.md'))
solutions = sorted((content/'practice'/'answers').glob('[0-9]*.md'))
assert len(questions) == len(solutions) == 5, (len(questions), len(solutions))
files = sorted(content.rglob('*.md'))
for source in files:
    data = source.read_text(encoding='utf-8')
    assert data.startswith('# '), f'Missing top-level heading: {source}'
    for rel in re.findall(r'!\[[^]]*\]\(([^)]+)\)', data):
        assert (source.parent / rel).exists(), f'Broken image: {source} -> {rel}'
    for rel in re.findall(r'\]\((\.{1,2}/[^)]+\.md)\)', data):
        assert (source.parent / rel).resolve().is_file(), f'Broken local link: {source} -> {rel}'

if '--generated' in sys.argv:
    expected = (['reading-guide.typ']
                + [f'sections/{f.stem}.typ' for f in sorted((content/'chapters').glob('*.md'))]
                + [f'appendices/{f.stem}.typ' for f in sorted((content/'appendices').glob('*.md'))]
                + [f'practice/{f.stem}.typ' for f in questions]
                + [f'practice/answers/{f.stem}.typ' for f in solutions])
    for path in expected:
        generated = root/'typst'/path
        assert generated.is_file(), f'Missing generated Typst file: {generated}'
        assert generated.read_text(encoding='utf-8').startswith('// GENERATED FILE'), generated
    print(f'OK: {len(files)} Markdown source files, {len(expected)} generated Typst files')
else:
    print(f'OK: {len(files)} Markdown source files and {len(questions)} practice sets')
