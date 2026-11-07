// SOURCE PDF PAGE 246 / PRINTED 227. Source example 6.15 & 6.16.
#import "../figures/ch6-branch-exercises-native.typ": fig-example616
#set document(title:"第6章 · 分支与旁路负载的延迟计算 · PDF246")
#align(center)[#text(size:8pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　　227]]
#line(length:100%,stroke:.5pt)

延迟：

#align(center)[$D=N("SE"^*)+"寄生参数"$]
#align(center)[$D=(3)(4)+(3)(1)=15$]

#align(center)[*例6.15：NAND门分支结构，节点x、y、z及旁路4.5的原生电路示意*]

反向计算门的尺寸：

#align(center)[$z=(1)(4.5)(4/3)/4=1.5$]
#align(center)[$y=(3)(1.5)(4/3)/4=1.5$]
#align(center)[$x=(2)(1.5)(4/3)/4=1$]

#line(length:100%,stroke:.5pt)

在所关注的路径中有一个已知的固定负载的时候，出现了另一个问题。在这里不能使用分支强度的概念，原因是分支强度应该只用在其他扇出大小与所关注的路径是按比例变化的情况下。因而不能处理一个节点具有某个固定电容值的情况。我们把这些电容称为旁路负载。这种方法可以通过一个例子很好地加以说明。

#line(length:100%,stroke:.5pt)

*例6.16　有旁路负载的延迟计算*

*问题：* 计算下面逻辑门电路 $w$、$x$ 和 $y$ 的尺寸，以使延迟最小。假设 $A=8$，$B=64$。这里，$A$ 应该视做旁路负载。

#fig-example616()

*解答：* 如果去掉旁路负载并使用FO4尺寸规则，可以设定反相器的尺寸为 $w=1$、$x=4$ 和 $y=16$。这满足相连的各级电路的几何关系，并可以得到最小的延迟。

如果现在加入旁路负载，会得出下面的延迟公式：

#align(center)[$"前两级" : D_1 = "LE"_("inv") (x/w+gamma_("inv"))+"LE"_("inv") ((A+y)/x+gamma_("inv"))$]

#align(center)[$(partial D_1)/(partial x) = 1/w-(A+y)/x^2=0 arrow x/w=(A+y)/x$]