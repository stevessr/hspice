// Typst entrypoint for the HSPICE midterm study guide.
// Markdown is canonical; `python3 scripts/sync_typst.py` regenerates Typst section files.
#set page(paper: "a4", margin: (top: 27mm, bottom: 25mm, left: 26mm, right: 26mm))
#set text(font: ("Noto Serif CJK SC", "Noto Serif", "DejaVu Serif"), size: 10.5pt, lang: "zh")
#set par(justify: true, first-line-indent: 2em, spacing: 0.65em)
#set heading(numbering: "1.1")
#show heading.where(level: 1): set text(font: "Noto Sans CJK SC", size: 19pt, weight: "bold")
#show heading.where(level: 2): set text(font: "Noto Sans CJK SC", size: 13pt, weight: "bold")
#show heading.where(level: 3): set text(font: "Noto Sans CJK SC", size: 11pt, weight: "semibold")
#show quote: set block(inset: (left: 10pt, right: 5pt), stroke: (left: 2pt + rgb("286a8a")))
#set page(header: context [#align(right)[#text(size: 8pt, fill: gray)[电子信息与集成电路 · 期中复习]]], footer: context [#align(center)[#counter(page).display()]] )

#v(28mm)
#align(center)[
  #text(size: 15pt, fill: rgb("286a8a"), weight: "semibold")[课程复习资料 · 理论与仿真相结合]
  #v(10mm)
  #text(font: "Noto Sans CJK SC", size: 25pt, weight: "bold")[电子信息与集成电路]
  #v(3mm)
  #text(font: "Noto Sans CJK SC", size: 22pt, weight: "bold")[期中考试复习讲义]
  #v(14mm)
  #text(size: 12pt)[MOS 晶体管 · 反相器 · CMOS 逻辑 · 时序电路 · HSPICE]
]
#v(26mm)
九项实验资料（实验一至实验九）与《数字集成电路分析与设计——深亚微米工艺（第三版）》配套复习资料。

内容以 Markdown 分章维护，由 Pandoc 转换生成对应的 Typst 章节。本文档不代表教师公布的考试范围。
#v(1fr)
#align(center)[#text(size: 9pt, fill: gray)[2026 年 11 月 · A4 · 复习提纲与附录]]
#pagebreak()
#outline(title: [目录], depth: 2)
#pagebreak()
#include "typst/reading-guide.typ"
#include "typst/sections/01-knowledge-map.typ"
#include "typst/sections/02-mos-basics.typ"
#include "typst/sections/03-device-parameters.typ"
#include "typst/sections/04-inverters-noise.typ"
#include "typst/sections/05-power-delay.typ"
#include "typst/sections/06-combinational-logic.typ"
#include "typst/sections/07-sequential-logic.typ"
#include "typst/sections/08-hspice-netlists.typ"
#include "typst/sections/09-practice.typ"
#pagebreak()
// 自编实践题目与解答同时进入打印版；Markdown 是唯一人工维护的来源。
#include "typst/practice/01-mos.typ"
#include "typst/practice/02-inverter.typ"
#include "typst/practice/03-logic.typ"
#include "typst/practice/04-sequential.typ"
#include "typst/practice/05-hspice.typ"
#pagebreak()
#include "typst/practice/answers/01-mos.typ"
#include "typst/practice/answers/02-inverter.typ"
#include "typst/practice/answers/03-logic.typ"
#include "typst/practice/answers/04-sequential.typ"
#include "typst/practice/answers/05-hspice.typ"
#pagebreak()
#set heading(numbering: none)
#include "typst/appendices/a-formula-reference.typ"
#include "typst/appendices/b-truth-tables.typ"
#include "typst/appendices/c-hspice-quick-reference.typ"
#include "typst/appendices/d-experiment-index.typ"
#include "typst/appendices/e-source-discrepancies.typ"
#include "typst/appendices/f-checklist.typ"
