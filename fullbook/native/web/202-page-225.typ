// SOURCE PDF PAGE 225 · print 206. Example 6.5 original integrals.
#import "../figures/ch6-ramp-native.typ": fig613
#set document(title:"第6章·例6.5阶跃/斜坡延迟解析·PDF225")
#align(center)[#text(size:8pt,weight:"bold")[206　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.5pt)

#align(center)[$i_("out")=i_("max")=C_L (dif V_("out"))/(dif t)=C_L (V_("DD")/2)/(t_("pHL,step"))$]
#align(center)[$therefore t_("pHL,step")=C_L (V_("DD")/2)/i_("max")$]

（b）用相应的输出电流计算下图所示的由斜波输入引起的波形的延迟 $t_("pHL,ramp")$。输入电压的上升时间是 $t_r$。

#fig613()

*解答：* 斜波输入情况下的传播延迟可以计算如下：

#align(center)[$i_("out")=C_L (dif V_("out"))/(dif t)$]
#align(center)[$therefore integral i_("out") dif t = integral C_L dif V_("out")$]

#align(center)[$integral_0^(t_r/2) i_("max") (t/(t_r/2)) dif t + integral_(t_r/2)^(t_("pHL,ramp")) i_("max") dif t = C_L integral_0^(V_("DD")/2) dif V_("out")$]

#align(center)[$i_("max") t_r/4 + i_("max")(t_("pHL,ramp") - t_r/2)= C_L V_("DD")/2$]
#align(center)[$therefore t_("pHL,ramp") = t_r/4 + (C_L V_("DD")/2)/i_("max")$]

（c）根据阶跃延迟和输入上升时间两个参数写出斜波延迟的表达式。

*解答：* 通过考察上面两个问题的结果，我们发现：

#align(center)[$t_("pHL,ramp")=t_r/4+t_("pHL,step")$]

如果做一个近似 $t_r approx 2t_("pLH,step")$，那么：