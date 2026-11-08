// SOURCE PDF PAGE 379. Scan-guided native Typst selection, not a 1:1 accepted page.
// Printed textbook page 360; topology/plot curves remain editorial abstractions.
#import "../figures/ch10-inductance-antenna-native.typ": fig1020,fig1021,fig1022,fig1023,fig1024,fig1025,fig1026,fig1027,fig1028
#set document(title:"第10章·串扰、RLC和天线效应·源PDF379")
#set text(size:7.1pt)
#show par: set par(leading:2.25pt,spacing:3.3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[360　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 10.6　天线效应（续）

在某些制造步骤中，已经加工出的金属面积远大于与其相连的栅极面积，电荷积累可能使薄栅氧化层承受较大电场。教材使用*天线比*衡量其风险：

#align(center)[$"天线比" = ("连接至栅的金属面积")/("栅面积") quad (10.29)$]

原书举例：制造工艺可能对某阶段金属与栅的面积比规定上限，例如天线比100。*100只是教材的示例*，实际设计规则依具体工艺和金属层不同。

#fig1025()
#align(center)[*图10.25　工艺制造期间的天线效应（原生概念重绘）*]

版图规则检查（DRC）可以根据金属层分布、栅面积与通路，找出潜在的天线违规。原书讨论了几类常见的工程处理方式：

- 在被保护的 MOS 栅附近连接天线保护二极管，将工艺积累的电荷引导到相对安全的通路。
- 在长连线上插入适当的缓冲器，缩短单个敏感栅直接面对的连续金属面积。
- 使用跨层跳线或调整走线顺序，让较大面积的布线在更晚的制造步骤才连接到栅极。

这些处理方法与工艺制造顺序有关，须满足具体工艺的天线规则及二极管使用条件。
