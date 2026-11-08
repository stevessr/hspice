// SOURCE PDF PAGE 284 / printed 265 · 例7.9解答、7.5.4自复位电路。
#import "../figures/ch7-domino-advanced-native.typ": fig734, fig735
#set document(title:"第7章·例7.9异或/同或与7.5.4自复位电路·PDF284")
#align(center)[#text(size:8pt,weight:"bold")[第7章　传输门和动态逻辑设计　　　　　　　　　　　　265]]
#line(length:100%,stroke:.55pt)

*解答：*

#fig734()
#align(center)[*例7.9　具有公共晶体管的XOR/XNOR双轨多米诺逻辑*]

== 7.5.4　自复位电路

对多米诺门的时钟进行布线给CAD工具带来了一个难题，并在电路设计过程中引入了延迟和偏斜问题。有一些情况允许使用那种经过指定延迟后可以自动给自身充电（也就是给自身复位）的电路，叫做后充（postcharge）或者自复位逻辑电路。这些电路可以在每个周期中只有一小部分门发生转变的情况下使用，比如存储器译码器（将在第10章中描述）等。这里我们将探讨这种电路的基本操作。

#fig735()
#align(center)[*图7.35　预充与后充（自复位）电路*]