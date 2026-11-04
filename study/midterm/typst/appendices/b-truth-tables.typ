// GENERATED FILE -- edit Markdown and run scripts/sync_typst.py
= 逻辑功能与真值表速查
<逻辑功能与真值表速查>
== 基本门与二选一选择器
<基本门与二选一选择器>
#figure(
align(center)[#table(
  columns: 8,
  align: (col, row) => (center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [AND], [OR], [NAND], [NOR], [XOR], [XNOR],
  [0],
  [0],
  [0],
  [0],
  [1],
  [1],
  [0],
  [1],
  [0],
  [1],
  [0],
  [1],
  [1],
  [0],
  [1],
  [0],
  [1],
  [0],
  [0],
  [1],
  [1],
  [0],
  [1],
  [0],
  [1],
  [1],
  [1],
  [1],
  [0],
  [0],
  [0],
  [1],
)]
)

#figure(
align(center)[#table(
  columns: 4,
  align: (col, row) => (center,center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [S], [$F = A S + B S^(‾)$],
  [0],
  [0],
  [0/1],
  [0],
  [0],
  [1],
  [0],
  [1],
  [0],
  [1],
  [1],
  [0],
  [1],
  [0],
  [0],
  [0],
  [1],
  [0],
  [1],
  [1],
  [1],
  [1],
  [0/1],
  [1],
)]
)

== 锁存器与触发器
<锁存器与触发器>
#figure(
align(center)[#table(
  columns: 6,
  align: (col, row) => (center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [$S^(‾)$], [$R^(‾)$], [NAND 型 SR 功能], [J], [K], [JK 功能],
  [1],
  [1],
  [保持],
  [0],
  [0],
  [保持],
  [0],
  [1],
  [置位],
  [0],
  [1],
  [复位],
  [1],
  [0],
  [复位],
  [1],
  [0],
  [置位],
  [0],
  [0],
  [不允许],
  [1],
  [1],
  [翻转],
)]
)

#quote(block: true)[
两张表的输入意义不同：SR 表的 $S^(‾) , R^(‾)$ 为#strong[低有效电平];；JK 表的 J、K 是正逻辑功能输入。不可只比较 00 行便判定两个器件相同。
]
