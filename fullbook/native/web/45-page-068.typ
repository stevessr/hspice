// Source PDF page 068 / printed page 49. Long/short limiting and Ex 2.6.
#import "../figures/mos-velocity-native.typ": nmos-pmos-drive
#set document(title:"第2章 · 长短沟道极限、例2.6与图2.14 · PDF68页")
#set text(lang:"zh")

= 第2章 · 印刷第49页

== 式（2.29）的两种极限

当 $E_c L$ 远大于 $V_("GS")-V_T$ 时，简化速度模型退化为长沟道平方律：

$ I_("DS") approx (W/(2 L)) mu_e C_("ox") (V_("GS") - V_T)^2 $

当 $E_c L$ 远小于 $V_("GS")-V_T$ 时，短沟道速度饱和电流更接近对过驱动电压的一次关系：

$ I_("DS") approx W v_("sat") C_("ox") (V_("GS") - V_T) $

== 例2.6　0.18 μm工艺中 NMOS 与 PMOS 的饱和电压

原题取 $V_("GS") = 1.8 " V"$、$V_("TN") = +0.5 " V"$、$V_("TP") = -0.5 " V"$，为简化计算令两器件沟道长度均为 $L=200 " nm"$。

根据式（2.22）给出的临界场，书中计算 $E_("cn") L = 1.2 " V"$，$E_("cp") L = 4.8 " V"$。

$ V_("Dsat,N") = (1.3 dot 1.2)/(1.3+1.2) approx 0.6 " V" $

$ V_("Dsat,P") = (1.3 dot 4.8)/(1.3+4.8) approx 1.0 " V" $

这里对 PMOS 使用源漏与栅源偏压的幅值；两种器件因临界场不同而在不同电压进入速度饱和。

#nmos-pmos-drive()

*图2.14　1X NMOS、1X/2X/3X PMOS的驱动电流示意（原生矢量图）。* 原书比较指出，饱和区 1X NMOS 与 3X PMOS 的电流接近，尽管两种器件的迁移率比约为4:1。

_例2.6关键数字已核对；图2.14曲线斜率、标记点与数据位置仍未达到定量重绘。_
