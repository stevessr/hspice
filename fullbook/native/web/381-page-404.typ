// SOURCE PDF PAGE 404 printed 385, visually checked; native edit selection only, NOT 1:1.
#import "../figures/ch11-clock-timing-native.typ": fig1116,fig1117,fig1118,fig1119,fig1120,fig1121,fig1122,fig1123,fig1124,fig1125,fig1126,fig1127,fig1128
#set document(title:"第11章·时钟、偏斜、抖动、功耗·PDF404")
#set text(size:7.15pt)
#show par: set par(leading:2.2pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[385　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#fig1126()
#align(center)[*图11.26　有传输门延迟的时钟发生器（可编辑逻辑拓扑示意）*]

另一种时钟发生方法是用交叉耦合的SR锁存器控制两个互补相位。原书图11.27指出，相关结构在开关特性与信号负载上也存在尺寸与对称性的要求。

#fig1127()
#align(center)[*图11.27　基于锁存器的时钟发生器（可编辑示意）*]

== 11.3.6　高性能设计中的时钟分布

一旦产生时钟，就需要把它分发到芯片各个区域。理想的分布网络应让不同位置的逻辑获得尽量相近的等待时间，同时降低偏斜、噪声和功耗。

原书给出对称的H树和X树：H树提供逐级分裂的对称路径，可较容易实现多个终端等长；X树提供跨区域斜线连接，可以根据芯片几何做集中分配。

#fig1128()
#align(center)[*图11.28　对称时钟树：H树与X树（编辑性概念图）*]

不同拓扑受芯片布局、布线资源、总线电阻与电容的影响，不能仅凭几何路径等长就保证时钟完全无偏斜。
