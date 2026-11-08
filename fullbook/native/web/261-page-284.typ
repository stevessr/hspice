// SOURCE PDF PAGE 284 / PRINTED 265. Scan-backed editable excerpt, not 1:1 accepted.
#import "../figures/ch7-domino-continuation-native.typ": fig-example79, fig735
#set document(title:"第7章·双轨异或逻辑与7.5.4自复位电路·PDF284")
#align(center)[#text(size:8pt,weight:"bold")[第7章　传输门和动态逻辑设计　　　　　　　　　　　　265]]
#line(length:100%,stroke:.55pt)

*例7.9（续）*

*解答：* 双轨异或和同或的两个输出分别对应：

#align(center)[$"XOR"=a overline(b)+overline(a)b$]
#align(center)[$"XNOR"=a b+overline(a)overline(b)$]

两个互补逻辑块使用公共的预充时钟与求值通路。源图的晶体管网络应在下一轮逐管核对；这里给出了可编辑的双轨功能结构。

#fig-example79()
#align(center)[*例7.9　双轨异或/同或多米诺门（结构重绘）*]

== 7.5.4　自复位电路

对多米诺门的时钟进行布线给 CAD 工具带来了一个难题，并在电路设计过程中引入了延迟和偏斜问题。有些情况允许使用那种经过指定的延迟后可以自动给自身充电（也就是给自身复位）的电路，叫做后充（postcharge）或者自复位逻辑电路。这些电路可以在每个周期中只有一小部分门发生转变的情况下使用，比如存储器译码器（将在第10章中描述）等。这里探讨这些电路的基本操作。

图7.35给出了标准预充结构和后充电结构。在多米诺电路的情况下，时钟用来控制电路操作。在自复位情况下，输出反馈回预充控制输入，经过一个指定的时间延迟后恢复上拉的工作。

延迟线以一系列反相器实现。传播经过这些电路的信号是脉冲，必须谨慎地控制这些脉冲的宽度，否则 NMOS 器件和 PMOS 器件之间可能会有竞争，甚至导致坏的情况下面的产生振荡。

例如，如果 $A$ 为高电平的时间超过环路延迟的两倍以上，电路将会振荡。因此，必须给予特别注意以保证正确的时序。

#fig735()
#align(center)[*图7.35　预充与后充电路*]