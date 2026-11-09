#!/usr/bin/env python3
"""Unit tests for source-derived revision formula cards."""
import json
import tempfile
import unittest
from pathlib import Path

from build_revision_formulas import ROOT, generate, parse_table


class FormulaCatalogTests(unittest.TestCase):
    def test_current_textbook_index_covers_source_rows(self):
        index = generate(ROOT / "reference")
        self.assertEqual(index["total"], 145)
        self.assertEqual({x["chapter"] for x in index["entries"]}, set(range(1, 12)))
        self.assertEqual(len({x["id"] for x in index["entries"]}), 145)
        for item in index["entries"]:
            self.assertEqual(item["pdf_page"], item["printed_page"] + 19)
            self.assertTrue(item["latex"])
            self.assertTrue(item["name"])
            self.assertTrue(item["source_route"].startswith("/reference/"))
            self.assertTrue(item["original_label"])

    def test_formula_identifiers_stable_across_row_reordering(self):
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "source.md"
            header = "## 第 2 章：MOS 阈值\\n"
            a = "| **体效应**<br>源体偏置 | $V_T=V_{T0}+\\\\gamma$ | 式 (2.11) | 38 | [57](/native-workbench?page=57) |"
            b = "| **阈值参考**<br>零体偏 | $V_{T0}=V_{FB}$ | 式 (2.10) | 38 | [57](/native-workbench?page=57) |"
            path.write_text(header + a + "\\n" + b + "\\n", encoding="utf-8")
            original = parse_table(path, "/reference/example")
            path.write_text(header + b + "\\n" + a + "\\n", encoding="utf-8")
            reordered = parse_table(path, "/reference/example")
            self.assertEqual(
                {r["name"]: r["id"] for r in original},
                {r["name"]: r["id"] for r in reordered}
            )
            self.assertTrue(all(len(r["id"]) == 22 for r in original))

    def test_single_source_row_and_metadata(self):
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "source.md"
            path.write_text(
                "## 第 2 章：MOS 阈值\n"
                "| 公式名称 | 数学式 | 式号 | 印刷页 | PDF 页序 |\n"
                "|---|---|---|---:|---|\n"
                "| **体效应**<br>源体偏置 | $V_T=V_{T0}+\\gamma$ | 式 (2.11) | 38 | [57](/native-workbench?page=57) |\n",
                encoding="utf-8",
            )
            rows = parse_table(path, "/reference/example")
            self.assertEqual(len(rows), 1)
            self.assertEqual(rows[0]["name"], "体效应")
            self.assertEqual(rows[0]["topic"], "MOS 阈值")
            self.assertEqual(rows[0]["source_line"], 4)
            self.assertEqual(rows[0]["pdf_page"], 57)
            self.assertEqual(rows[0]["latex"], r"V_T=V_{T0}+\gamma")

    def test_invalid_printed_page_mapping_rejected(self):
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "source.md"
            path.write_text(
                "## 第 2 章：MOS 阈值\n"
                "| **体效应**<br>NMOS | $V_T=V_{T0}$ | 式 (2.11) | 38 | [58](/native-workbench?page=58) |\n",
                encoding="utf-8",
            )
            with self.assertRaisesRegex(ValueError, "inconsistent printed/PDF"):
                parse_table(path, "/reference/example")


if __name__ == "__main__":
    unittest.main()
