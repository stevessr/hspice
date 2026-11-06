#!/usr/bin/env python3
"""OCR an image-only source PDF into a private, editable Typst review package.

Requires PyMuPDF, Pillow and Tesseract chi_sim+eng. OCR is never human verification.
"""
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
import argparse
import hashlib
import json
import os
import shutil
import subprocess
import sys
import zipfile

try:
    import fitz
    from PIL import Image
except ImportError as exc:
    raise SystemExit("Install requirements-scan.txt") from exc

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--pdf", type=Path, required=True)
parser.add_argument("--output", type=Path, required=True)
parser.add_argument("--pages", type=int, default=445, help="Expected original PDF pages")
parser.add_argument("--workers", type=int, default=3)
parser.add_argument("--scale", type=float, default=1.62)
parser.add_argument("--lang", default="chi_sim+eng")
parser.add_argument("--archive", type=Path)
a = parser.parse_args()
if not a.pdf.is_file() or not shutil.which("tesseract"):
    parser.error("Source PDF and Tesseract executable are required")
if not 1 <= a.workers <= 8 or not 1 <= a.scale <= 3:
    parser.error("workers must be 1..8; scale 1..3")
with fitz.open(a.pdf) as pdf:
    count = len(pdf)
    if count != a.pages:
        parser.error(f"Expected {a.pages} source pages, found {count}")
root = a.output.resolve()
raw, scans, quality = (root / name for name in ("raw_text", "preview_scans", "quality"))
for d in (raw, scans, quality):
    d.mkdir(parents=True, exist_ok=True)

def render_and_ocr(n):
    txt = raw / f"page-{n:03d}.txt"
    img = scans / f"page-{n:03d}.jpg"
    if txt.is_file() and img.is_file():
        return (n, len(txt.read_text(encoding="utf-8")))
    with fitz.open(a.pdf) as source:
        pix = source[n - 1].get_pixmap(matrix=fitz.Matrix(a.scale, a.scale),
                                       colorspace=fitz.csGRAY, alpha=False)
    Image.frombytes("L", (pix.width, pix.height), pix.samples).save(
        img, "JPEG", quality=78, optimize=True)
    cmd = ["tesseract", str(img), "stdout", "-l", a.lang, "--psm", "3"]
    p = subprocess.run(cmd, capture_output=True, env=dict(os.environ, OMP_THREAD_LIMIT="1"),
                       timeout=90)
    if p.returncode:
        raise RuntimeError(f"OCR page {n}: {p.stderr[-500:]!r}")
    text = p.stdout.decode("utf-8", "replace")
    txt.write_text(text, encoding="utf-8")
    return (n, len(text))

results = []
with ThreadPoolExecutor(max_workers=a.workers) as executor:
    jobs = [executor.submit(render_and_ocr, n) for n in range(1, count+1)]
    for future in as_completed(jobs):
        results.append(future.result())
        if len(results) % 25 == 0 or len(results) == count:
            print(f"OCR pages: {len(results)}/{count}", flush=True)
results.sort()
subprocess.run([sys.executable, str(Path(__file__).with_name("import_ocr_text.py")),
                "--input", str(raw), "--output", str(root), "--pages", str(count)], check=True)
entries = []
for n, characters in results:
    flags = ["machine-OCR-unverified", "math-not-reconstructed",
             "tables-not-reconstructed", "figures-not-reconstructed",
             "layout-not-compared"]
    if characters < 30:
        flags.append("near-empty-ocr")
    entries.append(dict(source_pdf_page=n, status="ocr-unverified",
                        flags=flags, human_verified=False, ocr_characters=characters))
(quality / "pages.json").write_text(
    json.dumps(dict(source_pages=count, page_data=entries, accepted_full_pages=0),
               ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
with a.pdf.open("rb") as stream:
    digest = hashlib.file_digest(stream, "sha256").hexdigest()
(quality / "summary.json").write_text(
    json.dumps(dict(source_pdf_pages=count, source_pdf_sha256=digest,
                    ocr_characters=sum(x[1] for x in results),
                    near_empty_pages=[x[0] for x in results if x[1] < 30],
                    accepted_full_pages=0), ensure_ascii=False, indent=2) + "\n",
    encoding="utf-8")
if a.archive:
    a.archive.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(a.archive, "w", zipfile.ZIP_DEFLATED, compresslevel=6) as z:
        for path in sorted(root.rglob("*")):
            if path.is_file() and path.resolve() != a.archive.resolve():
                z.write(path, path.relative_to(root).as_posix())
print(f"Generated {count} editable machine-OCR pages; human verified: zero.")
