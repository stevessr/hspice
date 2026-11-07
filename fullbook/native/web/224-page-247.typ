// SOURCE PDF PAGE 247 / PRINTED228. Source equations and conclusion.
#import "../figures/ch6-branch-exercises-native.typ": fig-example616
#set document(title:"第6章 · 旁路负载尺寸优化与6.7小结 · PDF247")
#align(center)[#text(size:8pt,weight:"bold")[228　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.5pt)

后两级：

#align(center)[$D_2 = "LE"_("inv") ((A+y)/x+gamma_("inv")) + "LE"_("inv") (B/y+gamma_("inv"))$]

#align(center)[$(partial D_2)/(partial y) = 1/x - B/y^2=0 arrow y/x=B/y$]

可以用这两个方程式迭代解答：

#align(center)[$y^2=B x arrow y=sqrt(B x)=sqrt(64(4))=16$]
#align(center)[$x^2=(A+y)w arrow x=sqrt((A+y)w)=4.9$]
#align(center)[$y=17.7 quad x=5.1$]
#align(center)[$y approx 18 quad x approx 5$]

使用这个迭代方程求解是复杂且易于出错的。推荐的另一种方法要简单得多，而且可以得到一个合理的解答。首先，不考虑旁路负载，用逻辑强度解决尺寸问题。下一步，加入旁路负载和下一个门的负载。然后，去掉下游的门，再次用逻辑强度解决剩下的电路并得到它们的尺寸。

#align(center)[*图示：无旁路负载的解答；加入旁路负载后的解答；合并两个解答*]
#fig-example616()

得到的结果和精确的解答稍有不同，但是产生了一个近似的延迟。更重要的是，对于进行手工运算，使用这种方法要比迭代的方法容易得多。

#line(length:100%,stroke:.5pt)
值得注意的是，逻辑强度对于使用简单的计算来优化时序是一个有用的工具。逻辑强度使设计者可以快速地决定一条给定路径的最佳延迟，以及达到这个延迟相应的器件尺寸。这使我们对于造成逻辑路径延迟的关键因素有了深入的理解。还有关于逻辑强度的许多其他方面的内容没有涵盖在本章中，鼓励读者借助参考文献进一步学习。这里介绍的概念将会应用于后面的各章中。

== 6.7　小结

传播延迟：

#align(center)[$t_p=(t_("pLH")+t_("pHL"))/2$]