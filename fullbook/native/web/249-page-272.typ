// SOURCE PDF PAGE 272 / PRINTED253. Example7.5 and beginning of D-latch section.
#import "../figures/ch7-latch-domino-pass9.typ": fig721, fig-example75
#set document(title:"第7章·例7.5传输门输入强度和7.4锁存器·PDF272")
#align(center)[#text(size:8pt,weight:"bold")[第7章　传输门和动态逻辑设计　　　　　　　　　　　　253]]
#line(length:100%,stroke:.55pt)

#fig-example75()
#v(6pt)

*解答：*

对于第一种设计，

#align(center)[$"LE"_A=(4W(2R))/(3W R)=8/3$]
#align(center)[$"LE"_("sel")=(W(2R))/(3W R)=2/3$]

对于第二种设计，

#align(center)[$"LE"_A=(4W(5R/4))/(3W R)=5/3$]
#align(center)[$"LE"_("sel")=(4W(5R/4))/(3W R)=5/3$]

== 7.4　动态D锁存器和D触发器

在第5章中描述了对于锁存器和触发器的操作与设计的考虑。D触发器和D锁存器可能是CMOS设计中使用最广泛的电路。我们将在本节中说明用传输门实现这类时序元件时可以从哪些方面进行设计的改进。使用传输门最主要的优点是这种电路比第5章中的结构所需要的晶体管数目少得多。

我们从最简单的D锁存器开始讨论，如图7.21（b）所示。让人感到惊奇的是，一个单独的NMOS传输管具有D锁存器的功能。这是很显然的，因为当CLK为高电平时D的值会传递到Q。当时钟从高转换到低时，最后的值储存在电容$C_Q$。然而根据本章前面部分所介绍的内容，这个电路中有很多明显的问题。首先，输出的电压只能上升到$V_("DD")-V_("TN")$。第二，当时钟变低时在Q点会出现时钟馈通，馈通的程度由式（7.3）给出。第三，没有$overline(Q)$输出。最后，或许也是最重要的，时钟变低后输出处于高阻态，于是容易受到各种电荷丢失机制的影响。

#fig721()
#align(center)[*图7.21　简单D锁存器的演进*]