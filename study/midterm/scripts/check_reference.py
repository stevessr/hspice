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
    'figures': base / 'figures.md',
    'figures-catalog': base / 'figures-catalog.md',
}
text = {}
for key, path in pages.items():
    assert path.is_file(), f'missing reference page: {path}'
    text[key] = path.read_text(encoding='utf-8')
    assert text[key].startswith('# '), f'missing heading: {path}'
    if key != 'figures':
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
assert "{ text: '速查', items: [" in config
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
assert set(re.findall(r'^## 第 (\d+) 章：', text['formula-index'] + text['formula-index-systems'], re.M)) == {str(i) for i in range(1, 12)}
assert "'/reference/formula-index'" in config
assert "'/reference/formula-index-systems'" in config
print('Formula index OK: 145 formulas, 11 chapters, print-to-PDF offset +19, and deep links')


# Verify the generated visual-index data (built from the 445 native page drafts).
import json
figure_data = json.loads((root / 'public' / 'figure-index.json').read_text(encoding='utf-8'))
assert figure_data['format'] == 'hspice-textbook-figure-index-v1'
figures = figure_data['entries']
assert figure_data['total'] == len(figures)
assert len(figures) >= 30, f'suspiciously few figure captions: {len(figures)}'
assert len({f['number'] for f in figures}) == len(figures), 'duplicate figure numbers'
chapters = {str(f['chapter']) for f in figures}
assert len(chapters & {str(i) for i in range(1, 12)}) >= 8, chapters
for fig in figures:
    assert fig['pdf_page'] == fig['printed_page'] + 19, fig
    assert 20 <= fig['pdf_page'] <= 445, fig
    assert isinstance(fig['title'], str) and fig['title'], fig
    assert (root.parent.parent / 'fullbook' / 'native' / 'web' / fig['typst']).is_file(), fig
    assert fig['preview'] == fig['typst'].removesuffix('.typ') + '-layout.svg', fig
assert "'/reference/figures'" in config
assert "'/reference/figures-catalog'" in config
assert '/reference/figures-catalog' in text['figures']
catalog = text['figures-catalog']
for fig in figures:
    assert '图 ' + fig['number'] in catalog, fig['number']
print(f'Figure index OK: {len(figures)} unique figure captions and {len(chapters)} groups')


# Keep the global navigation compact and runtime tools discoverable.
nav = config.split('    nav: [', 1)[1].split('    sidebar: {', 1)[0]
top_level_nav = re.findall(r"^      \{ text: '([^']+)'", nav, re.M)
assert top_level_nav == ['首页', '学习', '速查', '练习', '工具箱'], top_level_nav
assert 'socialLinks:' in config and 'github.com/stevessr/hspice' in config
assert 'const toolsSidebar = [' in config
tool_sidebar = config.split('const toolsSidebar = [', 1)[1].split('export default', 1)[0]
tool_routes = set(re.findall(r"link: '(/[^']+)'", tool_sidebar))
expected_tool_routes = {
    '/tools', '/quiz', '/review-1to4/online-lab',
    '/review-1to4/simulations', '/pdf', '/native-typst',
    '/native-workbench', '/fidelity'
}
assert expected_tool_routes <= tool_routes, expected_tool_routes - tool_routes
for route in expected_tool_routes:
    path = root / (route.strip('/') + '.md')
    assert path.is_file(), f'Broken tools-hub navigation route: {route}'
for route in ('/tools', '/quiz', '/native-typst', '/native-workbench', '/pdf', '/fidelity'):
    assert f"'{route}': toolsSidebar" in config, f'Unshared tool sidebar: {route}'
home = (root / 'index.md').read_text(encoding='utf-8')
hero = home.split('hero:', 1)[1].split('features:', 1)[0]
assert len(re.findall(r'^\s+- theme:', hero, re.M)) == 3, 'Homepage hero actions should stay compact'
assert '/tools' in home and '/reference/' in home, 'Missing prominent learning destinations'
hub = (root / 'tools.md').read_text(encoding='utf-8')
component = root / '.vitepress' / 'theme' / 'ToolsHub.vue'
assert component.is_file() and '<ToolsHub />' in hub
for route in expected_tool_routes - {'/tools'}:
    assert f"href: '{route}'" in component.read_text(encoding='utf-8'), route
assert "link: '/tools'" in config, 'Tool hub must be accessible from top navigation'
print('Compact navigation OK: 5 top-level items, 3 hero actions, and 8 unified tool routes')
