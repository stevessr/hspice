#!/usr/bin/env python3
"""Strict 1:1 book fidelity audit. OCR coverage is not editorial acceptance."""
from collections import Counter
from pathlib import Path
import argparse, json, re

TOTAL=445
FIELDS=("text","mathematics","tables","figures","footnotes","layout")

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument("--status",type=Path,required=True)
    ap.add_argument("--project",type=Path,help="Local private editable_pages directory root")
    ap.add_argument("--scans",type=Path,help="Local private preview_scans directory")
    ap.add_argument("--json",type=Path)
    ap.add_argument("--strict",action="store_true")
    args=ap.parse_args()
    payload=json.loads(args.status.read_text(encoding="utf-8"))
    pages=payload.get("pages") or payload.get("page_data")
    if not isinstance(pages,list) or len(pages)!=TOTAL:
        raise SystemExit("FATAL: status must map exactly 445 scanned source pages")
    labels=[x.get("pdf_page",x.get("source_pdf_page")) for x in pages]
    if labels!=list(range(1,TOTAL+1)):
        raise SystemExit("FATAL: source page identifiers contain gaps, duplicates or reordering")
    counts=Counter()
    for i,obj in enumerate(pages,1):
        checks=obj.get("acceptance",{})
        open_checks=[key for key in FIELDS if checks.get(key) not in ("verified","not_applicable")]
        if obj.get("human_verified") is True and open_checks:
            raise SystemExit(f"FATAL: page {i} claimed verified with open dimensions: {open_checks}")
        accepted=(not open_checks and obj.get("human_verified") is True
                  and obj.get("layout_verified") is True)
        counts["accepted"]+=int(accepted)
        counts["editorial_draft"]+=int(bool(obj.get("editorial_typst_draft")
            or obj.get("native_html_selection_available")
            or obj.get("machine_ocr_replaced_with_editorial_typst")))
        for k in FIELDS:
            counts[k]+=int(checks.get(k) in ("verified","not_applicable"))
        if args.project:
            source=args.project/"editable_pages"/f"page-{i:03d}.typ"
            if not source.is_file():raise SystemExit(f"FATAL: missing editable source: {source}")
            text=source.read_text(encoding="utf-8")
            if not re.search(rf"SOURCE PDF PAGE {i:03d}",text):
                raise SystemExit(f"FATAL: mismatched page marker: {source}")
            if re.search(r'#image\([^)]*page-\d{3}\.(?:png|jpe?g)',text,re.I):
                raise SystemExit(f"FATAL: page {i} is a scanned image, not editable text")
            counts["sources"]+=1
        if args.scans:
            path=args.scans/f"page-{i:03d}.jpg"
            if not path.is_file():raise SystemExit(f"FATAL: missing source comparison scan: {path}")
            counts["reference_scans"]+=1
    report={
      "schema":"native-typst-1to1-v1",
      "source_pdf_pages":TOTAL,
      "accepted_pages":counts["accepted"],
      "editorial_draft_pages":counts["editorial_draft"],
      "checked_components":{k:counts[k] for k in FIELDS},
      "source_pages_inspected":counts["sources"],
      "source_scans_inspected":counts["reference_scans"],
      "complete":counts["accepted"]==TOTAL,
      "method":"Each page requires explicit acceptance of text, math, tables, figures, footnotes and layout.",
      "warning":"Machine OCR files, page counts and a successful Typst build do not prove 1:1 fidelity."
    }
    if args.json:
        args.json.parent.mkdir(parents=True,exist_ok=True)
        args.json.write_text(json.dumps(report,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    print(json.dumps(report,ensure_ascii=False,indent=2))
    if args.strict and not report["complete"]:raise SystemExit(2)

if __name__=="__main__":main()
