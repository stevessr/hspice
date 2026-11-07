// SOURCE PDF PAGE 240, printed 221. Parasitic delay Table6.2 and Example6.11.
#import "../figures/ch6-path-sizing-native.typ": fig-example610
#set document(title:"第6章 · 寄生参数P与例6.11逻辑强度优化 · PDF240")
#align(center)[#text(size:8pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　　221]]
#line(length:100%,stroke:.5pt)

对于或非门，同样参考图6.27来确定P。通过正确地考虑版图中共用的源/漏区，可以计算如下：

#align(center)[$P_("nor")="LE"_("nor") times gamma_("nor") = "LE" times (C_("self")/C_("in"))$]

#align(center)[$="LE" times (C_("eff")(W+4W+4W))/(C_g(W+4W))="LE" times (C_("eff")/C_g) times 9/5 =5/3 times 1/2 times 9/5=3/2$]

精确计算该值的最好办法是通过模拟。然而，为了进行快速手工计算，可以使用下面近似的表6.2。

#align(center)[*表6.2　一些简单门的寄生参数项*]

#table(columns:(1.3fr,1fr,1fr,1fr,1fr),inset:4pt,
 table.header([门的类型],[1输入],[2输入],[3输入],[4输入]),
 [反相器],[$P_("inv")=1/2$],[—],[—],[—],
 [与非门],[—],[$2P_("inv")=1$],[$3P_("inv")=3/2$],[$4P_("inv")=2$],
 [或非门],[—],[$3P_("inv")=3/2$],[$4.5 P_("inv")=9/4$],[$6P_("inv")=3$])

#line(length:100%,stroke:.5pt)
*例6.11　用逻辑强度进行路径优化*

*问题：* 用逻辑强度技术重做例6.10。在确定尺寸之前，计算最佳延迟。

#fig-example610()

*解答：*

需要使所有门延迟中的LE×FO的部分相等。

首先，计算所有门的LE×FO乘积：

#align(center)[$"总的路径强度" = "LE"_("nand") times "LE"_("inv") times "LE"_("nor") times (C_("load")/C_("in"))$]

#align(center)[$=(4/3)(1)(5/3)(200/2)=222.2$]

下一步，计算这个结果的几何平均值：

#align(center)[$"级强度"=root(3,222.2) approx 6$]

这是延迟的扇出部分。归一化的路径延迟是这个值的3倍（相应于每一个门）加上每个门的寄生参数项：

#align(center)[$D = 3(6)+P_("nand")+P_("inv")+P_("nor")$]

#align(center)[$=18+1+(1/2)+(3/2)=21$]

实际的延迟可以通过把归一化的延迟乘以 $tau_("inv")=7.5 " ps"$ 而得到：

#align(center)[$"最小的路径延迟"=tau_("inv") D=(7.5 " ps")(21)=157.5 " ps"$]