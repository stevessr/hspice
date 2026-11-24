// SOURCE PDF PAGE 400 printed 381, visually checked; native edit selection only, NOT 1:1.
#import "../figures/ch11-clock-timing-native.typ": fig1116,fig1117,fig1118,fig1119,fig1120,fig1121,fig1122,fig1123,fig1124,fig1125,fig1126,fig1127,fig1128
#set document(title:"第11章·时钟、偏斜、抖动、功耗·PDF400")
#set text(size:7.15pt)
#show par: set par(leading:2.2pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[381　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

图11.20给出两个相邻触发器之间的组合逻辑路径，以最长路径延迟 $T_"DMAX"$、时钟到Q延迟 $T_"clk-q"$ 和捕获端建立时间 $T_"setup"$ 描述一个周期中的数据传播。

#fig1120()
#align(center)[*图11.20　偏斜对时钟周期时间的影响（可编辑概念示意）*]

原书给出建立时间约束：

#align(center)[$T_"cycle" = T_"clk-q" + T_"DMAX" + T_"setup" + T_"skew" quad (11.6)$]

*时钟偏斜增加时，可能减少允许的组合逻辑预算。* 图示还说明了时钟偏斜符号的选择必须和发射/捕获两端的定义保持一致。

不仅要满足建立时间，还要满足保持时间约束。对于短数据路径，捕获寄存器如果太晚看到数据的旧值，就可能捕获到尚不该出现的新值。原书给出的必要条件：

#align(center)[$T_"skew" + T_"hold" < T_"clk-q" + T_"DMIN" quad (11.7)$]

右侧中的 $T_"DMIN"$ 是数据最短组合路径延迟。无论增加缓冲器还是调整时钟树，均需重新验证建立与保持约束。
