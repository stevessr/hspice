// SOURCE PDF PAGE 360. Source scan-assisted Typst native editorial draft.
// All circuit diagrams, text positions and equations still require strict 1:1 acceptance.
#import "../figures/ch10-rc-elmore-native.typ": figure10more,fig-example102,fig-example101
#set document(title:"第10章·连线RC与艾蒙延迟·PDF360")
#align(center)[#text(size:8pt,weight:"bold")[341　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

=== 10.2.3　长导线的RC延迟

对长为 $L$ 的均匀金属互连，设单位长度电阻为 $r$、电容为 $c$。总串联电阻和电容分别为：

#align(center)[$R_("wire")=r L quad C_("wire")=c L$]

若按 $n$ 段离散，每一段的电阻为 $r Delta L$、电容为 $c Delta L$。从艾蒙延迟的定义出发：

#align(center)[$tau_("Elmore") = sum_(k=1)^n k (r Delta L)(c Delta L)$]

段数趋向较大时，得到式（10.7）：

#align(center)[$tau_("Elmore") approx (r c L^2)/2 = (R_("wire") C_("wire"))/2 quad (10.7)$]

精确分布RC直线的50%延迟系数约为0.38，因此艾蒙延迟取0.5的估计偏保守。这个结果的重要意义是：当单位长度参数保持不变时，**长导线的RC延迟与长度的平方成正比**。

#figure10more(7)
#align(center)[*图10.7　驱动器与分布RC长导线*]

实际驱动器还具有等效导通电阻。根据不同信号传播方向，需要考虑上拉或下拉器件阻抗。图10.8用L、π、T三种形式的集总RC模型对同一条线进行近似，只有合适的模型才能给出合理的延迟估计。

#figure10more(8)
#align(center)[*图10.8　三种集总RC等效模型（原生可编辑结构）*]
