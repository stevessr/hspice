from pathlib import Path
import re
root=Path(__file__).resolve().parent.parent
files=sorted((root/'content').rglob('*.md'))
assert len(files)==16, len(files)
for f in files:
    data=f.read_text(encoding='utf-8')
    assert data.startswith('# '), f
    for rel in re.findall(r'!\[[^]]*\]\(([^)]+)\)', data):
        assert (f.parent / rel).exists(), f'{f}: missing {rel}'
for path in sorted((root/'typst').rglob('*.typ')):
    assert path.read_text(encoding='utf-8').startswith('// GENERATED FILE'), path
print(f'OK: {len(files)} Markdown files and {len(list((root/"typst").rglob("*.typ")))} generated Typst files')
