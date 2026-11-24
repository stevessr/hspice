// SOURCE PDF PAGE 380. Scan-guided native Typst selection, not a 1:1 accepted page.
// Printed textbook page 361; topology/plot curves remain editorial abstractions.
#import "../figures/ch10-inductance-antenna-native.typ": fig1020,fig1021,fig1022,fig1023,fig1024,fig1025,fig1026,fig1027,fig1028
#set document(title:"第10章·串扰、RLC和天线效应·源PDF380")
#set text(size:7.1pt)
#show par: set par(leading:2.25pt,spacing:3.3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[361　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#fig1026()
#align(center)[*图10.26　保护二极管消除天线充电风险的示意（可编辑图元）*]

通过保护二极管为金属积累电荷提供泄放通路，是教材给出的典型天线效应解决办法。不过，二极管必须与受保护栅极处于工艺允许的保护连接位置。保护结构还会增加结电容及布局面积。

#fig1027()
#align(center)[*图10.27　天线保护二极管的正确放置思路（可编辑示意）*]

如果二极管离栅极太远，且在某一步制造过程中二者尚未连通，保护就可能无法生效。这就是为什么天线违例不能简单地在版图任意位置接入保护器件。

原书同时介绍以缓冲器分段的策略：长导线被多个缓冲器分开后，每一个栅极所连接的金属面积有机会降低，从而使天线比小于设计规则规定的上限。

#fig1028()
#align(center)[*图10.28　跨层桥接 / 分段缩短连续天线面积（概念补充图）*]

*编辑说明：* 图10.28的完整原版位于后续源页，本页为便于衔接加入可编辑结构示意，不将该图声称为 PDF380 的原图1:1转写。
