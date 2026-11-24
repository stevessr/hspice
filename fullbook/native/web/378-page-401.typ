// SOURCE PDF PAGE 401 printed 382, visually checked; native edit selection only, NOT 1:1.
#import "../figures/ch11-clock-timing-native.typ": fig1116,fig1117,fig1118,fig1119,fig1120,fig1121,fig1122,fig1123,fig1124,fig1125,fig1126,fig1127,fig1128
#set document(title:"第11章·时钟、偏斜、抖动、功耗·PDF401")
#set text(size:7.15pt)
#show par: set par(leading:2.2pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[382　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#fig1121()
#align(center)[*图11.21　时钟偏斜对功能的影响（保持时间条件的可编辑示意）*]

保持时间违例不能仅通过降低时钟频率解决；需要延缓过快的数据路径，或减少造成违例的偏斜。设计时应权衡最短和最长路径约束。

== 11.3.3　噪声对时钟和触发器的影响

原书结合第10章的串扰讨论两种主要危险：时钟节点附近的噪声可能形成非预期触发沿；数据节点在时钟采样窗口附近的毛刺可能被触发器错误捕获。

#fig1122()
#align(center)[*图11.22　耦合噪声对触发器性能的影响（可编辑噪声示意）*]

当时钟沿与输入数据的变化过于接近，还可能造成亚稳态或不满足建立/保持约束的问题。时钟线应保持低噪声、合适的驱动与缓冲布局，并在可能的情况下与有强开关活动的邻线保持足够距离。
