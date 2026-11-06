// Source PDF page 076 / printed page 57. pn junction Eqs 2.36–2.39 and Fig 2.19.
#import "../figures/mos-cap-native.typ": pn-junction-cap
#set document(title:"第2章 · pn结漏电与电容模型 · PDF76页")
#set text(lang:"zh")

= 第2章 · 印刷第57页

== 2.8.2　pn结电容（续）

在正常数字 MOS 电路中，源体或漏体 pn 结通常处于反向偏置状态。对于反偏且未击穿的二极管，正向指数项可忽略，于是：

$ I_D approx -I_s quad "(2.36)" $

其中 $I_s$ 表示二极管反向饱和电流；教材提醒该反向漏电在大量晶体管集成时仍可能影响静态功耗。

== 内建结电势

内建电势由半导体掺杂决定：

$ phi_B = (k T)/q ln((N_A N_D)/(n_i^2)) quad "(2.37)" $

== 反向偏置下的结电容

原书将耗尽层电容写成偏置相关的经验公式：

$ C_j = (C_("j0") A)/(1 - V_j/phi_B)^m quad "(2.38)" $

这里 $A$ 是结面积，$m$ 表示结的渐变系数，$C_("j0")$ 为零外加偏置时单位面积结电容。

对于突变结的零偏置结电容，教材采用：

$ C_("j0") = sqrt((epsilon_("si") q)/(2 phi_B) (N_A N_D)/(N_A+N_D)) quad "(2.39)" $

#pn-junction-cap()

*图2.19　结电容和所加电压之间的关系。* 随反向偏压增大，耗尽层变宽，结电容下降。右侧接近正向内建电势时，简单耗尽近似不再适用。

_式（2.36）—（2.39）已整理为可编辑Typst数学，图2.19尚未根据原扫描逐点数字化。_
