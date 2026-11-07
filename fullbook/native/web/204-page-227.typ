// SOURCE PDF PAGE 227 · print 208. Example 6.6 and beginning of 6.7.
#import "../figures/ch6-ramp-native.typ": fig-inverter-4
#set document(title:"第6章·例6.6 FO4延迟和例6.7最佳PMOS宽度·PDF227")
#align(center)[#text(size:8pt,weight:"bold")[208　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.5pt)

*解答：*（a）从前面的例子中得到了扇出和自身电容的值。为了简单起见，将设置连线电容为0：

#align(center)[$C_("load")=C_("fanout")+C_("self")+C_("wire")=9.6+1.2+0 approx 10.8 " fF"$]

驱动4个同样反相器的反相器延迟 $t_("pHL")$ 为：

#align(center)[$t_("pHL")=R_("eff")C_("load")=(12.5 " kΩ")(L/W)(10.8 " fF")$]
#align(center)[$=(12.5 " kΩ")(1/2)(10.8 " fF")=(6.25 " kΩ")(10.8 " fF") approx 68 " ps"$]

驱动4个同样反相器的反相器延迟 $t_("pLH")$ 为：

#align(center)[$t_("pLH")=R_("eff")C_("load")=(30 " kΩ")(L/W)(10.8 " fF")$]
#align(center)[$=(30 " kΩ")(1/4)(10.8 " fF")=7.5 " kΩ"(10.8 " fF") approx 81 " ps"$]

#align(center)[$therefore t_p=(t_("pHL")+t_("pLH"))/2=(68+81)/2=74.5 " ps"$]

因此，四扇出（FO4，fanout-of-four）反相器的平均延迟大约为75 ps。

（b）对于4个反相器构成的反相器链，计算FO1上升和下降延迟。

#align(center)[$t_("pHL")=R_("eff")C_("load")=(6.25 " kΩ")(2.4+1.2) " fF"=22.5 " ps"$]
#align(center)[$t_("pLH")=R_("eff")C_("load")=(7.5 " kΩ")(2.4+1.2) " fF"=27 " ps"$]

总延迟是每个延迟之和的两倍：

#align(center)[$tau_("total")=2(t_("pHL")+t_("pLH"))=2(22.5 " ps"+27 " ps")=99 " ps"$]

#line(length:100%,stroke:.5pt)
*例6.7　反相器链中最优化的PMOS器件尺寸*

*问题：* 调整反相器尺寸可以使上升/下降延迟相等或者使传播延迟达到最小。考虑下图所示的4个反相器构成的链。假设所有的NMOS管尺寸为 $4lambda$，按照如下要求确定PMOS器件尺寸：（a）使上升和下降延迟相等。（b）使通过反相器链的延迟最小。在这两种情况下通过这4个反相器的延迟是多少？

#fig-inverter-4()