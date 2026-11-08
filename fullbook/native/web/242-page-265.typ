// SOURCE PDF PAGE 265 · PRINTED 246. Example 7.3 truth-table
// and two implementations; precise 7.14 routing remains unaccepted.
#import "../figures/ch7-transmission-mux-native.typ": fig714
#set document(title:"第7章 · 例7.3传输门逻辑实现 · PDF265")
#align(center)[#text(size:8pt,weight:"bold")[246　　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

*例 7.3　用传输门实现功能 $F=AB+A overline(B)C+overline(A)overline(C)$*

*解答：* 指定 $A$ 和 $B$ 为控制信号并建立真值表。

#align(center)[
#table(columns:(1fr,1fr,1.3fr),inset:4pt,
  table.header([A],[B],[F]),
  [$0$],[$0$],[$overline(C)$],
  [$0$],[$1$],[$overline(C)$],
  [$1$],[$0$],[$C$],
  [$1$],[$1$],[$1$])
]

用 $F$ 作为数据输入，这个真值表能够直接实现，如下图所示。

#fig714()

真值表的前两行对应于多路器靠下面的部分，可以把它们合并起来以简化实现。此外，连接到 $V_("DD")$ 的传输门不需要 n 沟道器件，因为它只传送高电压值。通过这两处优化，得出下面的电路：

#fig714()

CMOS 传输门也能同组合模块一起使用从而有效完成特定的功能。图 7.14 中的第一个电路是一个六管的异或门，第二个电路简单说明了使用传输门逻辑和标准 CMOS 逻辑来实现复杂功能的方法。为了快速地从给定电路中得出功能 $F$，我们从传输门中 NMOS 那一边进行分析。