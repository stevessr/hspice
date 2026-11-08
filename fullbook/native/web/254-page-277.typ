// SOURCE PDF PAGE 277 / PRINTED258; editable domino figures 7.27–7.28.
#import "../figures/ch7-domino-keeper-pass10.typ": fig727, fig728
#set document(title:"第7章·多米诺门的安全连接和级联·PDF277")
#align(center)[#text(size:8pt,weight:"bold")[258　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#fig727()
#align(center)[*图7.27　动态门的连接*]

图7.28给出了3个多米诺逻辑级的级联。在$\phi$为低时所有的三级电路都被预充到高电平。时钟$\phi$不需要保持低电平很长时间，因为所有级都是被同时预充的。事实上，时钟只需要保持低电平直到所有的反相器输出都为低电平为止。当$\phi$升高时进入求值阶段，这时假设通过它们各自的NMOS逻辑块如果都有连接到地的路径，则所有的内部节点（标注为$Y_1$、$Y_2$、$Y_3$）的电压都将像多米诺骨牌一样按从左到右的顺序倒下。这就是为什么用多米诺这个名字来描述这种逻辑电路实现方式的原因。

#fig728()
#align(center)[*图7.28　多米诺门的级联*]

同时，根据NMOS逻辑块中的逻辑，真正的输出$F_1$、$F_2$和$F_3$将上升到$V_("DD")$。时钟必须保持高电平足够长的时间，使得全部门完成求值。