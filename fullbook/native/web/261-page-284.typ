// SOURCE PDF PAGE 284 / PRINTED265; example 7.9 final and self-reset logic.
#import "../figures/ch7-domino-keeper-pass10.typ": fig735
#set document(title:"第7章·例7.9及7.5.4自复位电路·PDF284")
#align(center)[#text(size:8pt,weight:"bold")[第7章　传输门和动态逻辑设计　　　　　　　　　　　　265]]
#line(length:100%,stroke:.55pt)

*解答：*

#align(center)[$"XOR"=overline(a)b+a overline(b)$]
#align(center)[$"XNOR"=ab+overline(a) overline(b)$]

采用双轨结构，一个分支实现XOR，另一个分支实现XNOR，并可按源书原理共享部分NMOS输入晶体管。互补输出由双轨多米诺逻辑在求值阶段产生。

== 7.5.4　自复位电路

对多米诺门的时钟进行布线给CAD工具带来了一个难题，并在电路设计过程中引入了延迟和偏斜问题。有一些情况允许使用那种经过指定的延迟后可以自动给自身充电（也就是给自身复位）的电路，叫做后充（postcharge）或者自复位逻辑电路。这些电路可以在每个周期中只有一小部分门发生转变的情况下使用，比如存储器译码器（将在第10章中描述）等。这里我们将探讨这些电路的基本操作。

图7.35给出了标准预充结构和后充电荷结构。在多米诺电路的情况中，时钟用来控制电路操作。在自复位情况中，输出反馈回预充控制输入，经过一个指定的时间延迟后恢复上拉的工作。延迟线以一系列反相器来实现。传播过这些电路的信号是脉冲。必须谨慎地控制这些脉冲的宽度，否则在NMOS器件和PMOS器件之间可能会有竞争，甚至在更坏的情况下可能产生振荡。例如，如果A为高电平的时间超过环路延迟的两倍以上，电路将会振荡。因此，必须给予特别的注意以确保正确的时序。

#fig735()
#align(center)[*图7.35　预充与后充电路*]