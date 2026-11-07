// SOURCE PDF PAGE 148 / printed 129
#set document(title:"第4章 · CMOS切换点式4.14—4.15 · PDF148")
= 第4章 · 印刷第129页

== CMOS反相器的五工作区（续）

区域II中，NMOS器件处于饱和区，PMOS处于线性区，电流相等。采用本书的速度饱和模型，有：

$ (W_N v_("sat") C_("ox") (V_("in")-V_("TN"))^2) /
 ((V_("in")-V_("TN"))+E_("cN") L_N) = $
$ (W_P/L_P) (mu_p C_("ox"))/(1+(V_("DD")-V_("out"))/(E_("cP") L_P)) $
$ times [(V_("DD")-V_("in")-abs(V_("TP")))(V_("DD")-V_("out")) -(V_("DD")-V_("out"))^2/2] $

将 $V_("in")$ 代入，可以确定区域II的VTC并解出 $V_("out")$。

区域III：*n-sat, p-sat*。两器件均饱和，VTC在这一段近似为垂直线段。根据

$ I_("DN")("sat") = I_("DP")("sat") $

可得：

$ (W_N v_("sat") C_("ox") (V_("in")-V_("TN"))^2)/((V_("in")-V_("TN"))+E_("cN") L_N) = $
$ (W_P v_("sat") C_("ox") (V_("DD")-V_("in")-abs(V_("TP")))^2) /
 ((V_("DD")-V_("in")-abs(V_("TP")))+E_("cP") L_P) $

在切换电平 $V_("in")=V_("out")=V_S$，若 $V_S$ 接近 $V_("DD")/2$，分母中电压项比 $E_c L$ 项小，原书进一步采用近似：

$ (W_N (V_S-V_("TN"))^2)/(E_("cN") L_N)
 = (W_P (V_("DD")-V_S-abs(V_("TP")))^2)/(E_("cP") L_P) $

两边开平方并解出切换电平：

$ V_S = (V_("DD")-abs(V_("TP"))+chi V_("TN"))/(1+chi) quad "(4.14)" $

其中，等长器件的尺寸与迁移率系数：

$ chi = sqrt((W_N/(E_("cN") L_N))/(W_P/(E_("cP") L_P)))
 = sqrt((mu_n W_N)/(mu_p W_P)) quad "(4.15)" $

增大 $chi$ 会使VTC向左移动，减小则向右移动；增大NMOS宽度有左移趋势，增大PMOS宽度有右移趋势。
