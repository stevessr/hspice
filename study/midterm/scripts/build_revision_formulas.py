#!/usr/bin/env python3
"""Create a searchable, source-linked formula index from the existing reviewed tables.

The original markdown is canonical; this script never generates new equations.
"""
from __future__ import annotations

import argparse
import json
import re
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCES = (
    ("formula-index.md", "/reference/formula-index"),
    ("formula-index-systems.md", "/reference/formula-index-systems"),
)
CHAPTER = re.compile(r"^## 第\s+(\d+)\s+章：(.+)")
PAGE = re.compile(r"^\[(\d+)\]\(/native-workbench\?page=(\d+)\)$")


def parse_table(path: Path, route: str) -> list[dict]:
    records: list[dict] = []
    chapter = None
    topic = None
    for lineno, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        header = CHAPTER.match(line)
        if header:
            chapter, topic = int(header.group(1)), header.group(2).strip()
            continue
        if not (line.startswith("| **") and "/native-workbench?page=" in line):
            continue
        cells = [v.strip() for v in line.strip().split("|")]
        if len(cells) != 7:
            raise ValueError(f"{path}:{lineno}: expected 5 columns, got {len(cells)-2}")
        _, title, expr, number, printed, pdf_cell, _ = cells
        match = re.fullmatch(r"\*\*(.+?)\*\*(?:<br>(.+))?", title)
        page_match = PAGE.fullmatch(pdf_cell)
        if not (match and page_match and chapter and topic):
            raise ValueError(f"{path}:{lineno}: malformed source row")
        if not (expr.startswith("$") and expr.endswith("$") and expr.count("$") == 2):
            raise ValueError(f"{path}:{lineno}: invalid inline math")
        printed_page = int(printed)
        pdf_page, link_page = map(int, page_match.groups())
        if pdf_page != link_page or pdf_page != printed_page + 19:
            raise ValueError(f"{path}:{lineno}: inconsistent printed/PDF page")
        latex = expr[1:-1]
        if any(x in latex for x in ("<script", "</script", "javascript:")):
            raise ValueError(f"{path}:{lineno}: forbidden LaTeX content")
        name, note = match.group(1), match.group(2) or ""
        if not name.strip():
            raise ValueError(f"{path}:{lineno}: empty formula title")
        records.append({
            "id": f"f-{len(records)+1}-{path.stem}",
            "name": name,
            "note": note,
            "latex": latex,
            "original_label": number,
            "chapter": chapter,
            "topic": topic,
            "printed_page": printed_page,
            "pdf_page": pdf_page,
            "source_route": route,
            "source_line": lineno,
        })
    return records


def generate(source_root: Path) -> dict:
    entries = []
    for filename, route in SOURCES:
        source = source_root / filename
        if not source.is_file():
            raise FileNotFoundError(source)
        entries.extend(parse_table(source, route))
    if len(entries) != 145:
        raise ValueError(f"Expected 145 source-derived formula entries, got {len(entries)}")
    if {e["chapter"] for e in entries} != set(range(1, 12)):
        raise ValueError("Formula table should cover all eleven textbook chapters")
    if any(not 1 <= e["printed_page"] <= 399 for e in entries):
        raise ValueError("Formula record contains a page outside the textbook body")
    return {
        "format": "hspice-revision-formula-index-v1",
        "source": "existing textbook page-linked formula markdown, not an exhaustive original transcription",
        "page_offset": 19,
        "total": len(entries),
        "chapters": dict(Counter(str(x["chapter"]) for x in entries)),
        "entries": entries,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source", type=Path, default=ROOT / "reference")
    parser.add_argument("--output", type=Path, default=ROOT / "public/review-formulas.json")
    args = parser.parse_args()
    index = generate(args.source)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(index, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"Review formula index: {index['total']} verified source rows, 11 chapters")


if __name__ == "__main__":
    main()
