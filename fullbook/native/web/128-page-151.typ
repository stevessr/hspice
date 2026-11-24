// SOURCE PDF PAGE 151 / printed page 132
// Source-checked transcription of eqs. (4.17)–(4.19) from the 445-page scan (2026-11-08).
// Editable Typst algebra: intermediate current-balance and derivative steps restored.
// Printed line-wraps, graphic geometry and complete-page 1:1 acceptance still open.
#set document(title:"第4章 CMOS反相器 · VIL、VIH完整推导 · PDF151")
= 第4章 · 印刷第132页

承接上一页式（4.16），在 $dif V_("out")/dif V_("in")=-1$ 处代入 $k_N$ 和 $k_P$，得到：

$ V_("IL") =
 (2 V_("out") - V_("DD") - abs(V_("TP")) + (k_N/k_P) V_("TN")) /
 (1 + k_N/k_P) quad "(4.17)" $

这个等式依赖于 $V_("out")$ 这个未知数。下一步是联立求解式（4.16）和式（4.17），得到 $V_("IL")$ 和相应的 $V_("out")=V_("OUL")$。

可以使用一个类似的过程来获得求解 $V_("IH")$ 的等式。在 $V_("in")=V_("IH")$ 这一点，反相器很可能工作在区域 IV，因此 NMOS 器件是线性的而 PMOS 器件是饱和的：

$ I_("DN")("lin") = I_("DP")("sat") $

应用这两个电流等式，得到原书的完整速度饱和模型：

$ (W_N/L_N) (mu_n C_("ox"))/(1+V_("out")/(E_("cN") L_N))
 [ (V_("in")-V_("TN")) V_("out") - V_("out")^2/2 ] $

$ = (W_P v_("sat") C_("ox") (V_("DD")-V_("in")-abs(V_("TP")))^2) /
 ((V_("DD")-V_("in")-abs(V_("TP")))+E_("cP") L_P) $

这个等式可以大大简化。n 沟道器件分母中的 $V_("out")/(E_("cN") L_N)$ 很小；p 沟道器件分母中的 $V_("DD")-V_("in")-abs(V_("TP"))$ 一项比 $E_("cP") L_P$ 小得多。在区域 IV 的 $V_("IH")$ 附近，这两项都可以忽略，得到：

$ (W_N/L_N) mu_n C_("ox")
 [ (V_("in")-V_("TN")) V_("out") - V_("out")^2/2 ] $

$ = (W_P v_("sat") C_("ox") (V_("DD")-V_("in")-abs(V_("TP")))^2) /
 (E_("cP") L_P) $

注意 $v_("sat")=mu_p E_("cP")/2$，将其代入得到：

$ (W_N/L_N) mu_n C_("ox")
 [ (V_("in")-V_("TN")) V_("out") - V_("out")^2/2 ] $

$ = (W_P/L_P) (mu_p C_("ox")/2)
 (V_("DD")-V_("in")-abs(V_("TP")))^2 quad "(4.18)" $

再次回到一次 MOS 模型方程。为了解得 $V_("IH")$，对上式两边对 $V_("in")$ 微分：

$ (W_N/L_N) mu_n C_("ox") [
 (V_("in")-V_("TN")) (dif V_("out"))/(dif V_("in"))
 + V_("out") - V_("out") (dif V_("out"))/(dif V_("in")) ] $

$ = - (W_P/L_P) mu_p C_("ox")
 (V_("DD")-V_("in")-abs(V_("TP"))) $

代入 $k_N$ 和 $k_P$，并设 $dif V_("out")/dif V_("in")=-1$ 且 $V_("in")=V_("IH")$，得到：

$ V_("IH") =
 (2 V_("out")+V_("TN")+(k_P/k_N)(V_("DD")-abs(V_("TP")))) /
 (1+k_P/k_N) quad "(4.19)" $

联立上面的漏电流等式，求得 $V_("IH")$ 的数值解和相应的 $V_("out")=V_("OUH")$。

== 例4.7　0.18 μm 工艺中 CMOS 反相器的 SPICE 分析和手工计算

对图 4.12(a) 所示的 CMOS 反相器，比较 SPICE 分析和手工分析得到的电压传输特性参数。已知 $W_N=400 " nm"$、$W_P=800 " nm"$，工艺迁移率为 $mu_n=270 " cm²/(V·s)"$、$mu_p=70 " cm²/(V·s)"$。其余参数及仿真见下一扫描页。
