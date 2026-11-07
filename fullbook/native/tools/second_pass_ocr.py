#!/usr/bin/env python3
"""Independent, resumable source scan OCR spot-check. Never asserts 1:1 fidelity.

Usage:
  python3 second_pass_ocr.py --pdf textbook.pdf --first-pass raw_text \
      --start 189 --end 200 --output quality/ocr-pass2-189-200.json
Optional --all-pages runs over the full PDF and only produces audit metadata.
Requires poppler (pdfinfo,pdftoppm) and tesseract with chi_sim+eng models.
No scans, OCR text, or source PDF are uploaded by this script.
"""
from pathlib import Path
import argparse
from difflib import SequenceMatcher
import hashlib
import json
import re
import subprocess
import tempfile

def run(command, timeout):
    process = subprocess.run(command, text=True, capture_output=True, timeout=timeout)
    if process.returncode:
        raise RuntimeError(f"{command[0]} failed: {process.stderr[-800:]}")
    return process.stdout

def normalize(text):
    return re.sub(r"\s+", "", text)

def scan_pages(pdf, first, start, end, lang, scale):
    records = []
    with tempfile.TemporaryDirectory(prefix="native-typst-ocr2-") as temp:
        for page in range(start, end + 1):
            old = first / f"page-{page:03d}.txt"
            if not old.is_file():
                raise FileNotFoundError(f"First pass missing PDF page {page}: {old}")
            dest = Path(temp) / f"page-{page:03d}"
            run(["pdftoppm", "-f", str(page), "-l", str(page),
                 "-scale-to", str(scale), "-png", "-singlefile", str(pdf), str(dest)], 90)
            source_image = dest.with_suffix(".png")
            text2 = run(["tesseract", str(source_image), "stdout",
                         "-l", lang, "--psm", "6"], 90)
            text1 = old.read_text(encoding="utf-8")
            similarity = round(SequenceMatcher(
                None, normalize(text1), normalize(text2), autojunk=True).ratio(), 4)
            row = {"pdf_page": page, "normalized_similarity": similarity,
                   "first_pass_characters": len(text1), "second_pass_characters": len(text2),
                   "high_disagreement": similarity < 0.85,
                   "human_verified": False, "complete_page_accepted": False,
                   "math_manual_review_required": True,
                   "figures_manual_review_required": True}
            records.append(row)
            print(f"page {page}: agreement={similarity:.1%} (NOT fidelity)", flush=True)
            source_image.unlink(missing_ok=True)
    return records

def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--pdf", type=Path, required=True)
    ap.add_argument("--first-pass", type=Path, required=True)
    ap.add_argument("--start", type=int, default=1)
    ap.add_argument("--end", type=int)
    ap.add_argument("--all-pages", action="store_true")
    ap.add_argument("--output", type=Path, required=True)
    ap.add_argument("--language", default="chi_sim+eng")
    ap.add_argument("--scale", type=int, default=1400)
    args = ap.parse_args()
    if not args.pdf.is_file() or not args.first_pass.is_dir():
        ap.error("Provide a PDF file and a first-pass text directory")
    if args.scale < 500 or args.scale > 2800:
        ap.error("--scale must be in [500,2800]")
    pdf_info = run(["pdfinfo", str(args.pdf)], 20)
    match = re.search(r"^Pages:\s+(\d+)\s*$", pdf_info, re.M)
    if not match:
        ap.error("Unable to read source PDF page count")
    count = int(match.group(1))
    end = count if args.all_pages else args.end
    if end is None:
        ap.error("Pass --end or --all-pages")
    if not 1 <= args.start <= end <= count:
        ap.error(f"Page range must be within 1..{count}")
    rows = scan_pages(args.pdf, args.first_pass, args.start, end,
                      args.language, args.scale)
    digest = hashlib.sha256()
    with args.pdf.open("rb") as file:
        for block in iter(lambda: file.read(1024 * 1024), b""):
            digest.update(block)
    result = {
        "schema": "source-scan-ocr-independent-pass-v1",
        "source_pdf_pages": count,
        "source_pdf_sha256": digest.hexdigest(),
        "range": [args.start, end],
        "first_pass": "preexisting OCR plaintext provided locally",
        "second_pass": f"Tesseract PSM6 {args.language}; pdftoppm -scale-to {args.scale}",
        "complete_page_accepted": 0,
        "warning": "OCR agreement cannot establish correctness of formulas, tables or diagrams.",
        "pages": rows,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"Stored {len(rows)} page comparisons; accepted 0 full pages.")

if __name__ == "__main__":
    main()
