#!/usr/bin/env python3
"""Reproducible SOURCE-PDF vs native-Typst-SVG optical QA, NOT 1:1 certification.

Use against the private original scanned PDF and a GitHub Actions SVG artifact:
    python fullbook/native/qa/compare_source_svg.py \
      --pdf /private/original.pdf --svg-zip downloaded-pages.zip \
      --start 253 --end 260 --out visual-review

Dependencies: pip install PyMuPDF cairosvg pillow opencv-python-headless numpy
Outputs for each page: source/native/red-blue difference triptych, plus metrics.
Any full-page acceptance must follow independent literal, math, topology,
captions and editorial layout checks; this script NEVER changes status JSON.
"""
from __future__ import annotations

import argparse
import hashlib
import io
import json
import zipfile
from pathlib import Path


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--pdf", type=Path, required=True)
    ap.add_argument("--svg-zip", type=Path, required=True)
    ap.add_argument("--start", type=int, required=True)
    ap.add_argument("--end", type=int, required=True)
    ap.add_argument("--out", type=Path, required=True)
    ap.add_argument("--scale", type=float, default=1.25)
    ap.add_argument("--ink-threshold", type=int, default=190)
    ap.add_argument("--tolerance", type=int, default=2)
    args = ap.parse_args()
    if args.start < 1 or args.end < args.start or args.scale <= 0:
        ap.error("Invalid page range or positive render scale")
    if not 0 <= args.ink_threshold <= 255 or not 0 <= args.tolerance <= 10:
        ap.error("Invalid ink threshold or tolerance (0–10 pixels)")
    import fitz
    import cairosvg
    import cv2
    import numpy as np
    from PIL import Image, ImageDraw, ImageFont

    args.out.mkdir(parents=True, exist_ok=True)
    pdfhash = hashlib.sha256(args.pdf.read_bytes()).hexdigest()
    rows = []
    with fitz.open(args.pdf) as doc, zipfile.ZipFile(args.svg_zip) as archive:
        if args.end > len(doc):
            ap.error(f"Source PDF has only {len(doc)} pages")
        names = archive.namelist()
        for page in range(args.start, args.end + 1):
            matches = [n for n in names if n.endswith(f"-page-{page:03d}.svg")]
            if len(matches) != 1:
                raise ValueError(f"PDF {page}: expected 1 SVG, found {matches}")
            pm = doc[page - 1].get_pixmap(
                matrix=fitz.Matrix(args.scale, args.scale), alpha=False)
            original = Image.frombytes("RGB", (pm.width, pm.height), pm.samples)
            rendered = cairosvg.svg2png(
                bytestring=archive.read(matches[0]),
                output_width=pm.width, output_height=pm.height)
            native = Image.open(io.BytesIO(rendered)).convert("RGB")
            src = np.array(original.convert("L")) <= args.ink_threshold
            dst = np.array(native.convert("L")) <= args.ink_threshold
            kernel = cv2.getStructuringElement(
                cv2.MORPH_ELLIPSE, (args.tolerance * 2 + 1,) * 2)
            src_tolerant = cv2.dilate(src.astype("uint8"), kernel) > 0
            dst_tolerant = cv2.dilate(dst.astype("uint8"), kernel) > 0
            precision = float((dst & src_tolerant).sum()) / max(1, int(dst.sum()))
            recall = float((src & dst_tolerant).sum()) / max(1, int(src.sum()))
            f1 = 2 * precision * recall / max(1e-12, precision + recall)
            heat = np.full((pm.height, pm.width, 3), 255, dtype="uint8")
            heat[src & ~dst_tolerant] = (225, 50, 50)
            heat[dst & ~src_tolerant] = (50, 95, 210)
            heat[src & dst] = (64, 64, 64)
            comparison = Image.new("RGB", (pm.width * 3, pm.height + 38), "white")
            comparison.paste(original, (0, 38))
            comparison.paste(native, (pm.width, 38))
            comparison.paste(Image.fromarray(heat), (2 * pm.width, 38))
            drawer = ImageDraw.Draw(comparison)
            for i, name in enumerate((
                f"PDF {page} original scan", "Editable native SVG",
                f"F1={f1:.5f}  red=missing blue=misplaced")):
                drawer.text((i * pm.width + 10, 11), name, fill="black")
            comparison.save(args.out / f"page-{page:03d}-compare.png")
            rows.append(dict(pdf_page=page, svg=matches[0],
                             f1=round(f1, 5),
                             precision=round(precision, 5),
                             recall=round(recall, 5),
                             original_ink_pixels=int(src.sum()),
                             native_ink_pixels=int(dst.sum()),
                             manually_verified=False,
                             strict_page_accepted=False))
    result = {
        "source_pdf_sha256": pdfhash,
        "source_page_count": len(doc),
        "scope": [args.start, args.end],
        "scale": args.scale,
        "ink_threshold": args.ink_threshold,
        "tolerance_pixels": args.tolerance,
        "mean_ink_f1": round(sum(x["f1"] for x in rows) / len(rows), 5),
        "warning": ("Optical F1 can be biased by filled backgrounds and print noise; "
                    "neither the F1 nor successful SVG compilation verifies "
                    "literal text, formulas, circuit connectivity or exact pagination."),
        "strict_pages_accepted": 0,
        "pages": rows,
    }
    (args.out / "visual-review.json").write_text(
        json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"pages": len(rows), "mean_f1": result["mean_ink_f1"],
                      "strict_pages_accepted": 0, "out": str(args.out)},
                     ensure_ascii=False))


if __name__ == "__main__":
    main()
