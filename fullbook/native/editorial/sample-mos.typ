// Partial source PDF pages 50-53 (MOS chapter printed pp. 31-34).
= 第 2 章：MOS 器件与阈值公式

#text(size: 8pt, fill: gray)[来源定位：原扫描 PDF 第 50—53 页。以下包含可编辑结构表格及部分数学公式。]

== NMOS、PMOS 与 CMOS 工艺

MOS 四个接线端为漏极 D、栅极 G、源极 S 和体端 B。NMOS 的源漏采用 n⁺ 区，通常位于 p 型区域；PMOS 的源漏为 p⁺ 区，通常位于 n 型阱。互补 CMOS 工艺通过不同的阱和隔离区布置两类器件。

#table(columns: (1fr, 1fr, 1fr), inset: 5pt,
  table.header([*比较*], [*NMOS*], [*PMOS*]),
  [源漏], [$n^+$], [$p^+$],
  [沟道所在区域], [$p$ 阱], [$n$ 阱],
  [典型体端参考], [GND], [$V_"DD"$],
)

#figure(
  [#include "../figures/nmos.typ"],
  caption: [MOS 结构示意；使用原生 Typst 图形，非整页扫描图。],
)

== 本征载流子和质量作用定律

$ n_i = 1.45 times 10^10 / "cm"^3 $

$ n p = n_i^2 $

$ n approx n_i^2 / N_A $

== 费米势和氧化层电容

$ phi_"Fp" = (k T) / q ln(n_i / p) $

$ phi_"Fn" = (k T) / q ln(n / n_i) $

$ C_"ox" = epsilon_"ox" / t_"ox" $

#text(size: 8pt, fill: gray)[图 2.2—2.5 的原书几何、脚注及全部解释段落尚未完成逐字核对。]
