// SOURCE PDF PAGE 149 / printed 130
// Scan proofread: complete region-IV velocity-saturation current equation restored.
#set document(title:"第4章 · 例4.6切换点及区域IV/V · PDF149")
= 第4章 · 印刷第130页

== 例4.6　计算0.13 μm工艺中CMOS反相器的 $V_S$ 值

*问题：* 计算CMOS反相器的切换电平。在两种情况下均取 $W_N=100 " nm"$，PMOS宽度分别为 $W_P=400 " nm"$ 和 $W_P=100 " nm"$。观察PMOS宽度变化对切换电平的影响。

*解答：* 利用式（4.14）和（4.15）。第一种情况：

$ W_N=0.1 " μm", quad W_P=0.4 " μm" $

$ chi = sqrt((W_N/(E_("cN") L_N))/(W_P/(E_("cP") L_P))) = sqrt((W_N E_("cP"))/(W_P E_("cN"))) =
sqrt((0.1 times 24)/(0.4 times 6))=1.0 $

$ V_S=(0.8+(0.4) times 1.0)/(1+1.0)=0.6 " V" $

第二种情况：

$ W_N=0.1 " μm", quad W_P=0.1 " μm" $

$ chi = sqrt((0.1 times 24)/(0.1 times 6))=2.0 $

$ V_S=(0.8+(0.4) times 2.0)/(1+2.0) approx 0.53 " V" $

较小的PMOS宽度使 $V_S$ 减小，因而使VTC向左移动。

== 区域IV：n-lin, p-sat

NMOS漏源压较小，在线性区导通，PMOS仍在饱和区：

$ I_("DN")("lin") = I_("DP")("sat") $

原扫描在此处给出了两边的完整电流表达式，而不仅是工作区的名称：

$ (W_N/L_N) (mu_n C_("ox")) /
(1 + V_("out") / (E_("cN") L_N))
[(V_("in") - V_("TN")) V_("out") - V_("out")^2 / 2]
=
(W_P v_("sat") C_("ox") (V_("DD") - V_("in") - abs(V_("TP")))^2) /
((V_("DD") - V_("in") - abs(V_("TP"))) + E_("cP") L_P) $

将 $V_("in")$ 的给定值代入上式，就能求出区域 IV 对应的 $V_("out")$；当 $V_("in")$ 接近 $V_("DD")-abs(V_("TP"))$ 时，PMOS 电流趋近于零。

== 区域V：n-lin, p-off

当输入超过 $V_("DD")-abs(V_("TP"))$ 时，PMOS截止，输出为0 V。随着输入继续增大，输出仍维持此状态。

_例4.6的400/100nm、1.0/2.0及0.60/0.53 V按源扫描逐项校对。_
