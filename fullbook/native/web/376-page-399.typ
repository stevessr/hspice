// SOURCE PDF PAGE 399 printed 380, visually checked; native edit selection only, NOT 1:1.
#import "../figures/ch11-clock-timing-native.typ": fig1116,fig1117,fig1118,fig1119,fig1120,fig1121,fig1122,fig1123,fig1124,fig1125,fig1126,fig1127,fig1128
#set document(title:"第11章·时钟、偏斜、抖动、功耗·PDF399")
#set text(size:7.15pt)
#show par: set par(leading:2.2pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[380　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

如果把长期时钟沿误差看成随机变量，可用概率分布描述抖动。原书图11.18展示了钟沿出现时刻的钟形概率分布。

#fig1118()
#align(center)[*图11.18　抖动测量的概率分布示意（非原图数据点）*]

原书说明抖动常用标准差/均方根（RMS, $sigma$）或峰峰值衡量。峰峰值依赖样本量与统计条件，不能在缺少测量窗口时直接从RMS固定换算。

== 11.3.2　时钟偏斜

时钟偏斜可能是芯片中不同触发器时钟线传输距离不同、负载不同、布线长度差异或缓冲器延迟差异导致的。

#fig1119()
#align(center)[*图11.19　时钟偏斜举例（原生时钟源/触发器连线示意）*]

当捕获寄存器接收到的时钟相对发射寄存器有额外延迟时，对建立时间与保持时间会产生不同影响。最坏情况必须同时检查最长和最短数据传播路径，而不能只对平均时钟延迟做估计。
