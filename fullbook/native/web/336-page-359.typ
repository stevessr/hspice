// SOURCE PDF PAGE 359 / printed 340 / Fig 10.6, Eq 10.6, Example 10.1.
// Scan-guided native formulas and original branched RC topology.
// Exact typography, arrow placement and baseline geometry unverified.
#import "../figures/ch10-rc-elmore-native.typ": figure10more,fig-example101
#set document(title:"第10章 · RC阶梯与艾蒙延迟例10.1 · PDF359")
#set text(size:7.25pt)
#set par(justify:true,leading:2.5pt,spacing:4pt)
#align(center)[#text(size:8pt,weight:"bold")[340　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

为了进一步解释这个过程，考虑图 10.6 所示的电路，其艾蒙延迟是：

$ tau = R_1 C_1 + (R_1 + R_2) C_2 + (R_1 + R_2 + R_3) C_3 $

可以考察这个延迟值的两个极端例子来检验艾蒙延迟是否一致。一种特殊情况是，当 $C_1=C_2=0$ 时，艾蒙延迟和 $"RC"$ 时间常数均等于 $(R_1+R_2+R_3)C_3$；类似地，当 $R_2=R_3=0$ 时，二者均等于 $R_1(C_1+C_2+C_3)$。这些极端例子说明，艾蒙延迟是延迟的合理估算。对 $"RC"$ 阶梯和树形电路而言，它是最普遍的计算形式。

#figure10more(6)
#align(center)[#text(size:6.8pt)[图 10.6　艾蒙延迟计算使用的 RC 阶梯]]

对于一个通常的网络，可以按下式计算艾蒙延迟：

$ tau_i = sum_k (C_k times R_(i k)) quad "(10.6)" $

这里，我们感兴趣的节点是 $i$，$C_k$ 是节点 $k$ 的电容，$R_(i k)$ 是从起始节点到节点 $i$ 与从起始节点到节点 $k$ 的路径中所有共同电阻之和。换言之，沿源节点到目标节点 $i$ 和源节点到电容节点 $k$ 的两条路径，取共同的路径段累加其电阻值。下面的例子能更好地说明这一过程。

== 例 10.1　简单 RC 树的艾蒙延迟

*问题：* 计算下列 RC 树从输入点到节点 1、节点 2 和节点 3 的艾蒙延迟。艾蒙延迟对内部节点（如节点 1）不够精确；不过，通常关心的是 RC 树中从输入点到各内部节点的延迟时间常数。

#fig-example101()
#align(center)[#text(size:6.8pt)[例 10.1　分支 RC 树与节点编号（原生可编辑）]]

*解答：*

$ tau_1 = R_1 C_1 + R_1 C_2 + R_1 C_3 $

$ tau_2 = C_1 R_1 + C_3 R_1 + C_2 (R_1 + R_2) $

$ tau_3 = C_1 R_1 + C_2 R_1 + C_3 (R_1 + R_3) $
