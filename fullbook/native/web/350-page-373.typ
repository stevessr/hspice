// SOURCE PDF PAGE 373. Scan-guided native Typst selection, not a 1:1 accepted page.
// Printed textbook page 354; topology/plot curves remain editorial abstractions.
#import "../figures/ch10-inductance-antenna-native.typ": fig1020,fig1021,fig1022,fig1023,fig1024,fig1025,fig1026,fig1027,fig1028
#set document(title:"第10章·串扰、RLC和天线效应·源PDF373")
#set text(size:7.1pt)
#show par: set par(leading:2.25pt,spacing:3.3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[354　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 10.4.3 前的耦合活动系数

上一页式（10.14）—（10.16）分别给出了侵略者静止、同向开关、反向开关时的三个有效负载。为了把相邻线网活动引入 RC 时延计算，定义耦合因子 $k$：

#align(center)[$C_"eff" = C_"gnd" + k C_c$]

#table(columns:3,stroke:.4pt,inset:3pt,
 [*邻线活动*],[*k*],[*线网2的等效负载*],
 [同方向转变],[0],[$C_"gnd"$],
 [侵略者不变],[1],[$C_"gnd" + C_c$],
 [反方向转变],[2],[$C_"gnd" + 2 C_c$],
)

#fig1020()
#align(center)[*图10.20　使用活动系数的耦合电容等效模型（可编辑示意）*]

原书进一步说明，实际线网中开关时刻、斜率、幅值不完全一致，因此有效耦合系数可能偏离上述理想的三个整数；静态时序分析往往采用最坏情形或活动模式范围。

#fig1021()
#align(center)[*图10.21　不同邻线活动情况下的暂态延迟趋势（定性重绘，非原测量点）*]

耦合影响与受害者、侵略者的相对到达时间有关；这一现象也是需要进行版图寄生参数提取和串扰时序分析的重要原因。
