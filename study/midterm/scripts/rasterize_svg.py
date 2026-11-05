#!/usr/bin/env python3
"""Rasterize SVG teaching illustrations for Typst only.

VitePress continues to serve original SVG vector images.
Rasterization avoids slow Typst rendering of complex SVG documents.
The generated PNGs are build intermediates and are not committed.
"""
from pathlib import Path
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parent.parent
FIGURES = ROOT / "assets" / "figures"


def main():
    exe = shutil.which("rsvg-convert")
    if not exe:
        raise RuntimeError("rsvg-convert not found; install librsvg2-bin")
    files = sorted(FIGURES.glob("*.svg"))
    if not files:
        raise RuntimeError("No teaching SVG images found")
    for src in files:
        dest = src.with_suffix(".png")
        proc = subprocess.run(
            [exe, "--width", "1200", "--output", str(dest), str(src)],
            capture_output=True,
            text=True,
            timeout=30,
        )
        if proc.returncode or not dest.is_file() or dest.stat().st_size < 100:
            raise RuntimeError(f"Rasterization failed for {src.name}: {proc.stderr[-1500:]}")
        print(f"{src.name} -> {dest.name} ({dest.stat().st_size} bytes)")
    print(f"Prepared {len(files)} print-safe PNG illustrations")


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        print(f"::error::{exc}", file=sys.stderr)
        raise
