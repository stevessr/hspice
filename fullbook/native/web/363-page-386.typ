// SOURCE PDF PAGE 386. Native Typst source-scan editorial selection, not 1:1 complete.
// Printed page 367; line-by-line transcription and source geometry remain unverified.
#import "../figures/ch10-summary-ch11-power-native.typ": fig1028,figp104,figp105,figp106,figp108,fig111,fig112
#set document(title:"第10章章末与第11章电源分布·源PDF386")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[367　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

= 第11章　电源网格和时钟设计

*本章提要*：11.1 绪论；11.2 电源分布设计；11.3 时钟和时序问题；*11.4 锁相环/锁定延迟环*；11.5 参考文献；11.6 习题。

== 11.1　绪论

本章讨论芯片级由连线主导的两类设计问题：电源分布和时钟分布。电源网格将供电电压 $V_"DD"$ 和地 $Gnd$ 送达逻辑门、存储器及所有功能块；时钟系统向寄存器提供规定的时间参考。

电源电压会随着芯片中电流和负载的时间变化而波动，这些变化可能影响芯片上任一点的门延迟。另一方面，时钟源与分布网格会引入时钟偏斜和时序抖动，改变电路原本的设计目标。

电源分布与时钟设计需要整体系统优化；不能仅看单个逻辑门。原书还介绍锁相环（PLL）和锁定延迟环等与时钟发生和同步相关的电路。

== 11.2　电源分布设计

正确的电源分布涉及芯片内部供电栅格，也涉及芯片外的封装、焊盘与板级互连。问题包括金属连线的电阻、电感、工作频率变化、供电电流的峰值以及空间上同时切换的门。

电源网格设计需要协调系统架构、逻辑、电路、版图和封装。以下先介绍在电流需求较大时的 IR 压降与同时切换引发的 $L dif i/dif t$ 噪声。
