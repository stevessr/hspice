// SOURCE PDF PAGE 110 / printed 91, example3.4 SPICE sweep.
#import "../figures/bsim-effects-native.typ": iv-simulation
#set document(title:"第3章 · 例3.4 HSPICE MOS直流扫描 · PDF110")
#set text(lang:"zh")
= 第3章 · 印刷第91页

== 例3.4　0.18 μm CMOS的BSIM3 I–V特性

原书给出以1.8 V供电的SPICE输入文件，用0.18 μm模型分别扫描NMOS和PMOS。设置沟道长度约0.2 μm，沟道宽度约0.4 μm，采用零、二分之一、四分之三以及全电源电压的栅偏置。

源书的网表大体包含如下结构与命令（此处为可编辑教学用骨架，不是完整逐字文件）：

#raw(".param Supply=1.8\n.lib 'cmos.18u' TT\n* NMOS / PMOS D G S B instance definitions\n.dc Vdn 0 1.8 0.01\n.plot dc I1(mn)\n.end",block:true)

#iv-simulation()

*例3.4　NMOS和PMOS的I–V特性曲线。本图仅重建随栅压变化的结构性趋势，未重用原书实验数据。*

扫描示例对比指出：NMOS在正漏源电压下导通，PMOS按相反偏置极性工作。电流在小漏压区随VDS增加，而高电场下提前饱和。NMOS与PMOS的单位宽度电流不同，因此设计相似上拉、下拉驱动能力时通常需要宽度调整。

教材采用图中高栅压的饱和电流比较，示例计算的NMOS/PMOS电流比约为2.8。这个数值来自书中的历史工艺模型条件，不是所有技术的常数。

_原书例3.4的电源、尺寸、扫描范围和2.8倍电流比已对照扫描；图中实验散点和完整网表仍需逐点逐行验收。_
