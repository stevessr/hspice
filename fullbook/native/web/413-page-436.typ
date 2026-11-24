// SOURCE PDF PAGE 436 / printed page 417
// Native editable equations and editorial captions; Fig B.3 geometry not yet reconstructed.
#import "../figures/appendix-b-additional-native.typ": *
#set document(title:"附录B 肖特基二极管图B.3、式B.3与Ebers-Moll · PDF436")
= 附录 B · 印刷第417页
== B.2　肖特基势垒二极管（续）

图 B.3 是肖特基势垒二极管（Schottky barrier diode, SBD）的截面图：金属与轻掺杂 $n$ 型半导体构成整流接触，旁边通过 $n^+$ 区形成欧姆接触。正向偏置时，主要是多数载流子跨过金属—半导体势垒，因此少数载流子存储很小。

#align(center)[#b3-schottky-section()]

教材采用的电流—电压关系为：

$ I = I_0 (exp(V / V_T) - 1) quad "(B.3)" $

这里 $I_0$ 为饱和电流，$V_T$ 是热电压。原书比较同为 $20 " μm"^2$ 面积的肖特基二极管与 pn 结二极管：典型饱和电流分别约为 $10^(-10) " A"$ 和 $2 times 10^(-17) " A"$。根据该模型，同样正向电流下，肖特基器件正向压降较低，书中举例差约 $0.4 " V"$。

当金属—半导体接触处掺杂非常高时，势垒可以因隧穿机制形成近似欧姆接触，而不再产生理想的整流特性。

== B.3　用于电路模拟的 BJT 模型

书中以 Ebers–Moll 模型描述 BJT 的非线性直流电流。发射极电流方程：

$ I_E = I_S / alpha_F (exp(V_("BE") / V_T) - 1) - I_S (exp(V_("BC") / V_T) - 1) quad "(B.4.1a)" $

其中 $alpha_F$ 为正向共基极电流传输系数；第二项计入集电结的正向偏置影响。

_图 B.3 的原书截面、电极位置及虚线仍需单独进行几何重绘和版式对照。_
