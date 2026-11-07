// SOURCE PDF PAGE 239, printed 220. Figure6.28, Table6.1, parasitic P.
#import "../figures/ch6-logical-effort-native.typ": fig628
#set document(title:"第6章 · 输入电容等效逻辑强度与表6.1 · PDF239")
#align(center)[#text(size:8pt,weight:"bold")[220　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.5pt)

杂一些，但是可以在已知两个门的输入电容相等的情况下使用。

#fig628()
#align(center)[*图6.28　输入电容相等时各个门的逻辑强度的计算*]

或非门的逻辑强度比与非门的高。这意味着按照逻辑强度来说与非门比或非门要好，也就是说较低的LE值比较高的LE值好。已经介绍过LE是以输出驱动和输入负载特性的形式来评估门的。与非门的驱动输出和降低输入负载的能力较好。事实上，和或非门相比，用与非门可以得到一个较小的延迟。在这3个门中，反相器是可供使用的最好的门，但是只能提供反相的功能。所以在进行选择时，应该用与非门而不是或非门。

多输入门的LE也可以用同样的方式进行计算。作为练习，读者应该尝试计算表6.1中给出的多输入门的逻辑强度值的结果。

#align(center)[*表6.1　一些简单门的逻辑强度值*]

#table(columns:(1.3fr,1fr,1fr,1fr,1fr),inset:4pt,
 table.header([门的类型],[1输入],[2输入],[3输入],[4输入]),
 [反相器],[$1$],[—],[—],[—],
 [与非门],[—],[$4/3$],[$5/3$],[$6/3$],
 [或非门],[—],[$5/3$],[$7/3$],[$9/3$])

下一步计算寄生参数项P。遗憾的是，这个参数项依赖于工艺以及逻辑门。在一种给定的工艺下，对于所有不同类型的门，这个参数项需要一一重新计算。先从一个简单的反相器开始并确定其P值。已经介绍过这个参数项是按以下公式给出的：

#align(center)[$P = LE_("inv") times gamma_("inv") = LE times (C_("self")/C_("in")) = LE times (C_("eff") 3W)/(C_g 3W)=LE times (C_("eff")/C_g)$]

事实上，P值依赖于结电容的系数和门电容的系数。代入LE的值和由工艺决定的参数，得到：

#align(center)[$P_("inv")=(1) times ((1 " fF/μm")/(2 " fF/μm"))=1/2$]

对于与非门，参考图6.27来确定P。考虑到版图中有共用的源/漏区，可以计算如下：

#align(center)[$P_("nand")=LE_("nand") times gamma_("nand") = LE times (C_("self")/C_("in"))$]

#align(center)[$=LE times (C_("eff")(2W+2W+2W))/(C_g(2W+2W))=4/3 times 1/2 times 3/2=1$]