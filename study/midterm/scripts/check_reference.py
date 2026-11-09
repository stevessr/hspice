#!/usr/bin/env python3
"""Static checks for the textbook reference handbook used by VitePress."""
from pathlib import Path
import re

root = Path(__file__).resolve().parent.parent
base = root / 'reference'
pages = {
    'index': base / 'index.md',
    'terms-device-process': base / 'terms-device-process.md',
    'terms-circuits-systems': base / 'terms-circuits-systems.md',
    'data-tables': base / 'data-tables.md',
    'formulas-models': base / 'formulas-models.md',
    'formula-index': base / 'formula-index.md',
    'formula-index-systems': base / 'formula-index-systems.md',
}
text = {}
for key, path in pages.items():
    assert path.is_file(), f'missing reference page: {path}'
    text[key] = path.read_text(encoding='utf-8')
    assert text[key].startswith('# '), f'missing heading: {path}'
    assert '|' in text[key], f'expected tables: {path}'
    for target in re.findall(r'\]\((/reference/[^)#]*)(?:#[^)]*)?\)', text[key]):
        rel = target[len('/reference/'):].strip('/')
        page = base / (rel + '.md') if rel else base / 'index.md'
        assert page.exists(), f'broken /reference link: {path}: {target}'
def count_glossary(key):
    rows = 0
    for line in text[key].splitlines():
        if not line.startswith('| '):
            continue
        cells = line.strip('|').split('|')
        if len(cells) == 3 and '中文专业名词' not in line:
            rows += 1
    return rows
assert count_glossary('terms-device-process') == 193, count_glossary('terms-device-process')
assert count_glossary('terms-circuits-systems') == 186, count_glossary('terms-circuits-systems')
assert len(re.findall(r'^## 表 [A-I]：', text['data-tables'], re.M)) == 9
for term in ('1995 | 350', '2016 | 22', '585 μA/μm', '256 μA/μm', '2.0E−5', 'BSIM3v3'):
    assert term in text['data-tables'], f'missing source data sentinel: {term}'
config = (root / '.vitepress' / 'config.mts').read_text(encoding='utf-8')
assert "'/reference/':" in config
assert "{ text: '专业术语与数据', link: '/reference/' }" in config
print('Reference handbook OK: 193 + 186 = 379 glossary entries, 9 data tables and 5 pages')


# Validate exact textbook-print-to-PDF mapping in all formula-index rows.
formula_sources = {'formula-index': 97, 'formula-index-systems': 48}
formula_seen = 0
for key, expected in formula_sources.items():
    body = text[key]
    lines = [line for line in body.splitlines()
             if line.startswith('| **') and '/native-workbench?page=' in line]
    assert len(lines) == expected, (key, len(lines), expected)
    for line in lines:
        parts = [part.strip() for part in line.split('|')]
        assert len(parts) == 7, f'expected 5 table columns: {key}: {line[:100]}'
        assert parts[2].startswith('$') and parts[2].endswith('$'), line
        assert parts[2].count('$') == 2, f'broken display math: {line[:100]}'
        printed = int(parts[4])
        m = re.fullmatch(r'\[(\d+)\]\(/native-workbench\?page=(\d+)\)', parts[5])
        assert m, f'bad PDF page jump: {line[:100]}'
        assert int(m.group(1)) == int(m.group(2)) == printed + 19, line
        assert 1 <= printed <= 399, f'page outside textbook body: {printed}'
    formula_seen += len(lines)
assert formula_seen == 145
assert len(re.findall(r'^## 第 \d+ 章：', text['formula-index'] + text['formula-index-systems'], re.M)) == 11
assert "'/reference/formula-index'" in config
assert "'/reference/formula-index-systems'" in config
print('Formula index OK: 145 formulas, 11 chapters, print-to-PDF offset +19, and deep links')
