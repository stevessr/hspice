// SOURCE PDF PAGE 231 / printed 212. Source-derived equation (6.19)-(6.20), ex6.8.
#import "../figures/ch6-path-sizing-native.typ": fig621
#set document(title:"第6章 · 反相器本征延迟及最优尺寸公式 · PDF231")
#align(center)[#text(size:8pt,weight:"bold")[212　数字集成电路分析与设计——深亚微米工艺（第三版）]]
 #line(length:100%,stroke:.5pt)
#v(12pt)

为了把固有时间常量 $tau_("inv")$ 结合到式中，我们通过乘除 $C_("in")$ 将该式做如下变换：

#align(center)[$t_("delay") = R_("eff") C_("in") ((C_("out"))/(C_("in"))+(C_("self"))/(C_("in"))) = tau_("inv") ((C_("out"))/(C_("in")) + gamma_("inv")) quad "(6.19)"$]

这里，$gamma_("inv")$ 是反相器自身电容和输入电容的比值：

#align(center)[$gamma_("inv") = (C_("self"))/(C_("in")) quad "(6.20)"$]

因为 $C_("self")$ 依赖于版图，所以这个值高度依赖于门的版图。$C_("out")/C_("in")$ 的比值叫做扇出比 $f$ 或电学强度。

#line(length:100%,stroke:.5pt)
#v(22pt)
*例6.8　针对0.13 μm的工艺计算 $tau_("inv")$ 和 $gamma_("inv")$*

*问题：* 计算在0.13 μm工艺下一个反相器的 $tau_("inv")$ 和 $gamma_("inv")$。

*解答：*

#align(center)[$tau_("inv")=3R_("eqn")C_g L_n=3(12.5 " kΩ")(2 " fF/μm")(0.1 " μm")=7.5 " ps"$]

#align(center)[$gamma_("inv") = (C_("self"))/(C_("in")) = (C_("eff")(3W_n))/(C_g(3W_n)) = (1 " fF/μm")/(2 " fF/μm") = 0.5$]

#line(length:100%,stroke:.5pt)
#v(12pt)
*练习6.3　针对0.18 μm工艺计算 $tau_("inv")$ 和 $gamma_("inv")$。*

回到确定反相器尺寸的问题上，我们想要最优化图6.21中反相器链的延迟。通过各级的延迟可以计算如下：

#align(center)[$"总延迟" = sum_j tau_("inv") ((C_(j+1))/(C_j) + gamma_("inv"))$]

#v(17pt)
#fig621()
#align(center)[*图6.21　反相器链尺寸的最优化*]

把宽度代入上式来计算电容，得到：

#align(center)[$"总延迟" = sum_j tau_("inv") ((C_g W_(j+1))/(C_g W_j) + gamma_("inv")) = sum_j tau_("inv") ((W_(j+1))/(W_j) + gamma_("inv"))$]

通过观察依赖于反相器 $j$ 尺寸的相邻两个延迟项，可以对最佳的解决办法会产生什么结果有一定程度的认识：

#align(center)[$D_j = tau_("inv") ((W_j)/(W_(j-1))+gamma_("inv")) + tau_("inv") ((W_(j+1))/(W_j)+gamma_("inv"))$]

为了获得这两级的最佳延迟，取 $D_j$ 对 $W_j$ 的偏导数：