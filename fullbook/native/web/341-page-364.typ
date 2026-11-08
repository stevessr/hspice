// SOURCE PDF PAGE 364. Source scan-assisted Typst native editorial draft.
// All circuit diagrams, text positions and equations still require strict 1:1 acceptance.
#import "../figures/ch10-rc-elmore-native.typ": figure10more,fig-example102,fig-example101
#set document(title:"第10章·连线RC与艾蒙延迟·PDF364")
#align(center)[#text(size:8pt,weight:"bold")[345　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 10.3　超长导线的缓冲器插入（续）

考虑没有缓冲器、长度为 $L$ 的均匀导线，单位长度电阻与电容分别为 $R_("int")$ 和 $C_("int")$：

#align(center)[$R_("wire") = R_("int") L = R_("sq") L/W$]
#align(center)[$C_("wire") = C_("int") L$]

教材本页以单位长度电阻 $R_("int")$ 和电容 $C_("int")$ 表示没有缓冲器的均匀连线：

$ R_("wire") = (rho/T)(L/W) = R_("sq") L/W = R_("int") L $
$ C_("wire") = C_("int") L $

为了减少延迟，可以插入 $N$ 级缓冲器，把导线均匀划分为长度约为 $L/N$ 的若干段。

#figure10more(10)
#align(center)[*图10.10　超长导线的缓冲器插入与单段等效RC模型*]

假设单位尺寸1X反相器的输出和输入电容与晶体管宽度成正比。令PMOS/NMOS的尺寸比为 $beta$，输出与输入电容分别定义为：

#align(center)[$C_("out")=C_f(1+beta)$]
#align(center)[$C_("in")=C_g(1+beta)$]

对于尺寸放大 $M$ 倍的缓冲器，导通电阻约变为 $R_("eqn")/M$，输入与输出电容放大为原来的 $M$ 倍：

#align(center)[$R_("eff")=R_("eqn")/M$]
#align(center)[$C_("out")=C_f(1+beta) M$]
#align(center)[$C_("in")=C_g(1+beta) M$]

图10.10(c)的π型模型将一段导线电容按两端各半分配，同时包括缓冲器输入电容和自电容。使用艾蒙延迟可推导每级延迟，并进一步优化缓冲器级数与尺寸。
