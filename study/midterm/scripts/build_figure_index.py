#!/usr/bin/env python3
"""Build a searchable textbook figure catalog from the editable per-page Typst drafts.

Source of truth: fullbook/native/web/*-page-NNN.typ, with editorial status from
fullbook/native/page-status.json.  The catalog is an index of draft captions,
NOT a claim that the drawings reproduce the original scanned textbook 1:1.
"""
from __future__ import annotations

import argparse
import json
import re
from collections import Counter
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
FIG_RE = re.compile(
    r"图\s*(?P<number>(?:P?(?:1[01]|[1-9])|[AB])\.\d{1,3}[a-zA-Z]?)"
)
PAGE_FILE_RE = re.compile(r"^[0-9]{1,3}-page-(\d{3})\.typ$")
CHAPTER_TITLES = {
    "1": "数字集成电路设计",
    "2": "MOS 晶体管",
    "3": "制造、版图与 SPICE",
    "4": "MOS 反相器",
    "5": "静态 MOS 门电路",
    "6": "高速 CMOS",
    "7": "传输门与动态逻辑",
    "8": "半导体存储器",
    "9": "其他存储器",
    "10": "互连设计",
    "11": "电源与时钟",
    "A": "附录 A · SPICE",
    "B": "附录 B · 双极型器件",
}
CATEGORIES = [
    ("存储器", re.compile(r"SRAM|DRAM|CAM|EEPROM|FLASH|ROM|存储|位线|字线|译码|存取", re.I)),
    ("曲线与波形", re.compile(r"曲线|波形|特性|变化|延迟|时间|响应|电流.电压|眼图|趋势|噪声|频率|对比")),
    ("制造与版图", re.compile(r"显微|剖面|工艺|制造|光刻|晶圆|金属|连线|互连|版图|掩模|截面|布线|DRC|布局|通孔|氧化层", re.I)),
    ("电源与时钟", re.compile(r"电源|供电|时钟|锁相|振荡|PLL|VCO|电迁移|地弹|时序", re.I)),
    ("电路结构", re.compile(r"电路|晶体管|反相|门|电容|电阻|传输|逻辑|锁存|触发|MOS|NAND|NOR|CMOS|NMOS|PMOS", re.I)),
]


def is_caption_line(line: str, start: int) -> bool:
    """Keep headings and captioned graphics, not in-paragraph figure mentions."""
    raw = line.strip()
    if raw.startswith(("#set ", "//", "_", ">")):
        return False
    before = raw[:start].rstrip()
    if re.fullmatch(r"={1,5}\s*", before):
        return True
    if re.fullmatch(r"[*]{0,2}\s*", before):
        return True
    # An actual centered caption: #align(center)[*图...] or nested #text(...)[图...].
    if raw.startswith(("#align(", "#text(", "#figure(")):
        if before.endswith(("[", "[*", "[**", "［", "：", ":")):
            return True
    return False


def clean_caption(raw: str) -> str:
    # Captions generally end at the matching text/Typst layout bracket.
    candidate = raw.lstrip(" \u3000:：—-")
    candidate = re.split(r"\*\s*\]|\]\s*\]|[\r\n]", candidate, maxsplit=1)[0]
    candidate = candidate.strip(" \u3000*_[]")
    candidate = candidate.replace("#linebreak()", " ").replace("~", " ")
    candidate = re.sub(r"\s+", " ", candidate)
    return candidate[:155] if candidate else "该页重排稿未提供完整图注（待校对）"


def figure_category(title: str, chapter: str) -> str:
    for kind, pattern in CATEGORIES:
        if pattern.search(title):
            return kind
    return "原理示意"


def caption_candidates(text: str) -> list[dict]:
    found = []
    for line_no, line in enumerate(text.splitlines(), start=1):
        for match in FIG_RE.finditer(line):
            if not is_caption_line(line, match.start()):
                continue
            number = match.group("number").upper()
            section = re.match(r"(?:P)?(\d{1,2}|[AB])\.", number)
            if not section:
                continue
            chapter = section.group(1)
            if chapter not in CHAPTER_TITLES:
                continue
            title = clean_caption(line[match.end():])
            # A substantive caption is preferred to a bare section heading.
            caption_rank = (2 if line.lstrip().startswith("#align(") else 1)
            caption_rank += (1 if len(title) > 12 else 0)
            found.append({
                "number": number,
                "chapter": chapter,
                "title": title,
                "caption_line": line_no,
                "_rank": caption_rank,
            })
    return found


