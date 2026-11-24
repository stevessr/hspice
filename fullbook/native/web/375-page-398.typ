// SOURCE PDF PAGE 398 printed 379, visually checked; native edit selection only, NOT 1:1.
#import "../figures/ch11-clock-timing-native.typ": fig1116,fig1117,fig1118,fig1119,fig1120,fig1121,fig1122,fig1123,fig1124,fig1125,fig1126,fig1127,fig1128
#set document(title:"第11章·时钟、偏斜、抖动、功耗·PDF398")
#set text(size:7.15pt)
#show par: set par(leading:2.2pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[379　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 11.3.1　时钟定义和量度（续）

时钟周期记为 $T_"cycle"$。原书图11.16把时钟等待时间、偏斜、上升时间和下降时间一起标注，以便在时序分析中保持各量度的一致定义。

#fig1116()
#align(center)[*图11.16　时钟等待时间和时钟偏斜定义（可编辑波形示意）*]

*时钟抖动（jitter）*是时钟沿在不同周期相对理想时刻的偏移。它与偏斜不同：偏斜是不同空间位置之间的时刻差异；抖动是某一位置的时钟沿随周期变化的时间随机性。

#fig1117()
#align(center)[*图11.17　时钟抖动的定义（无抖动、绝对抖动与相对抖动的概念波形）*]

原书讨论用理想周期 $T_"cycle"$ 建立参考，比较每次真实时钟到达时刻与其整数倍的差值，得到绝对抖动；比较相邻周期的实际间隔与目标周期的偏差，得到周期抖动。

时钟的上升、下降沿都需要可靠的斜率和噪声控制。速度越高，较小的时间误差也可能构成显著的周期比例。
