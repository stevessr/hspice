// SOURCE PDF PAGE 155 / printed 136
#import "../figures/ch4-cmos-continued-native.typ": pseudo-nmos
#import "../figures/ch4-mos-loads-native.typ": cmos-inverter
#set document(title:"第4章 · 图4.14伪NMOS及式4.20—4.21 · PDF155")
= 第4章 · 印刷第136页

== 图4.14　CMOS反相器和伪NMOS反相器

#pseudo-nmos()

*图4.14*　(a) CMOS上拉PMOS与下拉NMOS共栅；(b) 伪NMOS的上拉PMOS栅接地，下拉NMOS栅由输入控制。本图为原生编辑拓扑。

伪NMOS高电平由始终导通的PMOS上拉，因而：

$ V_("OH") = V_("DD") quad "(4.20)" $

当输入为高电平、输出为低电平时，PMOS在饱和区、NMOS在线性区：

$ I_("DP")("sat") = I_("DN")("lin") $

采用原书的速度饱和模型：

$ (W_P v_("sat") C_("ox") (V_("DD")-abs(V_("TP")))^2) /
((V_("DD")-abs(V_("TP")))+E_("cP")L_P) = $
$ (W_N/L_N) (mu_n C_("ox"))/(1+V_("OL")/(E_("cN")L_N)) $
$ times [(V_("DD")-V_("TN"))V_("OL")-V_("OL")^2/2] quad "(4.21)" $

因为目标 $V_("OL")$ 较小，可以简化为：

$ V_("OL") approx I_("DP")("sat") /
(k_N (V_("DD")-V_("TN"))) $

由目标低电平计算两个器件的宽度比例，再借助SPICE验证实际VTC。

== 例4.8　设计0.18 μm工艺伪NMOS反相器

目标 $V_("OH")=1.8 " V"$、$V_("OL")=0.065 " V"$；用SPICE绘出VTC检验。题设：

#table(columns:(1.45fr,1.75fr),
[$mu_n$],[270 cm²/(V·s)],
[$mu_p$],[70 cm²/(V·s)],
[$C_("ox")$],[1.0 μF/cm²],
[$V_("TN")$, $V_("TP")$],[0.5 V、-0.5 V],
[$E_("cN")L_N$, $E_("cP")L_P$],[1.2 V、4.8 V],
[$V_("DD")$, $L$],[1.8 V、200 nm],
)

尺寸计算与HSPICE结果继续见下一页。
