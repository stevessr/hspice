// SOURCE PDF PAGE 104 / editorial Typst candidate, not 1:1 accepted.
#set document(title:"第3章 · 结电容参数与MOS LEVEL1提取 · PDF104")
#set text(lang:"zh")
= 第3章 · 印刷第85页

== SPICE MOS 结电容

源漏结电容分为底部和侧壁分量。CJ以面积为单位，CJSW以周长为单位；它们乘以漏源的面积、周长才能得到总电容。教材取参数MJ、MJSW作为底部和侧壁指数，PB为结内建电势：

$ C_("JD") =
 ("CJ" times "AD")/(1 - V_j/"PB")^"MJ" +
 ("CJSW" times "PD")/(1 - V_j/"PB")^"MJSW"
 quad "(3.10)" $

$ C_("JS") =
 ("CJ" times "AS")/(1 - V_j/"PB")^"MJ" +
 ("CJSW" times "PS")/(1 - V_j/"PB")^"MJSW" $

在本书模型中，CJ的单位是F/m²，CJSW的单位是F/m。这里的Vj表示所讨论源/漏结的偏置。

原书还列出反偏结饱和电流参数IS、JS，以及源漏串联电阻RD、RS或单位方块的RSH。对某个器件实例，还需要扩散区面积AS/AD与周长PS/PD，以及源漏电阻的方块数NRS/NRD。

== 3.5.1　MOS LEVEL 1 参数的提取

为确定VTO、GAMMA、KP和LAMBDA，采用不同体偏电压和漏源电压下的测量数据。选择器件在饱和区工作，以便把长沟道平方律线性化。

当忽略LAMBDA时，方程写成：

$ sqrt(2 I_D) = sqrt((W_("eff") "KP")/L_("eff")) (V_("GS") - V_T)
 quad "(3.11)" $

绘制纵坐标为 $\sqrt(2I_D)$、横坐标为 $V_("GS")$ 的图，直线的横轴截距给出阈值电压VTO，斜率可用于提取KP。改变源体偏压后重复该操作，可以拟合GAMMA。

如果在固定过驱动电压下改变VDS，保持器件于饱和区，可通过两个I–V测量点求LAMBDA。图3.11给出这些曲线与测试电路。

_式3.10底结/侧壁、面积和周长单位，式3.11平方根关系均按源图核对。_
