// SOURCE PDF PAGE 271 / PRINTED252. Section 7.3.3 and logical effort Figures7.19/7.20.
#import "../figures/ch7-latch-domino-pass9.typ": fig719, fig720
#set document(title:"第7章·CMOS传输门的逻辑强度·PDF271")
#align(center)[#text(size:8pt,weight:"bold")[252　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 7.3.3　CMOS 传输门的逻辑强度

现在我们讨论逻辑强度（LE，logical effort）问题及其在CMOS传输门中的应用。考虑图7.19中的电路，其中有最小尺寸的传输门。这是另一种类型的三态驱动器，和第4章4.9节中的三态反相器有类似的功能。这里有3个输入：A、sel和$\overline("sel")$。因为sel和$\overline("sel")$是相关的，所以我们可以计算sel和输入A的逻辑强度。

对于输入A，我们使用通过LE方法得出的比率 $R_("gate") C_("in")/(R_("inv") C_("inv"))$。这包括第6章中所描述的$C_("in")$和$R_("eff")$的乘积。这个反相器$C_("in")$的表达式为$3W C_g$。假设反相器和TG各自有电阻R，则$R_("out")$为$2R$，因此$"LE"_A=2$。对于输入sel，输入电容是$W C_g$，总路径电阻是$2R$（包括反相器）。因此$"LE"_("sel")=2/3$。

#fig719()
#align(center)[*图7.19　传输门的逻辑强度计算*]

#align(center)[$"LE"_A=(3W(2R))/(3W R)=2 quad "LE"_("sel")=(W(2R))/(3W R)=2/3$]

如果把传输门的尺寸扩大为最小尺寸的3倍，则如图7.20所示，可以看到A输入的逻辑强度减少而输入信号sel的逻辑强度增加。这从直觉上是合理的，因为A有较小的输出电阻且它的输入电容没有任何变化，然而输入信号sel的输入电容增加了3倍，但它的输出电阻却没有减少到1/3。

#fig720()
#align(center)[*图7.20　3X传输门的逻辑强度计算*]

#align(center)[$"LE"_A=(3W(4R/3))/(3W R)=4/3 quad "LE"_("sel")=(3W(4R/3))/(3W R)=4/3$]

#line(length:100%,stroke:.55pt)
*例7.5　驱动CMOS TG的与非门的逻辑强度*

*问题：* 对于下面所示的两个设计，计算输入A和输入sel的逻辑强度。