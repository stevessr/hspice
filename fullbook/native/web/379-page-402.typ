// SOURCE PDF PAGE 402 printed 383, visually checked; native edit selection only, NOT 1:1.
#import "../figures/ch11-clock-timing-native.typ": fig1116,fig1117,fig1118,fig1119,fig1120,fig1121,fig1122,fig1123,fig1124,fig1125,fig1126,fig1127,fig1128
#set document(title:"第11章·时钟、偏斜、抖动、功耗·PDF402")
#set text(size:7.15pt)
#show par: set par(leading:2.2pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[383　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

为了减小图11.22的耦合噪声，原书讨论电源/地屏蔽和加大时钟线与噪声线间距的方法。屏蔽线提供相对稳定的参考电位，可降低时钟沿附近的串扰风险，但附加电容会增加时钟线的负载与功耗。

#fig1123()
#align(center)[*图11.23　耦合问题的版图解决方法（编辑示意）*]

== 11.3.4　时钟的功耗

大型时钟网络几乎每个周期都进行切换，因此动态功耗可能显著。原书指出，在某些高性能设计中时钟相关功耗可占芯片总功耗的30%—40%。

#align(center)[$P = C V_"DD"^2 f_"clk"$]

对0.18 μm示例，若 $V_"DD"=1.8 "V"$、工作频率500 MHz、时钟总电容1 nF：

#align(center)[$P = (1 "nF") (1.8 "V")^2 (500 "MHz") approx 1.6 "W"$]

可通过*门控时钟（clock gating）*降低不活跃模块的时钟翻转，但需确保门控控制信号不会产生毛刺或破坏时序。
