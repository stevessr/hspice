// SOURCE PDF PAGE 024 / printed page 5
// Scan-guided editable reconstruction of Table 1.1 and Figure 1.3 (2026-11-08).
// Symbol geometry is native Typst; original page typography and line wrapping are pending review.
#import "../figures/gate-symbols.typ": gate-symbol
#set document(title:"第1章 · 表1.1 DSM问题与图1.3基本逻辑门 · PDF024")
= 第1章 · 印刷第5页

== 表1.1　主要的 DSM 器件问题和互连问题的简要列表

#table(
  columns: (1fr, 1fr),
  table.header([*DSM 器件*], [*DSM 互连*]),
  [短沟道效应对 $V_T$ 的影响], [RC 延迟],
  [速度饱和], [IR 降低],
  [薄氧化层（隧道/穿通）], [$L dif i / dif t$],
  [亚阈值电流], [电容耦合],
  [DIBL], [电感耦合],
  [热载流子效应], [电迁移],
  [], [天线效应],
)

本书主要讨论 0.18 μm 和 0.13 μm 工艺中的数字集成电路设计。130 nm 工艺采用低 $k$ 介质的铜互连、双阱工艺与浅沟槽隔离（STI）。教材说明 0.18 μm 及其后的工艺也采用 STI；对 0.18 μm 工艺的分析和设计方法在这两代工艺之间具有共通性。

== 1.3　数字逻辑门设计的回顾
=== 1.3.1　基本的逻辑函数

数字逻辑门实现布尔函数。本页图 1.3 并列给出反相器（INV）、与非门（NAND）和或非门（NOR）的图形符号及对应真值表。

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 5pt,
  [
    *反相器（INV）*
    #gate-symbol(kind: "inverter")
    #table(
      columns: (1fr, 1fr),
      table.header([A], [F]),
      [0], [1],
      [1], [0],
    )
  ],
  [
    *NAND*
    #gate-symbol(kind: "nand")
    #table(
      columns: (1fr, 1fr, 1fr),
      table.header([A], [B], [F]),
      [0], [0], [1],
      [0], [1], [1],
      [1], [0], [1],
      [1], [1], [0],
    )
  ],
  [
    *NOR*
    #gate-symbol(kind: "nor")
    #table(
      columns: (1fr, 1fr, 1fr),
      table.header([A], [B], [F]),
      [0], [0], [1],
      [0], [1], [0],
      [1], [0], [0],
      [1], [1], [0],
    )
  ],
)
*图1.3*　基本的逻辑门（可编辑符号与真值表）。

$ F_("INV") = overline(A) $
$ F_("NAND") = overline(A B) $
$ F_("NOR") = overline(A+B) $

_脚注、原始字符间距与图1.3的线段位置仍需继续逐页比对；不计入 1:1 验收。_
