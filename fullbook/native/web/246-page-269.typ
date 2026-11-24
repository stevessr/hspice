// SOURCE PDF PAGE 269 / PRINTED250. Original equations and Figures 7.18(a)-(c).
#import "../figures/ch7-latch-domino-pass9.typ": fig718
#set document(title:"第7章·传输门输入输出电容和艾蒙延迟·PDF269")
#align(center)[#text(size:8pt,weight:"bold")[250　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)
#v(18pt)

#align(center)[$C_("in")=C_("out")=C_("eff")(W_n+W_p)+(1/2)(C_g W_n+C_g W_p) quad "(7.10)"$]

注意，两个器件的尺寸相同，所以上式可以简化为：

#align(center)[$C_("in")=C_("out")=C_("eff") 2W+C_g W quad "(7.11)"$]

有了上面定义的完整RC模型，现在可以计算含有传输门的电路的路径延迟了。但是，精确的延迟计算必须包含传输门的驱动和负载特性。这在图7.18（a）中说明，在这里反相器驱动传输门，而第二个反相器又是这个传输门的负载。为了准确计算延迟，需要使用图7.18（b）所示的RC模型。这里反相器的RC模型连接到传输门的输入，且负载电容连接到反相器的输出。最终的结果是一个RC阶梯电路。

#v(22pt)
#fig718()
#align(center)[*图7.18　有驱动和负载的传输门*]

#v(24pt)
RC阶梯和RC树的艾蒙延迟（Elmore delay）公式将在第10章中进行描述。这里我们为了分析的目的，仅仅使用该章中得到的结果。对于这个例子，用艾蒙延迟公式得到的图7.18（c）中二阶RC阶梯的延迟为：

#align(center)[$t_("Elmore")=R_1 C_1+(R_1+R_2)C_2$]

因此，对于图7.18（b）中的RC网络，我们将如下计算其延迟：

#align(center)[$t_("Elmore")=R_("inv")(C_("inv")+C_("TG1"))+(R_("inv")+R_("TG"))(C_("TG2")+C_("load"))$]