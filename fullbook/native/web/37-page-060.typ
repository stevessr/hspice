// Source PDF page 060 / printed page 41; equations 2.13–2.16 and figure 2.8.
#import "../figures/mos-iv-native.typ": mos-biased-channel
#set document(title: "第2章 · 沟道电荷和迁移率推导 · PDF60页")
#set text(lang: "zh")

= 第2章 · 印刷第41页

== 2.4　一次电流—电压特性：沟道电荷模型

以沟道源端为 $y=0$、漏端为 $y=L$，令任意位置相对于源端的电势为 $V(y)$，因此 $0 <= V(y) <= V_("DS")$。

栅与局部沟道之间的有效电压为 $V_("GS") - V(y)$。在此电压高于阈值时，按原书把电子反型层电荷的量值记作 $Q_n$，其单位面积电荷密度为：

$ Q_n(y) = C_("ox") [ V_("GS") - V(y) - V_T ] quad "(2.13)" $

设沟道宽度 $W$、载流子漂移速度大小 $v$，则漏源电流为：

$ I_("DS") = Q_n times v times W quad "(2.14)" $

#mos-biased-channel()

*图2.8　NMOS 偏置和沿沟道位置 $y$ 的示意（原生可编辑结构）。*

== 迁移率近似和工艺传导参数

长沟道、低电场的初级近似令电子速度与横向电场 $E$ 成正比：

$ v = mu_n E, quad E = (dif V(y))/(dif y) quad "(2.15)" $

代入电荷密度，有

$ I_("DS") dif y = W mu_n C_("ox") [ V_("GS") - V(y) - V_T ] dif V $

定义工艺传导参数：

$ k' = mu_n C_("ox") = (mu_n epsilon_("ox")) / t_("ox") quad "(2.16)" $

这里的 $k'$ 含有迁移率与氧化层电容，而不是器件宽长比。下一页把 $W/L$ 单独引入器件传导参数。

_校对记录：式（2.13）—（2.16）及图2.8的关键符号已核对扫描；器件图是可编辑原生示意，原图的每根线条及版式尚未严格验收。_
