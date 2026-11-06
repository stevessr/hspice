// Source PDF page 081 / printed 62. Example 2.13, Section 2.9 summary begins.
#set document(title:"第2章 · 例2.13覆盖电容与小结 · PDF081")
#set text(lang:"zh")
= 第2章 · 印刷第62页

== 横向重叠与边缘电容

根据图2.21的横向重叠长度 $L_D$，每单位器件宽度的重叠电容：

$ C_("ov") = C_("ox") L_D $

== 例2.13　覆盖电容的计算

原题使用0.13 μm工艺，$T_("poly")/t_("ox")=100$，横向扩散量为10 nm。求每单位沟道宽度的覆盖电容。

由式（2.47）：

$ C_f = (2 (4)(8.85 times 10^(-14)))/pi ln(1+100)
  approx 0.1 " fF/μm" $

$ L_D=10 " nm" quad => quad C_("ov")=C_("ox")L_D approx 0.15 " fF/μm" $

因此：

$ C_("ol") = 0.1 + 0.15 = 0.25 " fF/μm" $

器件总覆盖电容应再乘实际沟道宽度 $W$。

== 2.9　小结

原书总结 NMOS 和 PMOS 电压极性约定：

#table(columns:(2.2fr,2.2fr),
 table.header([*NMOS 电压*],[*PMOS 电压*]),
 [$V_("TN") >= 0$],[$V_("TP") <= 0$ 或 $abs(V_("TP")) >= 0$],
 [$V_("GS") >= 0$],[$V_("GS") <= 0$ 或 $V_("SG") >= 0$],
 [$V_("DS") >= 0$],[$V_("DS") <= 0$ 或 $V_("SD") >= 0$],
 [$V_("BS") <= 0$ 或 $V_("SB") >= 0$],[$V_("BS") >= 0$],
)

教材同时汇总阈值电压、体效应系数及长沟道漏电流公式：

$ V_T = V_("T0") + gamma (sqrt(2 abs(phi_F)+V_("SB")) - sqrt(2 abs(phi_F))) $

$ V_("T0") = phi_("GC") - 2 phi_F - (Q_("B0")+Q_("ox")-Q_I)/C_("ox") $

$ gamma = sqrt(2 q epsilon_("si") N_A)/C_("ox") $

$ I_("DS,sat") = k/2 (V_("GS")-V_T)^2 (1+lambda V_("DS")) $

$ I_("DS,linear") = k/2 [2(V_("GS")-V_T)V_("DS")-V_("DS")^2] $

_例2.13数值和原页极性表已核对；小结所引公式仍需统一验证全书正负号约定。_
