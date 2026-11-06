#!/usr/bin/env python3
"""Strict, non-optimistic one-to-one Typst textbook review gate.

The JSON source is editorial status only and contains no textbook text.
Page acceptance requires all eight independently reviewed categories AND
reviewer evidence tied to the source image and Typst source file.
"""
import argparse
from pathlib import Path
import json
import sys

FIELDS = (
  'text_complete', 'math_complete', 'tables_complete',
  'figures_editable', 'captions_references_complete',
  'footnotes_headers_complete', 'layout_compared', 'typst_html_compiled'
)

def accepted(p):
    evidence=p.get('evidence') or {}
    return (
      all(p.get('checks',{}).get(k) is True for k in FIELDS)
      and all(evidence.get(k) for k in (
        'reference_scan_sha256','typst_source_sha256',
        'reviewer','reviewed_at','comparison_notes'))
    )

def audit(src):
    data=json.loads(src.read_text(encoding='utf-8'))
    pages=data['pages']
    assert len(pages)==445, f"Expected 445 pages, found {len(pages)}"
    assert [x['pdf_page'] for x in pages]==list(range(1,446))
    assert data['source_pages']==445
    assert data['required_checks']==list(FIELDS)
    verified=[p['pdf_page'] for p in pages if accepted(p)]
    if data.get('full_pages_accepted')!=len(verified):
        raise ValueError("Claimed full_pages_accepted does not match per-page evidence")
    return verified

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--input',type=Path,required=True)
    parser.add_argument('--require-full',action='store_true')
    args=parser.parse_args()
    verified=audit(args.input)
    print(f"Verified one-to-one page replicas: {len(verified)}/445")
    if args.require_full and len(verified)!=445:
        sys.exit("FAIL: editable full-book reproduction is NOT complete.")
if __name__=='__main__':
    main()
