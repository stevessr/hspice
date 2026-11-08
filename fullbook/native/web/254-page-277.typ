// SOURCE PDF PAGE 277 / PRINTED 258. Scan-backed editable excerpt, not 1:1 accepted.
#import "../figures/ch7-domino-continuation-native.typ": fig727, fig728
#set document(title:"第7章·多米诺门的连接和级联·PDF277")
#align(center)[#text(size:8pt,weight:"bold")[258　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#fig727()
#align(center)[*图7.27　动态门的连接*]

图7.28 给出了三个多米诺逻辑级的级联。在 $phi$ 为低时所有的三级电路都被预充到高电平。时钟 $phi$ 不需要保持低电平很长时间，因为所有级都是被同时预充的。事实上，时钟只需要保持低电平直到所有的反相器输出都为低电平为止。

当 $phi$ 升高时进入求值阶段。这时候逻辑运算在门各自的 NMOS 逻辑块中根据输入信号完成。每个逻辑块若存在到地的导通路径，其内部节点 $Y_1$、$Y_2$、$Y_3$ 便由左到右依次放电。该逐级求值的方式，也是“多米诺”名称的由来。

#fig728()
#align(center)[*图7.28　多米诺门的级联*]

同时，根据 NMOS $n$ 逻辑块中的逻辑，真正的输出 $F_1$、$F_2$ 和 $F_3$ 将上升到 $V_("DD")$。时钟必须保持高电平足够长的时间，以使逻辑电平能够通过整个电路链。