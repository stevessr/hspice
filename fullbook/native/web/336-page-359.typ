// SOURCE PDF PAGE 359. Source scan-assisted Typst native editorial draft.
// All circuit diagrams, text positions and equations still require strict 1:1 acceptance.
#import "../figures/ch10-rc-elmore-native.typ": figure10more,fig-example102,fig-example101
#set document(title:"第10章·连线RC与艾蒙延迟·PDF359")
#align(center)[#text(size:8pt,weight:"bold")[340　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

图10.6给出具有三个串联电阻和三个对地电容的RC阶梯网络。到最远输出节点的艾蒙延迟为：

#align(center)[$tau = R_1 C_1 + (R_1+R_2) C_2 + (R_1+R_2+R_3) C_3$]

每一个电容对应的加权电阻，是从输入到该电容所在节点必须经过的串联路径。

#figure10more(6)
#align(center)[*图10.6　计算艾蒙延迟的RC阶梯（可编辑网络）*]

原书给出两个一致性极限：当 $C_1=C_2=0$ 时，艾蒙延迟退化为 $tau = (R_1+R_2+R_3) C_3$；当 $R_2=R_3=0$ 时，则为 $tau=R_1(C_1+C_2+C_3)$。这解释了为何每项以源节点到电容节点的共同路径电阻为权重。

对于一般RC树，在目标节点 $i$ 的延迟可写为：

#align(center)[$tau_i = sum_k (C_k R_(i,k)) quad (10.6)$]

其中 $R_(i,k)$ 是从输入到节点 $i$ 和到节点 $k$ 两条路径共同包含的电阻之和。

*例10.1　简单RC树的艾蒙延迟*

问题：给定一个RC树，分别计算节点1、2、3的艾蒙延迟。

#fig-example101()
#align(center)[*例10.1　包含一个分支的RC树（结构重绘）*]

按原书的三节点命名，节点延迟可表示为：

#align(center)[$tau_1=R_1(C_1+C_2+C_3)$]
#align(center)[$tau_2=R_1(C_1+C_2+C_3)+R_2 C_2$]
#align(center)[$tau_3=R_1(C_1+C_2+C_3)+R_3 C_3$]

这个例子显示，只有到目标节点自身的支路电阻才需要加入额外分支项。
