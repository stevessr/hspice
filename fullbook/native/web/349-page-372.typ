// SOURCE PDF PAGE 372. Scan-guided editable Typst selection; NOT full 1:1 acceptance.
// Original source scan: printed page 353; images/figures are editable abstractions.
#import "../figures/ch10-coupling-native.typ": fig1011,fig1012,fig1013,fig1014,fig1015,fig1016,fig1017,fig1018,fig1019
#set document(title:"第10章·连线设计·源扫描PDF372")
#set text(size:7.2pt)
#show par: set par(leading:2.3pt,spacing:3.4pt)
#align(center)[#text(size:7.5pt,weight:"bold")[353　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

线网2的有效负载电容 $C_L$ 随侵略者和受害者的开关关系而改变。教材给出三种基本情况：

- *侵略者不变化：* 耦合电容等效为对地电容。
#align(center)[$C_L = C_"gnd" + C_c quad (10.14)$]

- *两者同向一起转变：* 两端几乎没有电压差变化，耦合负载近似消失。
#align(center)[$C_L = C_"gnd" quad (10.15)$]

- *两者相反方向转变：* 发生米勒效应，耦合电容产生近似两倍的等效负载。
#align(center)[$C_L = C_"gnd" + 2 C_c quad (10.16)$]

因此当线网与 $n$ 个邻线耦合时，可能出现 $3^n$ 种相对开关组合，静态时序分析需要覆盖不同的邻线活动模式，而不能仅靠一个固定的线电容数字。

#fig1019()
#align(center)[*图10.19　降低耦合的间距与屏蔽方案（可编辑示意）*]

改善耦合的两种版图做法：一是增加邻近信号线的间距以降低侧向电容，但会增加面积；二是在信号间插入电源/地等相对稳定的屏蔽线，虽然可能增加对地电容，但时延更可预测。

原书还讨论了低介电常数介质（low-k）对耦合电容的降低作用：SiO₂相对介电常数约4，使用更低的介电常数可以减少电容。

为提供静态时序的有效负载估算，教材使用“$k$因子”按邻线活动情况调整耦合电容。这里的活动因子不同于描述绝缘材料介电常数的low-k。

#text(size:7pt)[注：本页重建了式（10.14）—（10.16）、图10.19的布局概念；原图几何与全部段落尚未通过1:1验收。]
