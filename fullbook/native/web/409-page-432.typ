// SOURCE PDF PAGE 432 / printed page 413
// Scan-grounded structural page: original has the netlist ending, Fig A.12
// and Fig A.13, but NO explanatory tables. Curves are editorial, not sampled.
// Fixed original-paper SVG is still awaiting strict 1:1 visual review.
#import "../figures/appendix-a-native.typ": *
#set document(title:"附录A · NMOS直流扫描和反相器脉冲响应 · PDF432")
= 附录 A · 印刷第413页

前一页的反相器瞬态网表以如下绘图语句与结束语句收尾：

#raw("* Plotting requests\n.plot tran V(3)\n.end",block:true)

== 图 A.12　NMOS 的 IV 特性

#align(center)[#a11-nmos-curves()]

*图 A.12　NMOS 的 IV 特性。* 双重直流扫描包含 $V_("gate")=0,0.45,0.90,1.35,1.80 " V"$ 五档栅压；原书只有 0.90、1.35、1.80 V 三条非零导通曲线明显可见。其余两档在截止附近接近横轴。图中电路源端、体端均接地，漏端和栅端分别接独立偏置源。

== 图 A.13　一个反相器的脉冲响应

#align(center)[#a13-transient()]

*图 A.13　一个反相器的脉冲响应。* 网表给定 $V_("DD")=1.8 " V"$、$C_("load")=10 " fF"$，输入 PULSE 从 1 ns 开始、宽度2 ns、周期4 ns。输出随输入反相，在约1–3 ns为低电平，其余时间为高电平。

_图 A.12 / A.13 已改为带器件端口、源和电容的可编辑 Typst 示意；曲线尚未按原扫描逐点数字化，布局未达到整页1:1验收。_
