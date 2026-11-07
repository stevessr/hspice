// SOURCE PDF PAGE 248 / PRINTED229. Original printed summary formulas preserved.
#set document(title:"第6章 · 小结——延迟与逻辑强度公式汇总 · PDF248")
#align(center)[#text(size:8pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　　229]]
#line(length:100%,stroke:.5pt)

驱动电阻：

#align(center)[$R_("eqn") approx 12.5 " kΩ/□"$]
#v(9pt)
#align(center)[$R_("eqp") approx 30 " kΩ/□"$]
#v(9pt)
#align(center)[$R_N=R_("eqn") (L/W)_n$]
#v(9pt)
#align(center)[$R_P=R_("eqp") (L/W)_p$]
#v(9pt)

负载电容组成：

#align(center)[$C_("load")=C_("self")+C_("wire")+C_("fanout")$]
#v(9pt)

输入电容：

#align(center)[$C_g=C_("ox")L+2C_("ol") approx 2 " fF/μm"$]
#v(9pt)

自身电容：

#align(center)[$C_("eff")=C_j+2C_("ol") approx 1 " fF/μm"$]
#v(9pt)

连线电容：

#align(center)[$C_("int")=0.2 " fF/μm"$]
#v(9pt)

总延迟：

#align(center)[$"总延迟"=sum_i R_i C_i$]
#v(9pt)

反相器延迟公式：

#align(center)[$t_("delay") = tau_("inv") [C_("out")/C_("in")+gamma_("inv")]$]
#v(9pt)

其中，

#align(center)[$tau_("inv")=R_("eff")C_("in")=R_("eqn")(L_n/W_n) C_g (3W_n)=3R_("eqn") C_g L_n$]
#v(9pt)

#align(center)[$gamma_("inv")=C_("self")/C_("in")$]
#v(9pt)

与非门和或非门的本征时间常数：

#align(center)[$tau_("nand")=R_("eff") C_("in")=R_("eqn")(L_n/W_n)4W_n C_g=4R_("eqn")C_g L_n$]
#v(9pt)

#align(center)[$tau_("nor")=R_("eff")C_("in")=R_("eqn")(L_n/W_n)5W_n C_g=5R_("eqn")C_g L_n$]
#v(9pt)

归一化的延迟公式（保留原书此页印刷形式）：

#align(center)[$D=sum_i ("LE"_i times "FO"_i times P_i)$]
#v(9pt)

其中，

#align(center)[$"LE"=tau_("gate")/tau_("inv")$]
#v(9pt)

#align(center)[$"FO"_j=C_(j+1)/C_j$]
#v(9pt)

#align(center)[$P="LE" times gamma_("gate")$]
#v(9pt)

