// SOURCE PDF PAGE 236 / printed 217. Worked optimal NAND-INV-NOR route.
#import "../figures/ch6-path-sizing-native.typ": fig-example610
#set document(title:"第6章 · 例6.10关键路径门尺寸优化 · PDF236")
#align(center)[#text(size:8pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　　217]]
#line(length:100%,stroke:.5pt)

#align(center)[$therefore tau_("inv") "FO"_(j+1) = tau_("nor") "FO"_(j+2)$]

同样得到了相同的结果：为了最优化延迟，必须使所有门延迟的扇出部分相等。

#line(length:100%,stroke:.5pt)
#v(14pt)
*例6.10　计算关键路径上最优化的门尺寸*

*问题：* 找出下面电路中指定路径上的器件尺寸，以使延迟最优化。

#v(8pt)
#fig-example610()

#v(16pt)
*解答：*

必须使延迟的扇出部分相等。因此，

#align(center)[$tau_("nand") ((C_(j+1))/(C_("in"))) = tau_("inv") ((C_(j+2))/(C_(j+1))) = tau_("nor") ((C_("load"))/(C_(j+2)))$]

#v(6pt)
取这三部分的乘积，然后计算其几何平均值：

#align(center)[$"扇出延迟"=root(3,tau_("nand") (C_(j+1)/C_("in")) times tau_("inv") (C_(j+2)/C_(j+1)) times tau_("nor") (C_("load")/C_(j+2)))$]

#align(center)[$=root(3,tau_("nand") tau_("inv") tau_("nor") (C_("load")/C_("in")))$]

#align(center)[$=root(3,4 times 3 times 5 times (200/2)) R_("eqn") C_g L_n = 18.2 R_("eqn") C_g L_n$]

因此，可以通过把扇出延迟设置为上面的结果而计算得到每一个门的输入电容：

#align(center)[$tau_("nor") (C_("load")/C_(j+2)) = 5R_("eqn")C_g L_n (200 " fF"/C_(j+2)) = 18.2 R_("eqn") C_g L_n$]

#align(center)[$therefore C_(j+2) approx 55 " fF"$]

#align(center)[$tau_("inv") (C_(j+2)/C_(j+1)) = 3R_("eqn")C_g L_n (55 " fF"/C_(j+1)) = 18.2 R_("eqn") C_g L_n$]

#align(center)[$therefore C_(j+1) approx 9.1 " fF"$]

#align(center)[$tau_("nand") (C_(j+1)/C_("in")) = 4R_("eqn")C_g L_n (9.1 " fF"/C_("in")) = 18.2R_("eqn")C_g L_n$]

#align(center)[$therefore C_("in") approx 2 " fF"$]

最终结果和题目中给出的输入电容值是一致的。器件尺寸由图6.4中晶体管的相对尺寸决定。

对于与非门：$C_("in")=2 " fF"$。因此，$W_p=W_n=0.5 " μm"$。

对于反相器：$C_("in")=9.1 " fF"$。因此，$W_p=3 " μm"$，$W_n=1.5 " μm"$。

对于或非门：$C_("in")=55 " fF"$。因此，$W_p=22 " μm"$，$W_n=5.5 " μm"$。