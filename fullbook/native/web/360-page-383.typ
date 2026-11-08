// SOURCE PDF PAGE 383. Native Typst source-scan editorial selection, not 1:1 complete.
// Printed page 364; line-by-line transcription and source geometry remain unverified.
#import "../figures/ch10-summary-ch11-power-native.typ": fig1028,figp104,figp105,figp106,figp108,fig111,fig112
#set document(title:"第10章章末与第11章电源分布·源PDF383")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[364　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 10.9　习题（P10.1—P10.6）

*P10.1*　对比0.18 μm工艺中20 mm长的第5层金属线与0.13 μm工艺中20 mm长的第8层金属线（没有等比例缩小的金属线）的电阻与延迟。以理想激励源为条件，假设单位长度电容 $C_"int"=0.1 "fF/μm"$。

*P10.2*　对比 0.18 μm 工艺下长 20 mm 的第 5 层金属导线与 0.13 μm 工艺下长 14 mm 的第 8 层金属导线（按工艺做等比例缩小）。依照前面的已知参数和理想源，取 $C_"int"=0.1 "fF/μm"$，计算两条线的延迟。

*P10.3*　在 0.18 μm 工艺，绘制两根相邻第 5 层金属导线的单位长度电容与间距关系。令间距由 $4 lambda$ 起，每次增加 $4 lambda$，直到 $40 lambda$；假设导线上、下金属层都被屏蔽，计算时使用最小线宽。

*P10.4*　用SPICE模拟三种具有相同总电阻和总电容的RC阶梯网络：1级、3级和20级。比较输入阶跃情况下的节点延迟，整理延迟表达式：

#align(center)[$tau = alpha R_"wire" C_"wire"$]

分别求三种模型的 $alpha$ 并评价准确性。

#figp104()
#align(center)[*图P10.4　三节点RC阶梯电路（可编辑概念示意）*]

*P10.5*　沿用P10.4，在三种等效模型 L、π、T 中代换每一条RC段，判断哪种模型更接近分布式延迟。

#figp105()
#align(center)[*图P10.5　L型、π型、T型 RC 模型（可编辑示意）*]

*P10.6*　用 SPICE 模拟图P10.6：$R_1=R_2=R_3$，$C_1=C_2=C_3$。比较所有节点的艾蒙延迟计算结果与SPICE结果，分析为何某些节点的近似较差。
