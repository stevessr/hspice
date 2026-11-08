#!/usr/bin/env python3
"""Source-scan anchor QA for newly reconstructed PDF 3 and PDF 6.
This is a CONTENT regression check, not full-page layout acceptance.
"""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
pages = {
    3: ROOT / "web/003-page-003.typ",
    6: ROOT / "web/006-page-006.typ",
}
anchors = {
    3: [
        "内容简介", "0.18 μm", "0.13 μm", "SPICE",
        "0-07-228365-3", "7-121-01666-4",
        "01-2003-4608", "093349", "TN431.2",
        "2005 年 9 月", "48.00 元",
        "McGraw-Hill", "CIP", "电子工业出版社",
    ],
    6: [
        "教材出版委员会", "吴佑寿", "林金桐", "杨千里", "林孝康",
        "徐安士", "樊昌信", "程时昕", "郁道银", "阮秋琦",
        "张晓林", "郑宝玉", "朱世华", "彭启琮", "毛军发",
        "赵尔沅", "钟允若", "刘　彩", "杜振民",
        "王志功", "张中兆", "范平志",
    ],
}
for n, path in pages.items():
    src = path.read_text(encoding="utf-8")
    assert f"SOURCE PDF PAGE {n:03d}" in src, path
    assert not re.search(r"MACHINE-OCR DRAFT ONLY|未校对机器文本", src), path
    assert not re.search(r'#image\([^)]*page-\d{3}\.(?:png|jpe?g)', src, re.I), path
    missing = [item for item in anchors[n] if item not in src]
    assert not missing, f"PDF {n}: missing scan-verified anchors {missing}"
    if n == 6:
        assert '#grid(' in src and src.count("[], [") >= 18
    print(f"PDF {n}: {len(anchors[n])} text anchors present, native editable source")
print("This QA does NOT confer 1:1 page acceptance.")
