#!/usr/bin/env python3
"""Validate editorial coverage against exactly 445 original source pages."""
from pathlib import Path
import argparse, json
ROOT=Path(__file__).resolve().parent
p=argparse.ArgumentParser()
p.add_argument('--require-complete', action='store_true')
a=p.parse_args()
m=json.loads((ROOT/'page-status.json').read_text(encoding='utf-8'))
pages=m['pages']
assert len(pages)==445
assert [x['pdf_page'] for x in pages]==list(range(1,446))
allowed={'not-started','partially-transcribed','draft-transcribed','verified'}
assert all(x['status'] in allowed for x in pages)
from collections import Counter
counts=Counter(x['status'] for x in pages)
print(dict(counts))
if a.require_complete:
    assert counts['verified']==445, f"Only {counts['verified']}/445 verified pages"
else:
    print('Status checked; full-book completion is NOT asserted.')
