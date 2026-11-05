#!/usr/bin/env python3
"""Compile the canonical Typst content in isolated fragments and merge into one PDF.

Why: including all 26 modules in one Typst document can trigger pathological
layout behavior. Compilation is bounded per module; generated Markdown text is
kept in order. If a problematic SVG prevents rendering, the print copy falls
back to a clearly labeled text placeholder, leaving the online diagram intact.
"""
from pathlib import Path
import json
import shutil
import re
import subprocess
import sys
import time

from pypdf import PdfReader, PdfWriter

ROOT = Path(__file__).resolve().parent.parent
MAIN = ROOT / "main.typ"
OUT = ROOT / "build" / "midterm-review.pdf"
PARTS = ROOT / "build" / "sections"
PUBLISH = ROOT / "build" / "publish"
TIMEOUT_SECONDS = 55


def render(source: Path, target: Path):
    cmd = ["typst", "compile", "--root", str(ROOT), str(source), str(target)]
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
    PUBLISH.mkdir(parents=True, exist_ok=True)
    entries = []
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
        slug = "00-cover" if i == 0 else f"{i:02d}-" + Path(inc[i-1]).stem
        public_rel = "pdf/review/" + slug + ".pdf"
        output_part = PUBLISH / public_rel
        output_part.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(pdf, output_part)
        group = "导读" if i < 2 else (
            "教材知识章节" if i <= 10 else
            "实践训练" if i <= 15 else
            "参考解答" if i <= 20 else "速查附录"
        )
        entries.append({"id": "review-"+str(i), "title": label, "path": public_rel,
                        "group": group, "pages": len(reader.pages), "format": "typst"})

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

    shutil.copy2(OUT, PUBLISH / "midterm-review.pdf")
    entries.insert(0, {"id": "review-full", "title": "期中复习完整讲义",
                       "path": "midterm-review.pdf", "group": "整册",
                       "pages": len(check.pages), "format": "typst"})

    # The separately authored nine-unit Typst textbook digest follows the
    # book's confirmed chapter order. These are original study notes, not a
    # reproduction of the scanned source textbook.
    textbook = sorted((ROOT / "textbook" / "units").glob("[0-9][0-9]-*.typ"))
    if len(textbook) != 9:
        raise RuntimeError(f"Expected nine independently authored textbook units; found {len(textbook)}")
    textbook_style = (
        '#set page(paper: "a4", margin: (top: 26mm, bottom: 25mm, left: 26mm, right: 26mm))\n'
        '#set text(font: ("Noto Serif CJK SC", "DejaVu Serif"), size: 10.5pt, lang: "zh")\n'
        '#set par(justify: true, first-line-indent: 2em, spacing: 0.75em)\n'
        '#show heading.where(level: 1): set text(font: "Noto Sans CJK SC", size: 17pt, weight: "bold")\n'
        '#show heading.where(level: 2): set text(font: "Noto Sans CJK SC", size: 12.5pt, weight: "bold")\n'
        '#set page(footer: context [#align(center)[#counter(page).display()]])\n'
    )
    tb_writer = PdfWriter()
    cover_typ = PARTS / "tb-cover.typ"
    cover_pdf = PARTS / "tb-cover.pdf"
    cover_typ.write_text(
        textbook_style
        + '#v(50mm)\n#align(center)[#text(size: 22pt, weight: "bold")[数字集成电路分析与设计]]\n'
        + '#v(12mm)\n#align(center)[#text(size: 18pt)[九章教材复习精编（Typst 重述版）]]\n'
        + '#v(20mm)\n#align(center)[围绕课程实验：MOS · 反相器 · CMOS · HSPICE]\n'
        + '#v(24mm)\n本文为重新组织的学习笔记，保留教材章节框架，结合课程实验补充例题与复习提示。\n'
        + '第 8、9 章为拓展内容；具体考试范围以授课安排为准。\n'
        + '#v(8mm)\n正文不是教材原文复刻，也不包含教材扫描图片。\n',
        encoding="utf-8",
    )
    if not render(cover_typ, cover_pdf):
        raise RuntimeError("Textbook review cover compilation failed")
    tb_writer.append(str(cover_pdf))
    for i, src in enumerate(textbook, start=1):
        item_file = PARTS / f"tb-{i:02d}.typ"
        item_pdf = PARTS / f"tb-{i:02d}.pdf"
        item_file.write_text(
            textbook_style + '\n#include "../../textbook/units/' + src.name + '"\n',
            encoding="utf-8",
        )
        if not render(item_file, item_pdf):
            raise RuntimeError(f"Failed to compile textbook review unit: {src.name}")
        doc = PdfReader(str(item_pdf))
        start = len(tb_writer.pages)
        tb_writer.append(str(item_pdf))
        tb_writer.add_outline_item(f"教材第 {i} 章 · {src.stem}", start)
        public_rel = "pdf/textbook/" + src.stem + ".pdf"
        public_part = PUBLISH / public_rel
        public_part.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(item_pdf, public_part)
        entries.append({"id": f"textbook-{i:02d}", "title": f"教材第 {i} 章 · " +
                        src.stem.split("-", 1)[-1].replace("-", " "),
                        "path": public_rel, "group": "教材精编逐章",
                        "pages": len(doc.pages), "format": "typst"})
    textbook_full = ROOT / "build" / "textbook-review.pdf"
    tb_writer.add_metadata({"/Title": "数字集成电路分析与设计 · 九章复习精编",
                            "/Subject": "围绕教材目录独立编写的 Typst 学习资料"})
    with textbook_full.open("wb") as f:
        tb_writer.write(f)
    shutil.copy2(textbook_full, PUBLISH / "textbook-review.pdf")
    textbook_pages = len(PdfReader(str(textbook_full)).pages)
    entries.insert(1, {"id": "textbook-full", "title": "教材九章复习精编（全册）",
                       "path": "textbook-review.pdf", "group": "整册",
                       "pages": textbook_pages, "format": "typst"})

    manifest = {"version": 1,
                "notice": "章节 PDF 由 Typst 原创学习资料生成，非原教材扫描件。",
                "items": entries}
    (PUBLISH / "pdf-index.json").write_text(
        json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8",
    )
    print(f"PDF OK: {len(check.pages)} pages in {len(docs)} review parts; "
          f"{textbook_pages} textbook digest pages; {len(entries)} preview entries",
          flush=True)



if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        print(f"::error::{exc}", file=sys.stderr)
        raise
