// SOURCE PDF PAGE 211 · 印刷第192页。
// 第三轮按用户提供的原扫描逐段重录；未完成逐墨迹1:1验收。
#set document(title: "第6章 · CMOS反相器传播延迟及等效电阻 · 扫描211页")
#set text(lang: "zh")
#align(center)[#text(size:8.2pt, weight:"bold")[192　　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length: 100%, stroke: 0.55pt)
#v(7pt)

#v(8pt)
#align(center)[$t_("pLH") = (C_L (V_("DD")/2))/I_("LH") quad "(6.1)"$]
#v(8pt)

在平均电流为 $I_("HL")$ 的情况下，高电平到低电平的传播延迟可以按照上面介绍过的方法计算：

#v(8pt)
#align(center)[$t_("pHL") = (C_L (V_("DD")/2))/I_("HL") quad "(6.2)"$]
#v(8pt)

平均传播延迟定义为：

#v(8pt)
#align(center)[$t_p = (t_("pLH") + t_("pHL"))/2 quad "(6.3)"$]
#v(8pt)

现在计算由一个从 $V_("OL")$ 到 $V_("OH")$ 的阶跃输入开始的 CMOS 反相器传播延迟的表达式，参考图6.3。我们首先用式（6.2）计算 $t_("pHL")$，唯一的未知量是 $I_("HL")$。

为了计算这个值，首先要定义 NMOS 器件操作的区域，这涉及到 $V_("Dsat")$ 的计算。由于 $V_("Dsat")$ 是取决于工艺的，所以我们将用 0.13 μm 的工艺参数来说明这些步骤。使用 $V_("DD")=1.2 " V"$，$V_T=0.4 " V"$ 和 $E_C L=0.6 " V"$：

#v(8pt)
#align(center)[$V_("Dsat") = ((V_("GS") - V_T) E_C L)/((V_("GS")-V_T) + E_C L) = ((1.2-0.4)(0.6))/((1.2-0.4)+(0.6)) approx 0.34 " V"$]
#v(8pt)

输出从 1.2 V 到 0.6 V 的转变，这意味着在所有时间都有 $V_("DS") > V_("Dsat")$，所以在考察 $t_("pHL")$ 的全过程中 NMOS 器件一直处于饱和状态。因此，对于 n 沟道器件来说平均电流就是饱和电流 $(I_("Dsat"))_n$。

#v(8pt)
#align(center)[$t_("pHL") = (C_L (V_("DD")/2))/((I_("Dsat"))_n) quad "(6.4a)"$]
#v(8pt)

在第5章中，我们得到 $t_("pHL")=0.7 R_N C_L$。如果将其与式（6.4a）相比较，可以看到：

#v(8pt)
#align(center)[$R_N = (V_("DD")/2)/(0.7 (I_("Dsat"))_n) quad "(6.4b)"$]
#v(8pt)

下面，用式（6.1）计算 $t_("pLH")$。由于使用 PMOS 器件，所以 $I_("LH")$ 是惟一的未知量。对于 p 沟道上拉器件，通过下式可以得到饱和电压：

#v(8pt)
#align(center)[$V_("Dsat") = ((1.2-0.4) 2.4)/((1.2-0.4)+2.4) = 0.6 " V"$]
#v(8pt)

PMOS 器件在这个转换过程中也处于饱和状态。基于这种情况，可以用以下公式：

#v(8pt)
#align(center)[$t_("pLH") = (C_L (V_("DD")/2))/((I_("Dsat"))_p) quad "(6.5a)"$]
#v(8pt)

如果把这个等式同第5章中使用的公式相比较，可以看到：

#v(8pt)
#align(center)[$R_P = (V_("DD")/2)/(0.7 (I_("Dsat"))_p) quad "(6.5b)"$]
#v(8pt)

通过考虑单位尺寸的器件，可以由式（6.4b）和式（6.5b）计算出 $R_("eqn")$ 和 $R_("eqp")$。