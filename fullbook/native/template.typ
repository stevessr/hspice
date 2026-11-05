// Entirely native Typst smoke-test fixture, not textbook transcription.
#set document(title: "Editable Typst Layout and Circuit Demonstration")
#set page(width: 506.8346pt, height: 729.6pt,
  margin: (top: 42pt, bottom: 48pt, left: 51pt, right: 46pt))
#set text(font: ("Noto Serif CJK SC", "DejaVu Serif"), size: 9.6pt, lang: "zh")
#set par(first-line-indent: 2em, justify: true, leading: 0.55em, spacing: 0.6em)
#show heading.where(level: 1): set text(font: "Noto Sans CJK SC", size: 17pt, weight: "bold")
#show heading.where(level: 2): set text(font: "Noto Sans CJK SC", size: 12pt, weight: "bold")

= 原生 Typst 组件样例

本文仅用于测试排版组件；不是教材原文。

== 数学表达式

$ V_"GS" = V_G - V_S $

$ I_D = (mu_n C_"ox") / 2 dot W/L (V_"GS" - V_"TH")^2 $

== 表格

#table(
  columns: (1fr, 1fr, 2fr),
  [器件], [控制端], [说明],
  [NMOS], [G], [栅极电压控制导电沟道],
  [PMOS], [G], [互补 MOS 电路中的上拉器件],
)

== 可编辑示意图

#figure(
  [#include "figures/nmos.typ"],
  caption: [MOS 器件结构示意；方框、颜色、文字均为 Typst 元素。],
)
