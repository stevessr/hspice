// SOURCE PDF PAGE 374. Scan-guided native Typst selection, not a 1:1 accepted page.
// Printed textbook page 355; topology/plot curves remain editorial abstractions.
#import "../figures/ch10-inductance-antenna-native.typ": fig1020,fig1021,fig1022,fig1023,fig1024,fig1025,fig1026,fig1027,fig1028
#set document(title:"第10章·串扰、RLC和天线效应·源PDF374")
#set text(size:7.1pt)
#show par: set par(leading:2.25pt,spacing:3.3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[355　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 10.4.3　电容噪声或串扰

相邻信号线之间的耦合不仅造成时延变化，还可能在本应保持稳定的线网引入电压扰动，这类非预期的电压变化称为*串扰噪声*。

考虑图10.22中两个邻近线网。线网1是正在变化的侵略者，线网2是受害者；为得到一阶手算公式，假设受害者节点的阻性通路很弱，将其作为浮动的电容节点。令侵略者发生电压阶跃 $Delta V_1$，由电荷守恒可得：

#align(center)[$Delta V_2 = (C_c)/(C_"gnd" + C_c) Delta V_1 quad (10.17)$]

其中 $C_c$ 是两线之间耦合电容，$C_"gnd"$ 为受害者的自身对地电容。若侵略者变化幅度为 $V_"DD"$，受害者的毛刺幅度为：

#align(center)[$Delta V_2 = V_"DD" C_c/(C_"gnd" + C_c)$]

#fig1022()
#align(center)[*图10.22　侵略者与受害者之间的电容串扰模型（编辑示意）*]

当受害者线的噪声裕量很小时，串扰脉冲可能形成逻辑误触发。动态逻辑、保持电容较小的节点和时序敏感路径尤须注意。实际电路中驱动器有限电阻与输出电容还会影响毛刺峰值和持续时间。

*复核重点：* 式（10.17）是原书理想化的电荷分享模型，不等于对任意驱动波形都可以直接套用的精确仿真结果。
