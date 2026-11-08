// SOURCE PDF PAGE 282 / PRINTED 263. Scan-backed editable excerpt, not 1:1 accepted.
#import "../figures/ch7-domino-continuation-native.typ": fig732
#set document(title:"第7章·例7.8计算和双轨多米诺逻辑·PDF282")
#align(center)[#text(size:8pt,weight:"bold")[第7章　传输门和动态逻辑设计　　　　　　　　　　　　263]]
#line(length:100%,stroke:.55pt)

*例7.8（续）*

(b) 时钟馈通是由于时钟从低变到高。PMOS 管在预充之后处于线性区。馈通电容为：

#align(center)[$C_f=C_("GD")=(C_g W_p)/2=((2 "fF"/mu m)(16)(0.05 mu m))/2=0.8 "fF"$]

假设没有源漏共享，节点 $X$ 处的接地电容为：

#align(center)[$C_("gnd")=C_("eff")(16lambda+16lambda+8lambda)+C_g(8lambda+4lambda)=5 "fF"$]

馈通电压是：

#align(center)[$Delta V_x=(C_f Delta V_("clk"))/(C_f+C_("gnd"))=(0.8 "fF" times 1.2 "V")/(0.8 "fF"+5 "fF") approx 0.17 "V"$]

所以馈通引起的输出电压为 $1.2+0.17=1.37 "V"$。由于该值高于 $V_("DD")$，所以不存在问题。

(c) 最坏情况是晶体管发生导通以使输出下降，在题设中取 $A=1$、$B=C=0$。可以确定两个内部节点之间的中间节点电容：

#align(center)[$C_y=(1 "fF"/mu m)(16lambda)=0.8 "fF"$]

因此，最坏情况下的电荷共享可以这样得到：

#align(center)[$V^"*"=(C_x(1.2 "V"))/(C_x+C_y)=(5(1.2))/(0.8+5) approx 1.0 "V"$]

这个值在节点 $Y$ 是不可能的。这是因为 $V_("DD")-V_("TN")=0.73 "V"$。电荷的其余部分遗留在节点 $X$。剩下的电荷约为 $5 "fF"(1.2 "V")-0.8 "fF"(0.73 "V")=5.42 "fC"$，使节点 $X$ 处保持约 $1.08 "V"$ 的电压。

== 7.5.3　双轨（差分）多米诺逻辑

多米诺逻辑中一种常用的形式叫做双轨（dual-rail）或差分（differential）多米诺逻辑，也叫差分级联电压开关（DCVS）逻辑。标准多米诺结构只能够实现非反相功能，而双轨设计则克服了这个局限。

如图7.32所示，将产生一对互补的逻辑输出，而不是只有一个输出节点。在预充期间，时钟为低，输出对都由预充管拉至高电平，经过反相器的外部输出均为低。求值后只有一侧的动态节点下降，另一侧保持高电平，两者的外部输出也就互补。

#fig732()
#align(center)[*图7.32　双轨多米诺逻辑的结构*]