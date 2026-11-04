// GENERATED FILE -- edit Markdown and run scripts/sync_typst.py
= 实践三参考解答：CMOS 组合逻辑
<实践三参考解答cmos-组合逻辑>
== 题 1 · NAND 与 NOR
<题-1-nand-与-nor>
NAND：$F = overline(A B)$，PMOS 上拉并联，NMOS 下拉串联；只有 $A = B = 1$ 才能形成完整下拉通路。

NOR：$F = overline(A + B)$，PMOS 上拉串联，NMOS 下拉并联；只要任一输入为高，对应 NMOS 就能导通下拉路径。

== 题 2 · 真值表
<题-2-真值表>
#figure(
align(center)[#table(
  columns: 6,
  align: (col, row) => (center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [$A$], [$B$], [NAND], [NOR], [XOR], [XNOR],
  [0],
  [0],
  [1],
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
  [1],
  [0],
  [1],
  [0],
  [1],
  [1],
  [0],
  [0],
  [0],
  [1],
)]
)

NAND 在两个输入均为 1 时取 0；NOR 仅在两个输入均为 0 时取 1；XOR 在两输入不同时取 1；XNOR 在两输入相同时取 1。

== 题 3 · 二选一选择器
<题-3-二选一选择器>
$ F = A S + B overline(S) . $

例如，$S = 0 , A = 0 , B = 1$ 时 $F = 1$；$S = 0 , A = 1 , B = 0$ 时 $F = 0$；$S = 1 , A = 1 , B = 0$ 时 $F = 1$；$S = 1 , A = 0 , B = 1$ 时 $F = 0$。实现时用反相器产生 $overline(S)$，并联形成 $A S$ 与 $B overline(S)$ 两项后相或，也可以设计对偶 CMOS 网络或传输门网络。单 NMOS 传输高电平存在阈值电压造成的电平损失，互补传输门可缓解。

== 题 4 · NAND VTC
<题-4-nand-vtc>
两种输入条件导致导通管的组合和网络有效驱动强度不同，内部串联节点电压与体源偏置也可能发生变化，因此转换点和曲线斜率不必一致。比较时应保持工艺角、供电、器件尺寸、负载和温度一致，改变的仅为输入扫描方式，并确认横轴变量和波形图例。

#link("../03-logic.md")[返回实践三题目]
