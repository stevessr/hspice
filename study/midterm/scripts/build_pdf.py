#!/usr/bin/env python3
"""Compile the canonical Typst content in isolated fragments and merge into one PDF.

Why: including all 26 modules in one Typst document can trigger pathological
layout behavior. Compilation is bounded per module; generated Markdown text is
kept in order. If a problematic SVG prevents rendering, the print copy falls
back to a clearly labeled text placeholder, leaving the online diagram intact.
"""
from pathlib import Path
import re
import subprocess
import sys
import time

from pypdf import PdfReader, PdfWriter

ROOT = Path(__file__).resolve().parent.parent
MAIN = ROOT / "main.typ"
OUT = ROOT / "build" / "midterm-review.pdf"
PARTS = ROOT / "build" / "sections"
TIMEOUT_SECONDS = 55


def render(source: Path, target: Path):
    cmd = ["typst", "compile", str(source), str(target)]
    started = time.monotonic()
    try:
        result = subprocess.run(
            cmd, cwd=ROOT, capture_output=True, text=True,
            timeout=TIMEOUT_SECONDS, check=False,
        )
    except subprocess.TimeoutExpired:
        print(f"::warning::Typst section timed out after {TIMEOUT_SECONDS}s: {source.name}", flush=True)
        return False
    elapsed = time.monotonic() - started
    if result.returncode != 0:
        print(f"::warning::Typst section failed ({source.name}, {elapsed:.1f}s)\n{result.stderr[-7000:]}", flush=True)
        return False
    if not target.is_file() or target.stat().st_size == 0:
        return False
    print(f"OK: {source.name} ({elapsed:.1f}s, {target.stat().st_size} bytes)", flush=True)
    return True


def main():
    PARTS.mkdir(parents=True, exist_ok=True)
    main_typ = MAIN.read_text(encoding="utf-8")
    if "#v(28mm)" not in main_typ or "#outline(" not in main_typ:
        raise RuntimeError("The main.typ cover/layout markers have changed")
    preamble, remainder = main_typ.split("#v(28mm)", 1)
    cover = "#v(28mm)" + remainder.split("#outline(", 1)[0]
    cover = cover.replace("#pagebreak()", "").rstrip()
    inc = re.findall(r'^#include\s+"([^"]+)"', main_typ, re.M)
    if len(inc) != 26:
        raise RuntimeError(f"Expected 26 included Typst modules; found {len(inc)}")
    docs = [("封面", preamble + cover + "\n#v(12mm)\n#align(center)[PDF 阅读器的书签目录包含完整章节与附录。]\n")]

    for item in inc:
        source = ROOT / item
        if not source.is_file():
            raise FileNotFoundError(source)
        stem = source.stem
        heading = item.split("/")[1]
        if heading == "sections":
            label = f"课程章节 · {stem}"
        elif heading == "appendices":
            label = f"附录 · {stem}"
        elif "answers" in item:
            label = f"参考解答 · {stem}"
        elif heading == "practice":
            label = f"实践训练 · {stem}"
        else:
            label = "学习导读"
        # Independent chapter pagination avoids cross-page layout cycles.
        body = preamble + "\n#set heading(numbering: none)\n"
        if heading == "appendices":
            body += "#set heading(numbering: none)\n"
        body += '#include "../../' + item + '"\n'
        docs.append((label, body))

    writer = PdfWriter()
    for i, (label, document) in enumerate(docs):
        name = f"{i:02d}"
        file = PARTS / f"{name}.typ"
        pdf = PARTS / f"{name}.pdf"
        file.write_text(document, encoding="utf-8")
        if not render(file, pdf):
            # Retry only figures with an explicit print-safe SVG placeholder.
            if i == 0:
                raise RuntimeError("Cover compilation failed")
            original = ROOT / inc[i - 1]
            content = original.read_text(encoding="utf-8")
            if not re.search(r'#image\("[^"]+\.svg"', content):
                raise RuntimeError(f"Typst compilation failed for {inc[i-1]}")
            safe = re.sub(
                r'#image\("[^"]+\.svg"[^)]*\)',
                '#text(size: 8pt, fill: gray)[电路图请参阅在线 Markdown 版]',
                content,
            )
            safe_file = PARTS / f"{name}-figure-fallback.typ"
            safe_file.write_text(safe, encoding="utf-8")
            retry = file.with_name(f"{name}-retry.typ")
            retry.write_text(
                preamble + '\n#set heading(numbering: none)\n'
                + '#include "' + safe_file.name + '"\n', encoding="utf-8",
            )
            if not render(retry, pdf):
                raise RuntimeError(f"Typst compilation also failed without SVG: {inc[i-1]}")
            print(f"::warning::Printed section {inc[i-1]} without the online-only SVG illustration", flush=True)
        start = len(writer.pages)
        reader = PdfReader(str(pdf))
        if len(reader.pages) == 0:
            raise RuntimeError(f"Empty PDF section: {label}")
        writer.append(str(pdf))
        writer.add_outline_item(label, start)

    OUT.parent.mkdir(parents=True, exist_ok=True)
    writer.add_metadata({
        "/Title": "电子信息与集成电路 · 期中复习讲义",
        "/Subject": "MOS、CMOS、HSPICE 与实践练习（分章自动编译）",
    })
    with OUT.open("wb") as out:
        writer.write(out)
    check = PdfReader(str(OUT))
    if len(check.pages) < len(docs):
        raise RuntimeError("Merged PDF page count is unexpectedly small")
    print(f"PDF OK: {len(check.pages)} pages, {len(docs)} parts, {OUT.stat().st_size} bytes", flush=True)


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        print(f"::error::{exc}", file=sys.stderr)
        raise
