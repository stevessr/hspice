#!/usr/bin/env python3
"""Regression tests for the textbook figure metadata and page mapping."""
import json
import tempfile
import unittest
from pathlib import Path

from build_figure_index import build_records, caption_candidates, write_outputs


class FigureIndexTests(unittest.TestCase):
    def test_caption_formats_and_no_prose_false_positives(self):
        text = """
#set document(title:"图2.11 主题")
原书图2.11讲述 VTC，但这一行只是正文引用。
== 图3.3　多层金属互连
#align(center)[*图7.18　有驱动和负载的传输门*]
#align(center)[#text(size:6.7pt)[图 1.1　原书显微照片]]
*图2.8　NMOS 偏置*
_图3.7文字校对中尚未核实。_
"""
        figures = caption_candidates(text)
        numbers = [x["number"] for x in figures]
        self.assertEqual(numbers, ["3.3", "7.18", "1.1", "2.8"])
        self.assertIn("多层金属互连", figures[0]["title"])

    def test_build_445_pages_and_dedupe_captions(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            web = root / "web"
            web.mkdir()
            pages = {
                23: '#align(center)[#text(size:7pt)[图 1.1　原书显微照片]]\n',
                60: '== 图2.8　沟道电荷示意\n#align(center)[*图2.8　沟道电荷的分布与偏置*]\n',
                269: '#align(center)[*图7.18　有驱动和负载的传输门*]\n',
                360: '前文图10.1仅在正文提到。\n#align(center)[*图10.7　驱动器和连线*]\n',
                401: '#align(center)[*图11.6　时钟示意图*]\n',
            }
            for p in range(1, 446):
                (web / (str(p).zfill(3) + "-page-" + str(p).zfill(3) + ".typ")).write_text(
                    pages.get(p, ""), encoding="utf-8"
                )
            status = root / "page-status.json"
            status.write_text(json.dumps({
                "pages": [{"pdf_page": p, "figures_verified": False} for p in range(1, 446)]
            }), encoding="utf-8")
            entries = build_records(web, status)
            self.assertEqual({x["number"] for x in entries},
                {"1.1", "2.8", "7.18", "10.7", "11.6"})
            by_number = {x["number"]: x for x in entries}
            self.assertEqual(by_number["2.8"]["title"], "沟道电荷的分布与偏置")
            self.assertEqual(by_number["2.8"]["printed_page"], 41)
            self.assertEqual(by_number["2.8"]["pdf_page"], 60)
            self.assertEqual(by_number["10.7"]["preview"], "360-page-360-layout.svg")
            public = root / "public"
            reference = root / "reference"
            write_outputs(entries, public, reference)
            payload = json.loads((public / "figure-index.json").read_text(encoding="utf-8"))
            self.assertEqual(payload["total"], 5)
            self.assertIn("图 10.7", (reference / "figures-catalog.md").read_text(encoding="utf-8"))


if __name__ == "__main__":
    unittest.main()
