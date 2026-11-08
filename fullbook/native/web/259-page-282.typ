// SOURCE PDF PAGE 282 / PRINTED263; worked Example7.8 source numbers.
#import "../figures/ch7-domino-keeper-pass10.typ": fig732
#set document(title:"第7章·例7.8计算和7.5.3双轨多米诺·PDF282")
#align(center)[#text(size:8pt,weight:"bold")[第7章　传输门和动态逻辑设计　　　　　　　　　　　　263]]
#line(length:100%,stroke:.55pt)

（b）时钟馈通是由于时钟从低变到高。PMOS管在预充之后处于线性区。馈通电容为：

#align(center)[$C_f=C_("GD")=(C_g W_p)/2=((2 " fF/μm")(16)(0.05 " μm"))/2=0.8 " fF"$]

假设没有源/漏共享，节点X处的接地电容为：

#align(center)[$C_("gnd")=C_("eff")(16lambda+16lambda+8lambda)+C_g(8lambda+4lambda)$]

#align(center)[$=(1 " fF/μm")(40)(0.05 " μm")+(2 " fF/μm")(12)(0.05 " μm")=5 " fF"$]

馈通电压是：

#align(center)[$Delta V_x=(C_f Delta V_("clk"))/(C_f+C_("gnd"))=((0.8 " fF")(1.2 " V"))/(0.8 " fF"+5 " fF")=0.17 " V"$]

所以馈通引起的输出电压为$1.2+0.17=1.37 " V"$。因为该值高于$V_("DD")$，所以不存在问题。

（c）最坏情况下的电荷共享发生在假设输出处于1.2 V，$A=1$、$B=C=0$时。我们已经确定了$C_X=5 " fF"$。晶体管A和B之间的中间节点的电容为：

#align(center)[$C_Y=(1 " fF/μm")(16lambda)=16(0.05)=0.8 " fF"$]

因此，最坏情况下的电荷共享可以这样得出：

#align(center)[$V^*=(C_X(1.2 " V"))/(C_X+C_Y)=(5(1.2 " V"))/(0.8+5)=1.0 " V"$]

这个值在节点Y是不可能的。设$V_Y=V_("DD")-V_("TN")=0.73 " V"$。电荷的其余部分遗留在节点X。剩下的电荷为$(5 " fF")(1.2 " V")-(0.8 " fF")(0.73 " V")=5.42 " fC"$。这在节点X处转化为$1.08 " V"$的电压。

== 7.5.3　双轨（差分）多米诺逻辑

多米诺逻辑中一种常用的形式叫做双轨（dual-rail）或差分（differential）多米诺逻辑，也叫做差分级联电压开关（DCVS，differential cascode voltage switch）逻辑。因为标准的多米诺结构只能实现非反相的逻辑功能，所以许多微处理器设计者采用双轨方法以克服这个局限。其基本结构如图7.32所示，将产生一对互补的逻辑输出，而不是只有一个输出节点。这里有两个预充晶体管，当CLK为低时强制输出也可以为低。当CLK变高时，OUT或$\overline("OUT")$将变高，这分别取决于逻辑块F和$\overline(F)$。当然，两个输出在求值阶段都不能变高。

#fig732()
#align(center)[*图7.32　双轨多米诺逻辑的结构*]