#!/usr/bin/env python3
"""Static checks for self-contained teaching HSPICE decks; no simulation is claimed."""
from pathlib import Path
import math
import re

EXPECTED = {
    '01-rc-step.sp': ('tran', 'T50'),
    '02-nmos-ids-vds.sp': ('dc', None),
    '03-nmos-body-effect.sp': ('dc', None),
    '04-distributed-rc.sp': ('tran', 'TLUMP'),
    '05-cmos-vtc.sp': ('dc', 'VOH'),
    '06-cmos-transient.sp': ('tran', 'TPHL'),
}


def validate_review_decks(root: Path) -> None:
    directory = root / 'review-1to4' / 'netlists'
    for filename, (analysis, measurement) in EXPECTED.items():
        path = directory / filename
        assert path.is_file(), f'Missing HSPICE deck: {path}'
        source = path.read_text(encoding='utf-8')
        lines = source.splitlines()
        assert len(lines) >= 9, f'Too short: {filename}'
        assert lines[0] and not lines[0].startswith('.'), f'Missing SPICE title: {filename}'
        assert lines[-1].lower() == '.end', f'Missing .END: {filename}'
        assert re.search(r'(?im)^\.option .*post=2', source), filename
        assert re.search(rf'(?im)^\.{analysis}\b', source), filename
        assert re.search(r'(?im)^\.probe\s+', source), filename
        if measurement is not None:
            assert re.search(rf'(?im)^\.measure\s+\w+\s+{measurement}\b', source), filename
        assert not re.search(r'(?im)^\.lib\b', source), f'Unexpected PDK dependency in {filename}'
        assert not re.search(r'\b[A-Z]:\\', source), f'Absolute drive in {filename}'
        declared = {name.lower() for name in re.findall(r'(?im)^\.model\s+(\w+)\s+(?:nmos|pmos)\b', source)}
        for line in lines:
            if re.match(r'(?i)^m\w+\s+', line):
                parts = line.split()
                assert len(parts) >= 8, f'Malformed MOS device: {filename}'
                assert parts[5].lower() in declared, f'Undefined model: {filename}: {parts[5]}'
                assert re.search(r'(?i)\bW=', line) and re.search(r'(?i)\bL=', line), filename
    assert math.isclose(1e4 * 100e-15 * math.log(2), 0.693147e-9, rel_tol=1e-5)
    assert math.isclose(0.5 * 200e-6 * 10 * 0.6**2, 360e-6, rel_tol=1e-12)
    print(f'OK: {len(EXPECTED)} teaching HSPICE decks (static check only)')


if __name__ == '__main__':
    validate_review_decks(Path(__file__).resolve().parent.parent)
