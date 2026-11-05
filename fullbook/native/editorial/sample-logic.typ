// Editable study transcription excerpts derived from user-provided scans.
// Source PDF pages: 24-26, 28-29, 31 (partial; not the complete source pages).
= 第 1 章：可编辑的数字逻辑公式与表格

#text(size: 8pt, fill: gray)[来源定位：原扫描 PDF 第 24—31 页。此文件为可编辑的部分转写与核对样例，不代表整页完成。]

== 表 1.1：深亚微米器件与互连问题

#table(
  columns: (1fr, 1fr), inset: 5pt,
  table.header([*器件相关*], [*互连相关*]),
  [短沟道效应], [RC 延迟],
  [速度饱和], [IR 降低],
  [薄氧化层隧道电流], [$L dot (d i) / (d t)$],
  [亚阈值电流], [电容耦合],
  [漏致势垒降低（DIBL）], [电感耦合],
  [热载流子效应], [电迁移],
  [], [天线效应]
)

== NAND 与 NOR 逻辑真值表

#grid(columns: (1fr, 1fr), gutter: 10pt,
  table(columns: (auto, auto, auto), inset: 4pt,
    table.header([A], [B], [NAND]),
    [0], [0], [1], [0], [1], [1], [1], [0], [1], [1], [1], [0]),
  table(columns: (auto, auto, auto), inset: 4pt,
    table.header([A], [B], [NOR]),
    [0], [0], [1], [0], [1], [0], [1], [0], [0], [1], [1], [0]),
)

== 布尔函数与德摩根定律

$ F = A C + B C + A D + B D = (A+B)(C+D) $

$ F_("XOR") = A times overline(B) + overline(A) times B $

$ F_("MUX") = A S + B overline(S) $

$ overline(A+B) = overline(A) times overline(B) $

$ overline(A B) = overline(A) + overline(B) $

== 噪声容限

$ "NMH" = V_"OH" - V_"IH" $

$ "NML" = V_"IL" - V_"OL" $

== 功耗的原生公式

$ P = I V_"DD" $

$ P_"total" = P_"static" + P_"dynamic" $

$ P_"static" = (I_"DC" + I_"leakage") V_"DD" $

$ P_"dynamic" = C V_"DD"^2 f $

#text(size: 8pt, fill: gray)[公式下标、乘法与表格均为 Typst 原生元素，可在源码中编辑。页面中的历史叙述、原书全部插图与脚注仍需逐页补齐。]
