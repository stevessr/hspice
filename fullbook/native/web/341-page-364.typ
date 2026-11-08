// SOURCE PDF PAGE 364 / printed 345. Source-scan guided buffer insertion sizing.
// Original single-segment and π topology represented in native editable diagram.
// Actual baseline/layout and exact figure geometry remain unverified.
#import "../figures/ch10-rc-elmore-native.typ": figure10more
#set document(title:"第10章 · 图10.10 缓冲器插入与M倍放大RC模型 · PDF364")
#set text(size:7.2pt)
#set par(justify:true,leading:2.5pt,spacing:3.8pt)
#align(center)[#text(size:8pt,weight:"bold")[第 10 章　连线设计　　　　　　　　　345]]
#line(length:100%,stroke:.55pt)

效果。找出使整体延迟最小化的最优化等尺寸缓冲器数目的问题称为缓冲器插入问题。

考虑一条没有任何缓冲器驱动的长度为 $L$ 的导线，其延迟是不可接受的。如果每单位长度电阻和电容是 $R_("int")$ 和 $C_("int")$，导线的总电阻和总电容为：

$ R_("wire") = rho/T times L/W = R_("sq") L/W = R_("int") L $

$ C_("wire") = C_("int") L $

为了减小延迟，我们尝试插入一定数量的缓冲器来产生最小的总延迟。设 $N$ 为这种缓冲器的数目（包括第一个缓冲器），$L/N$ 为缓冲器之间相应的导线长度，如图 10.10(a) 所示。每一段由一个驱动导线阻抗和下游门负载的缓冲器组成，如图 10.10(b) 所示，π 模型可以用于每段连线。

#figure10more(10)
#align(center)[#text(size:6.7pt)[图 10.10　超长导线的缓冲器插入：(a) 多级缓冲器，(b) 单段，(c) 一段 RC 模型]]

假设最小缓冲器的尺寸是 1X，相应的输入/输出电容如下：

$ C_("out") = C_("eff") W (1+beta) = C_f(1+beta) quad "(单位为 fF)" $

$ C_("in") = C_g W (1+beta) = C_G(1+beta) quad "(单位为 fF)" $

其中，$beta$ 是 PMOS 与 NMOS 器件的尺寸之比；$C_f$ 的值是 $C_("eff") times W$，其中 $W$ 是 1X 反相器中的 NMOS 器件尺寸。类似地，$C_G$ 是 $C_g times W$。

设单个缓冲器尺寸放大到 $M$ 倍。此时，对于一个比 1X 缓冲器大 $M$ 倍的缓冲器有：

$ R_("eff") = R_("eqn") / M $

$ C_("out") = C_("eff") W(1+beta) M = C_f(1+beta)M $

$ C_("in") = C_g W(1+beta)M = C_G(1+beta)M $

在图 10.10(c) 中，图解说明了在计算延迟时用于每级的 RC 模型。使用艾蒙延迟，每段的延迟给出如下；教材在后续扫描页接着推导单级和总延迟并求最优缓冲器级数。

#text(size:6.4pt)[*图元校验状态：* 原生 Typst 中的节点、电容和电阻可编辑；逐位置 1:1 保真未确认。]
