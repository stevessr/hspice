// Source PDF page 045 / printed page 26; exercise diagrams are editable.
#import "../figures/chapter1-ending.typ": inverter-chain, rc-step
#set document(title: "原书第45页 · 五级反相器、RC与开关负载")
#set text(lang: "zh")

= 第1章 · 第26页

== P1.7　反相器链与环振

#inverter-chain()

*图P1.7　五级反相器串接和闭合反馈结构（原生拓扑示意）。*

若每个反相器的传播延迟约为 $t_p=2 " ns"$，五级串联的传播延迟为

$ t_("path") = 5 t_p = 10 " ns" $

当五个反相器闭合成奇数级环形振荡器，理想延迟模型的振荡周期为 $T approx 2 cdot 5 t_p = 20 " ns"$，因此 $f approx 50 " MHz"$。

== P1.8　RC 阶跃充电

#rc-step()

原题使用 $R=12.5 " k" Omega$、$C=100 " fF"$，0 V 到 1.2 V 的阶跃输入。对于电容最初未充电的理想一阶 RC 网络：

$ V_C(t) = 1.2 (1 - exp(-t/(R C))) $

$ t(V) = - R C ln(1 - V/1.2) $

因此达到0.6 V的时间为 $t_(50%)=R C ln 2$。精确达到最终稳态的 1.2 V 需要无限长时间；10% 到90%上升时间约为 $2.2 R C$。

== P1.9　开关电阻与电容负载

原图P1.9将电容经开关连接至上拉 $R_1=30 " k" Omega$ 或下拉 $R_2=12.5 " k" Omega$，$V_("DD")=1.2 " V"$，$C_("load")=1 " mu F"$。对充放电分别使用对应电阻与目标电平，即可推导达到0.6 V的时间及其比值。

_题解属于配套学习说明，不是原书习题答案；图P1.9开关符号及全部标注尚未完整重绘。_
