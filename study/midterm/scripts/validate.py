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

# Textbook chapters 1–4: ensure files, figures and all 48 answer pairs.
review = root / 'review-1to4'
wanted = ['index.md', 'reference.md', 'interactive.md'] + [
    f'{chapter:02d}-{kind}.md' for chapter in range(1, 5)
    for kind in ('notes', 'exercises', 'answers')
]
for name in wanted:
    page = review / name
    assert page.is_file(), f'Missing review page: {page}'
    body = page.read_text(encoding='utf-8')
    assert body.startswith('# '), f'Missing review title: {page}'
    for image in re.findall(r'!\[[^]]*\]\(([^)]+)\)', body):
        assert (page.parent / image).is_file(), f'Broken review image: {page} -> {image}'
for chapter in range(1, 5):
    qs = (review / f'{chapter:02d}-exercises.md').read_text(encoding='utf-8')
    answers = (review / f'{chapter:02d}-answers.md').read_text(encoding='utf-8')
    question_ids = re.findall(r'^\*\*(S[1-4]-\d{2})', qs, re.M)
    answer_ids = re.findall(r'^## (S[1-4]-\d{2})', answers, re.M)
    expected = [f'S{chapter}-{number:02d}' for number in range(1, 13)]
    assert question_ids == expected, f'Bad question IDs: {chapter}: {question_ids}'
    assert answer_ids == expected, f'Bad answer IDs: {chapter}: {answer_ids}'
# Chapter-specific interactive pages: preserve all original 48 plus 32 advanced.
wanted += ['advanced.md', 'textbook-examples.md', 'calculation-methods.md',
           'technology-tables.md', 'online-lab.md']
for item in ('ReviewLab.vue', 'lab-core.mjs'):
    assert (review / item).is_file(), f'Missing browser experiment source: {item}'
for ch in range(1, 5):
    base = f'{ch:02d}'
    q = review / f'advanced-{base}-exercises.md'
    a = review / f'advanced-{base}-answers.md'
    interactive = review / f'interactive-{base}.md'
    for page in (q, a, interactive):
        assert page.is_file(), f'Missing advanced chapter page: {page}'
        assert page.read_text(encoding='utf-8').startswith('# ')
    expected_advanced = [f'A{ch}-{j:02d}' for j in range(1, 9)]
    qids = re.findall(r'^## (A[1-4]-\d{2})', q.read_text(encoding='utf-8'), re.M)
    aids = re.findall(r'^## (A[1-4]-\d{2})', a.read_text(encoding='utf-8'), re.M)
    assert qids == expected_advanced, f'Advanced question mismatch for chapter {ch}: {qids}'
    assert aids == expected_advanced, f'Advanced answer mismatch for chapter {ch}: {aids}'
    body = interactive.read_text(encoding='utf-8')
    assert re.findall(r'^### (S[1-4]-\d{2})

from check_review_spice import validate_review_decks
validate_review_decks(root)

if '--generated' in sys.argv:
    expected = (['reading-guide.typ']
                + [f'sections/{f.stem}.typ' for f in sorted((content/'chapters').glob('*.md'))]
                + [f'appendices/{f.stem}.typ' for f in sorted((content/'appendices').glob('*.md'))]
                + [f'practice/{f.stem}.typ' for f in questions]
                + [f'practice/answers/{f.stem}.typ' for f in solutions])
    for path in expected:
        generated = root/'typst'/path
        assert generated.is_file(), f'Missing generated Typst file: {generated}'
        generated_text = generated.read_text(encoding='utf-8')
        assert generated_text.startswith('// GENERATED FILE'), generated
        for image_path in re.findall(r'#image\("([^"]+\.png)"', generated_text):
            assert (generated.parent / image_path).is_file(), f'Missing rasterized figure: {image_path}'
    print(f'OK: {len(files)} Markdown source files, {len(expected)} generated Typst files')
else:
    print(f'OK: {len(files)} Markdown source files and {len(questions)} practice sets')
, body, re.M) == [
        f'S{ch}-{j:02d}' for j in range(1, 13)], f'Lost original questions in {interactive}'
    assert re.findall(r'^### (A[1-4]-\d{2})

from check_review_spice import validate_review_decks
validate_review_decks(root)

if '--generated' in sys.argv:
    expected = (['reading-guide.typ']
                + [f'sections/{f.stem}.typ' for f in sorted((content/'chapters').glob('*.md'))]
                + [f'appendices/{f.stem}.typ' for f in sorted((content/'appendices').glob('*.md'))]
                + [f'practice/{f.stem}.typ' for f in questions]
                + [f'practice/answers/{f.stem}.typ' for f in solutions])
    for path in expected:
        generated = root/'typst'/path
        assert generated.is_file(), f'Missing generated Typst file: {generated}'
        generated_text = generated.read_text(encoding='utf-8')
        assert generated_text.startswith('// GENERATED FILE'), generated
        for image_path in re.findall(r'#image\("([^"]+\.png)"', generated_text):
            assert (generated.parent / image_path).is_file(), f'Missing rasterized figure: {image_path}'
    print(f'OK: {len(files)} Markdown source files, {len(expected)} generated Typst files')
else:
    print(f'OK: {len(files)} Markdown source files and {len(questions)} practice sets')
, body, re.M) == expected_advanced
    assert 'localStorage' in body and 'resetChapter' in body
for name in wanted:
    assert (review / name).is_file(), name
examples = (review / 'textbook-examples.md').read_text(encoding='utf-8')
for ch, total in ((2, 13), (3, 7), (4, 9)):
    for j in range(1, total + 1):
        assert f'| 例{ch}.{j} |' in examples, f'Missing textbook example {ch}.{j}'
assert 'online-lab' in (review / 'index.md').read_text(encoding='utf-8')


from check_review_spice import validate_review_decks
validate_review_decks(root)

if '--generated' in sys.argv:
    expected = (['reading-guide.typ']
                + [f'sections/{f.stem}.typ' for f in sorted((content/'chapters').glob('*.md'))]
                + [f'appendices/{f.stem}.typ' for f in sorted((content/'appendices').glob('*.md'))]
                + [f'practice/{f.stem}.typ' for f in questions]
                + [f'practice/answers/{f.stem}.typ' for f in solutions])
    for path in expected:
        generated = root/'typst'/path
        assert generated.is_file(), f'Missing generated Typst file: {generated}'
        generated_text = generated.read_text(encoding='utf-8')
        assert generated_text.startswith('// GENERATED FILE'), generated
        for image_path in re.findall(r'#image\("([^"]+\.png)"', generated_text):
            assert (generated.parent / image_path).is_file(), f'Missing rasterized figure: {image_path}'
    print(f'OK: {len(files)} Markdown source files, {len(expected)} generated Typst files')
else:
    print(f'OK: {len(files)} Markdown source files and {len(questions)} practice sets')
