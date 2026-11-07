// SOURCE PDF PAGE 151 / printed 132
#set document(title:"第4章 · CMOS VIL/VIH式4.17—4.19 · PDF151")
= 第4章 · 印刷第132页

对式（4.16）应用单位负斜率条件，得到低输入逻辑边界：

$ V_("IL") =
(2 V_("out")-V_("DD")-abs(V_("TP"))+(k_N/k_P)V_("TN")) /
(1+(k_N/k_P)) quad "(4.17)" $

该式依赖输出电压 $V_("out")$，需要与式（4.16）联立求解，得到 $V_("IL")$ 及对应的 $V_("out")=V_("OUL")$。

当 $V_("in")=V_("IH")$ 时，反相器处于区域IV，NMOS线性、PMOS饱和：

$ I_("DN")("lin") = I_("DP")("sat") $

在忽略有关 $E_cL$ 分母中的小项后：

$ (W_N/L_N) mu_n C_("ox") [
 (V_("in")-V_("TN")) V_("out")-V_("out")^2/2 ] = $
$ (W_P/L_P)(mu_p C_("ox")/2)
 (V_("DD")-V_("in")-abs(V_("TP")))^2 quad "(4.18)" $

再次求导并代入 $dif V_("out")/dif V_("in")=-1$，有：

$ V_("IH") =
(2 V_("out")+V_("TN")+(k_P/k_N)(V_("DD")-abs(V_("TP")))) /
(1+(k_P/k_N)) quad "(4.19)" $

把该结果与式（4.18）联立，可求得 $V_("IH")$ 与相应 $V_("out")=V_("OUH")$。以上结果基于第一次MOS模型的近似，具体数值还需SPICE检验。

== 例4.7　0.18 μm工艺中CMOS反相器的SPICE分析和手工计算

对图4.12(a)，比较SPICE与手工分析的VTC参数。原书指定 $W_N=400 " nm"$、$W_P=800 " nm"$，工艺低场迁移率为 $mu_n=270 " cm²/(V·s)"$、$mu_p=70 " cm²/(V·s)"$；余下参数和完整网表见下一扫描页。
