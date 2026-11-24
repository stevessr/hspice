// SOURCE PDF PAGE 414 / printed 395; scan-guided editable Chapter 11.
// Original illustrations are editable abstractions; full-page 1:1 review remains open.
#import "../figures/ch11-pll-summary-native.typ": fig1135,fig1136,fig1137,fig1138,fig1139,fig1140,fig1141,fig1142,fig1143,fig1144
#set document(title:"第11章 · PLL/DLL 时钟同步 · PDF414")
#set text(lang:"zh",size:7.25pt)
#show par: set par(leading:2pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[第11章　电源网格和时钟设计　　　　　　　　　395]]
#line(length:100%,stroke:.5pt)

对这种类型电路的使用会增加，因为芯片变得更大，并且有更多芯片上的时钟同步问题出现。

在数字 VLSI 设计中另一个有用的电路是 DLL 模块，它使数据与时钟信号同步。对 PLL 可以进行修改来实现一个 DLL，这是通过用一条电压控制延迟线（VCDL, voltage-controlled delay line）代替 VCO 来完成的，如图 11.42 所示。对 PLL 描述的同样类型的分析可以应用到 DLL 中。该电路利用控制信号 $V_c$ 来改变每个反相器的延迟。VCDL 电路可以用级联的多个级来构造一条延迟线。这个电路很普通，因为比 PLL 有更好的稳定性且更容易设计。使用简单电容作为环路滤波器能更稳定。然而会把输入抖动直接传输到输出端。该电路广泛用于时钟和数据恢复应用中。

#fig1142()
#align(center)[#text(size:7.2pt)[图 11.42　有电压控制延迟线的 DLL]]

== 11.4.2　时钟分布总结

作为总结，正确的时钟设计的关键是设计应尽可能平衡。首先，应该使用诸如缓冲的 H 树等结构来最小化时钟偏斜。应当使用如下方法进行控制：限制最大和最小连线长度，使用同等尺寸缓冲器的对称树结构；对于门控时钟使用“所有或全无”（all-or-none）策略。最后一级驱动局部触发器的缓冲器可以不相同，因为扇出不必相同，但应该使通过最后缓冲器的延迟相同。

时钟边沿应该尽可能保持尖前，应该对电源 VDD 和 Gnd 屏蔽时钟连线，限制串扰并适当折中。通过仔细控制电容和使用门控时钟使功耗最小化。电源电压应该通过使用去耦电容调节，特别是在有同时变化的大时钟缓冲器的区域中更应当这样。应使用 PLL 或 DLL 电路同步外部与内部的时钟信号。

Alpha 21264 是一个在时钟网络设计中集成时钟层级的例子，如图 11.43 所示。全局时钟（GCLK）由芯片上的低抖动锁相环（PLL）产生，GCLK 信号沿主干线连接到芯片中心，并通过 X 树和 H 树分布到位于芯片上按照窗口图形排布的 16 个 GCLK 驱动器上。图 11.44 显示微处理器的时钟层次，局部时钟和局部条件时钟（门控时钟）在 GCLK 之后被驱动了几级。