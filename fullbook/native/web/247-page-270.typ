// SOURCE PDF PAGE 270 / PRINTED251. Example7.4 MUX1/MUX2 Elmore RC comparison.
#import "../figures/ch7-latch-domino-pass9.typ": mux-rc
#set document(title:"第7章·例7.4两种多路器的艾蒙延迟比较·PDF270")
#align(center)[#text(size:8pt,weight:"bold")[第7章　传输门和动态逻辑设计　　　　　　　　　　　　251]]
#line(length:100%,stroke:.55pt)

*例7.4*　对于图7.11中的两个多路器，假设存在输入到输出的路径，那么哪一个更快？假设每一个输入由一个1X的反相器驱动，且多路器的扇出是1X反相器的 $f$ 倍。

*解答：*

为了计算延迟，我们需要利用艾蒙延迟计算公式。对于三阶的RC阶梯，延迟有如下形式：

#align(center)[$t_("Elmore")=R_1 C_1+(R_1+R_2)C_2+(R_1+R_2+R_3)C_3$]

使用这个公式，我们可以得出这两种情况下的RC电路和延迟，如下所示。

*其一：MUX1*

#mux-rc(name:"MUX1",third:true)

#align(center)[$t_1=R_("inv") C_1+(R_("inv")+R_("TG"))C_2+(R_("inv")+2R_("TG"))C_3$]

#align(center)[$C_1=3C_("eff")W+C_g W+2C_("eff")W quad R_("inv")=R$]
#align(center)[$C_2=C_g W times 2+2C_("eff")W times 3 quad R_("TG")=R$]
#align(center)[$C_3=2C_("eff")W times 2+C_g W+3f C_g W$]
#align(center)[$t_1=R(29C_("eff")+8C_g+9f C_g)W$]

*其二：MUX2*

#mux-rc(name:"MUX2",third:false)

#align(center)[$t_2=R_("inv") C_4+(R_("inv")+R_("TG"))C_5$]

#align(center)[$C_4=3C_("eff")W+2C_("eff")W+C_g W quad R_("inv")=R$]
#align(center)[$C_5=2C_("eff")W times 4+C_g W+3f C_g W quad R_("TG")=R$]
#align(center)[$t_2=R(21C_("eff")+3C_g+6f C_g)W$]

比较这两种情况，MUX1比MUX2慢。如果我们使用的传输门太多而没有缓冲，延迟会很快增大。另外，我们最终要驱动一个大的负载，而传输门也没有所需的驱动能力。但是，MUX2比MUX1需要更多的布线资源。