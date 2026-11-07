// SOURCE PDF PAGE 237, printed 218. Logic effort source-image reflow; not strictly accepted.
#set document(title:"第6章 · 用逻辑强度优化路径 · PDF237")
#align(center)[#text(size:8pt,weight:"bold")[218　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.5pt)

= 6.6　用逻辑强度优化路径

== 6.6.1　逻辑强度的导出

需要一个基于前面得出的结论的更简便方法来优化电路。幸运的是，这样的方法是存在的。一种简化表达式的方法是通过将各种门的 $tau$ 值与反相器特性参数 $tau_("inv")$ 相比较来对其进行归一化，而不是使用各种门的 $tau$ 值。

可以定义一个新的参数项，叫做逻辑强度（LE, logical effort），即逻辑门本征时间常量与反相器本征时间常量的比值。例如，反相器的逻辑强度是 $tau_("inv")/tau_("inv")=1$；与非门的逻辑强度是 $tau_("nand")/tau_("inv")$；或非门的逻辑强度是 $tau_("nor")/tau_("inv")$。通过使用LE，可以写出归一化的延迟公式。

例如，总延迟的公式（6.25）可以重新写为：

#align(center)[$D/tau_("inv") = (tau_("nand")/tau_("inv")) ((C_(j+1))/(C_j)+gamma_("nand")) + (tau_("inv")/tau_("inv")) ((C_(j+2))/(C_(j+1))+gamma_("inv")) + (tau_("nor")/tau_("inv")) ((C_(j+3))/(C_(j+2))+gamma_("nor"))$]

在归一化的形式中，该延迟公式是：

#align(center)[$D=(LE_("nand") ""FO""_j + P_("nand"))+(LE_("inv") ""FO""_(j+1) + P_("inv"))+(LE_("nor") ""FO""_(j+2)+P_("nor"))$]

在该延迟表达式中，每一个门产生一个参数项 $"LE" times ""FO""+P$，这可以写成一种更简洁的形式：

#align(center)[$D=sum_i (LE_i times ""FO""_i+P_i)$]

其中，$"LE"=tau_("gate")/tau_("inv")$，同时 $ ""FO""_i = C_(i+1)/C_i$，且寄生参数 $P="LE" times gamma_("gate")$。

使用这些定义，可以返回到较早的用于优化延迟的公式中，并且会发现对于最小的延迟，需要使所有门的 $"LE" times ""FO""$ 相等。只有一种门时，要尽量使每个门的延迟和其他门的延迟相同。这是可能做到的，因为它们的 $P$ 参数项都相同。当逻辑路径中有许多种不同类型的门时，只要求所有门延迟的扇出部分 $"LE" times ""FO""$ 相同，因为它们的 $P$ 参数项可能都不一样。

逻辑强度的基本原理已经介绍过了，但是这里仍有许多没有回答的问题：

+ 如何获得任何类型逻辑门的逻辑强度（LE）？
+ 如何计算任何类型逻辑门的寄生参数项（P）？
+ 在一个逻辑电路中，如何使用LE和P值找出关键路径中的最优延迟和器件尺寸？

为了确定逻辑门的LE，我们回顾一下反相器 $tau$ 值的定义：

#align(center)[$tau_("inv")=3R_("eqn")C_g L_n$]

与非门和或非门相应的值为：

#align(center)[$tau_("nand")=4R_("eqn")C_g L_n quad tau_("nor")=5R_("eqn")C_g L_n$]

使用这些值，得到：

#align(center)[$LE_("inv")=1 quad LE_("nand")=4/3 quad LE_("nor")=5/3$]