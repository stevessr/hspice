// SOURCE PDF PAGE 228 · print 209. Source-checked optimal PMOS 6.2 lambda.
#set document(title:"第6章·例6.7最优PMOS与练习6.2·PDF228")
#align(center)[#text(size:8pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　　209]]
#line(length:100%,stroke:.5pt)

*解答：*（a）为了使延迟相等，PMOS器件的尺寸应当大约是尺寸为 $4lambda$ 的NMOS器件的2.4倍。因此，PMOS器件的尺寸大约为 $10lambda$。每一个输出的总电容是4.2 fF。

整个反相器链的延迟是每一级延迟的4倍：

#align(center)[$tau_("total")=4t_("pHL")=4R_("eff")C_("load")=4(12.5 " kΩ")(2/4)(4.2 " fF") approx 105 " ps"$]

这是值比我们在前面例子中的 $8lambda$ PMOS器件上获得的值大。

（b）为了使延迟最小，写出前两个反相器的延迟方程：

#align(center)[$D=sum R C=(R_P)(C_g+C_("eff"))(W_P+W_N)+(R_N)(C_g+C_("eff"))(W_P+W_N)$]

#align(center)[$= ((30 L_P)/W_P + (12.5 L_N)/W_N)(C_g+C_("eff"))(W_P+W_N)$]

#align(center)[$= ((30(2lambda))/W_P+(12.5(2lambda))/(4lambda))(2+1)(W_P+4lambda)$]

#align(center)[$= ((60lambda)/W_P+25/4)3(W_P+4lambda)$]

#align(center)[$= 180lambda + (720lambda^2)/W_P + (75/4)(W_P+4lambda)$]

为了优化延迟，将这个表达式对 $W_P$ 求导：

#align(center)[$(partial D)/(partial W_P)=-(720lambda^2)/(W_P^2)+75/4=0$]

#align(center)[$therefore W_P=sqrt((720lambda^2)/(75/4))=2lambda sqrt(720/75) approx 6.2lambda$]

基于延迟的简单模型，PMOS器件与NMOS器件尺寸的最佳比例大约为6:4。

根据前面的例子，可以重新计算4个反相器组成的反相器链的延迟：

#align(center)[$C_("load")=C_("fanout")+C_("eff")+C_("wire")=2+1+0 approx 3 " fF"$]

对于一个反相器驱动另一个相同反相器的情况，其上升延迟为：

#align(center)[$t_("pLH")=R_("eff")C_("load")=(30 " kΩ")(2/6)(3 " fF") approx 30 " ps"$]

对于一个反相器驱动另一个相同反相器的情况，其下降延迟为：

#align(center)[$t_("pHL")=R_("eff")C_("load")=(12.5 " kΩ")(2/4)(3 " fF") approx 18.8 " ps"$]

总延迟为：

#align(center)[$tau_("total")=2(t_("pHL")+t_("pLH"))=2(18.8 " ps"+30 " ps")=97.6 " ps"$]

这比前面例子中的反相器稍快。

#line(length:100%,stroke:.5pt)
*练习6.2*　在前面的例子中，用SPICE模拟找出PMOS和NMOS管的最佳尺寸，使通过其中反相器链的延迟最小。这个结果与手工计算的结果相比有什么不同？