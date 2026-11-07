// SOURCE PDF PAGE 265 · printed 246 · Example7.3 source truth table.
#import "../figures/ch7-pass9-native.typ": fig714
#set document(title:"第7章 例7.3 用传输门实现组合函数 · PDF265")
#align(center)[#text(size:8pt,weight:"bold")[246　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

*例7.3　用传输门实现功能 $F=A B+A overline(B) C+overline(A) overline(C)$*

*解答：* 指定A和B为控制信号并建立真值表。

#align(center)[
#table(columns:(1fr,1fr,1fr),inset:7pt,
 table.header([A],[B],[F]),
 [0],[0],[$overline(C)$],
 [0],[1],[$overline(C)$],
 [1],[0],[$C$],
 [1],[1],[1])
]

用F作为数据输入，这个真值表能够直接实现，如下图所示。

#fig714()

真值表的前两行对应于多路器靠下面的部分，可以把它们合并起来以简化实现。此外，连接到 $V_("DD")$ 的传输门不需要n沟道器件，因为它只传送高电压值。通过这两次优化，得出下面的电路。

#fig714()

CMOS传输门也能同组合模块一起使用从而有效完成特定的功能。图7.14中的第一个电路是一个六管的异或门。第二个电路简单说明了使用传输门逻辑和标准CMOS逻辑来实现复杂功能的用法。为了快速地从给定电路中得出功能F，我们从传输门中NMOS那一边进行分析。在这种情形下，控制信号决定导通路径和输出。