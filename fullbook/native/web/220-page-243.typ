// SOURCE PDF PAGE 243, printed 224. Ex6.13 source math and path structure.
#import "../figures/ch6-logical-effort-native.typ": fig613path
#set document(title:"第6章 · 例6.13逻辑强度路径优化 · PDF243")
#align(center)[#text(size:8pt,weight:"bold")[224　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.5pt)

#line(length:100%,stroke:.5pt)
*例6.13　用逻辑强度优化路径*

*问题：*

对于给定的逻辑电路，确定最佳的级强度、总的延迟和门的尺寸。使用原理图中的归一化输入和输出电容，计算归一化的延迟和门的尺寸。

#fig613path()

*解答：*

首先，计算总的路径强度：

#align(center)[$"总的路径强度" = product("LE" times "FO")$]

#align(center)[$=1 (X/10) times 5/3 (Y/X) times 4/3 (Z/Y) times 1 (20/Z)$]

#align(center)[$=(20/9) times (20/10)=400/90$]

在这个例子中，顺序地通过每一级门并计算其LE×FO。然后，可以通过将这些值相乘来获得总路径强度。另一种获得相同答案的方法是把所有的LE乘起来（得到20/9），再把所有的FO乘起来（得到20/10），最后把这两个值相乘（得到400/90）。这种方法只适用于没有分支的单一路径的情况。

下一步，通过计算上面结果的几何平均值算出最优的级强度 $"SE"^*$：

#align(center)[$"SE"^* = "最优的级强度" = (400/90)^(1/4) approx 1.45$]

计算路径强度的四次方根是因为在这个例子中有四级逻辑门。这是要给该路径中的所有门赋予的最优的级强度。总路径延迟可以计算如下：

#align(center)[$D = 4("SE"^*) + 2P_("inv")+P_("nor")+P_("nand")$]

#align(center)[$=4(1.45)+1.0+1.5+1.0=9.3$]

注意，最佳级强度（也即最佳的解答）是完全由输入和输出电容、所分析路径中逻辑门的数量和类型决定的。总路径延迟的最佳值是在门的尺寸确定前就已知的。

实际的尺寸可以通过从输出到输入反向计算得到。利用如下事实，对每一个门有：

#align(center)[$"SE"^* = "LE" times "FO"="LE" (C_("out")/C_("in"))$]

#align(center)[$therefore C_("in") = "LE" (C_("out")/"SE"^*)$]

因此，从输出到输入反向计算：

#align(center)[$Z=(1)(20)/(1.45)=13.8$]

#align(center)[$Y=(4/3) times Z/(1.45)=12.7$]