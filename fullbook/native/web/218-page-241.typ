// SOURCE PDF PAGE 241, printed 222. Ex6.11 reverse gate sizing and fig6.29.
#import "../figures/ch6-logical-effort-native.typ": fig629
#set document(title:"第6章 · 最小归一化延迟和图6.29 · PDF241")
#align(center)[#text(size:8pt,weight:"bold")[222　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.5pt)

假设可以接收该延迟，则从输出到输入反向计算器件尺寸：

#align(center)[$"FO"_(j+2) "LE"_("nor")=6 arrow "LE"_("nor") (C_("load")/C_(j+2))=6$]

#align(center)[$therefore C_(j+2)=(5/3)(200 " fF"/6) approx 55 " fF"$]

#align(center)[$"FO"_(j+1) "LE"_("inv")=6 arrow "LE"_("inv") (C_(j+2)/C_(j+1))=6$]

#align(center)[$therefore C_(j+1)=(1)(55 " fF"/6) approx 9.1 " fF"$]

#align(center)[$"FO"_j "LE"_("nand")=6 arrow "LE"_("nand") (C_(j+1)/C_("in"))=6$]

#align(center)[$therefore C_("in")=(4/3)(9.1 " fF"/6) approx 2 " fF"$]

这些结果和例6.10中得到的一样。器件尺寸的确定可以按照该例中的方法继续进行下去。

有用的是，可以不用给出门的尺寸而确定最小的延迟。这是LE方法的关键优势之一。如果这个最小的可能延迟不在给出的规范要求范围内，那么该逻辑可以进行改进，而且，此过程可以一直重复下去直到获得一个满意的结果为止。一旦达到了目标延迟，就可以得出门的尺寸。

== 6.6.2　理解逻辑强度

对逻辑强度的进一步了解可以通过分析图6.29中的归一化延迟（D）与电学强度（FO）图像得到。延迟的归一化是相对于 $tau_("inv")$ 的，而电学强度是扇出电容和输入电容的比值。根据定义，反相器延迟相对于FO的斜率设为1，y轴上的截距是寄生参数项，对于反相器来说是1/2。与非门的y轴截距为1而斜率为4/3，或非门的y轴截距为1.5而斜率为5/3。如果比较扇出负载为1的每个门的延迟，可以看到反相器的速度是最快的，与非门其次，或非门最慢。为了改善LE方法的精度，可以直接从SPICE中获得此图，从而在给定的工艺下确定更为精确的LE和P的值。

#fig629()
#align(center)[*图6.29　逻辑强度的实际解释*]

#line(length:100%,stroke:.5pt)
*例6.12　偏斜反相器的LE*

*问题：* 这个反相器的LE是多少？