def build_records(web_root: Path, status_file: Path) -> list[dict]:
    status_data = json.loads(status_file.read_text(encoding="utf-8"))
    by_page = {int(p["pdf_page"]): p for p in status_data["pages"]}
    assert len(by_page) == 445, "Expected 445 editorial-status entries"
    pages: dict[int, Path] = {}
    for path in web_root.glob("*-page-*.typ"):
        m = PAGE_FILE_RE.fullmatch(path.name)
        if not m:
            continue
        pdf_page = int(m.group(1))
        assert pdf_page not in pages, f"duplicate page sources: {pdf_page}"
        pages[pdf_page] = path
    assert set(pages) == set(range(1, 446)), "Missing native Typst page sources"

    found_by_number: dict[str, list[dict]] = {}
    for pdf_page, src in sorted(pages.items()):
        if pdf_page < 20:
            continue
        source_text = src.read_text(encoding="utf-8")
        for entry in caption_candidates(source_text):
            # Confirm that the depicted figure belongs in the printed chapter.
            chapter = entry["chapter"]
            if chapter.isdigit() and pdf_page > 418:
                continue
            printed = pdf_page - 19
            status = by_page[pdf_page]
            title = entry["title"]
            is_placeholder = bool(re.search(
                r"原书显微照片|原图占位|图像占位|版权|未经授权|照片位置", title
            ))
            data = {
                "number": entry["number"],
                "chapter": chapter,
                "chapter_title": CHAPTER_TITLES[chapter],
                "title": title,
                "category": figure_category(title, chapter),
                "pdf_page": pdf_page,
                "printed_page": printed,
                "typst": src.name,
                "preview": f"{src.stem}-layout.svg",
                "source_line": entry["caption_line"],
                "figures_verified": status.get("figures_verified") is True,
                "placeholder": is_placeholder,
                "reference_only": not source_text.count("#import")
                and not re.search(r"#(?:fig|figure|image|box)[A-Za-z0-9_]*(?:\(|\[)", source_text),
                "_rank": entry["_rank"] + (0 if is_placeholder else 1),
            }
            found_by_number.setdefault(data["number"], []).append(data)

    entries: list[dict] = []
    for number, variants in found_by_number.items():
        # Duplicate numbers on successive pages are common in draft explanatory
        # headings; pick a substantive caption and retain other page references.
        chosen = sorted(
            variants,
            key=lambda r: (
                -r["_rank"],
                -len(r["title"]) if r["title"].startswith("该页") is False else 0,
                r["pdf_page"],
            ),
        )[0]
        other_pages = sorted(set(v["pdf_page"] for v in variants if v["pdf_page"] != chosen["pdf_page"]))
        chosen["other_pdf_pages"] = other_pages
        chosen.pop("_rank", None)
        entries.append(chosen)
    def order(r: dict):
        return (
            int(r["chapter"]) if r["chapter"].isdigit() else 12 + (r["chapter"] == "B"),
            int(re.search(r"\.(\d+)", r["number"]).group(1)),
            r["number"].startswith("P"),
            r["pdf_page"],
        )
    entries.sort(key=order)
    assert entries, "No figure captions extracted"
    return entries


def write_outputs(entries: list[dict], public_dir: Path, reference_dir: Path) -> None:
    public_dir.mkdir(parents=True, exist_ok=True)
    reference_dir.mkdir(parents=True, exist_ok=True)
    counts = Counter(e["chapter"] for e in entries)
    payload = {
        "format": "hspice-textbook-figure-index-v1",
        "source": "editable per-page Typst drafts; figure captions may be incomplete",
        "page_offset": 19,
        "total": len(entries),
        "counts": dict(counts),
        "entries": entries,
    }
    (public_dir / "figure-index.json").write_text(
        json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
    )
    md = [
        "# 教材图号与图注全目录（自动生成）",
        "",
        "> 图号与图注由仓库可编辑 Typst **重排稿**自动汇总，不能替代教材原始扫描图，也不代表图形通过 1:1 验收。",
        "> **印刷页码 = PDF 页序 − 19**。对应图页链接打开 Typst 校对工作台；PDF 原扫描仍需参照用户持有的教材文件。",
        "",
        "[返回可筛选的图例速查图库](/reference/figures) · [公式速查](/reference/formula-index)",
        "",
        f"当前共检索到 **{len(entries)}** 个不同图号（含习题图，具体以现有重排稿覆盖情况为准）。",
        "",
    ]
    for ch in CHAPTER_TITLES:
        rows = [e for e in entries if e["chapter"] == ch]
        if not rows:
            continue
        md.extend([
            f"## 第 {ch} 章 · {CHAPTER_TITLES[ch]}" if ch.isdigit()
            else f"## {CHAPTER_TITLES[ch]}",
            "",
            "| 图号 | 图注（重排稿） | 印刷页 | PDF 页 |",
            "|---|---|---:|---:|",
        ])
        for e in rows:
            title = e["title"].replace("|", r"\|").replace("[", "［").replace("]", "］")
            md.append(
                f"| 图 {e['number']} | {title} | {e['printed_page']} | "
                f"[{e['pdf_page']}](/native-workbench?page={e['pdf_page']}) |"
            )
        md.append("")
    md.extend([
        "---", "",
        "索引记录只使用图形标题、图号和相应原生页面预览，不复制扫描图。",
        "对图形细节是否与教材原图一致，应以该页严格审校状态和原扫描对照为准。",
        "",
    ])
    (reference_dir / "figures-catalog.md").write_text(
        "\n".join(md), encoding="utf-8"
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--web", type=Path, default=REPO / "fullbook/native/web")
    parser.add_argument("--status", type=Path, default=REPO / "fullbook/native/page-status.json")
    parser.add_argument("--public", type=Path, default=REPO / "study/midterm/public")
    parser.add_argument("--reference", type=Path, default=REPO / "study/midterm/reference")
    args = parser.parse_args()
    entries = build_records(args.web, args.status)
    write_outputs(entries, args.public, args.reference)
    print(f"Figure catalog: {len(entries)} distinct figure numbers")
    for ch, n in sorted(Counter(e["chapter"] for e in entries).items()):
        print(f"  Chapter {ch}: {n}")


if __name__ == "__main__":
    main()
