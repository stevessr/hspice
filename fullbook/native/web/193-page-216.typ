// ORIGINAL PDF216 / PRINTED197 · fig6.8 gate capacitances and source section6.3.2
#import "../figures/ch6-pass4-native.typ": cap-inverter-panel
#set document(title:"第6章·输入电容计算与自身电容·PDF216")
#align(center)[#text(size:8pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　　197]]
#line(length:100%,stroke:.55pt)
#cap-inverter-panel()
#align(center)[*图6.8　输入电容的计算*]

对于一个反相器，

#align(center)[$C_G = C_g W = 2 " fF/μm" times W_n + 2 " fF/μm" times W_p$]

#align(center)[$= 2 " fF/μm" (W_n + W_p)$]

如果要驱动 $n$ 个相同的门，且每个门都有一个相同的电容 $C_G$，那么总的扇出电容是：

#align(center)[$C_("fanout") = sum C_G = n times C_G = n times sum C_g W$]

如果有 $n$ 个不同的反相器，只须按如下方式将它们加起来：

#align(center)[$sum C_G = 2 " fF/μm" times (W_(p1) + W_(n1) + W_(p2) + W_(n2) + dots)$]

对于与非门、或非门，或者其他复杂门，可以利用被驱动晶体管的适当宽度简单地使用上面的公式：

#align(center)[$sum C_G = 2 " fF/μm" times (W_(p1) + W_(n1) + W_(p2) + W_(n2) + dots)$]

== 6.3.2　自身电容计算

自身电容是连接到输出 $V_("out")$ 的所有电容的和。我们通过考虑图6.9中的反相器来确定自身电容中包含的重要参数项。

对于每个晶体管有4个主要的电容：$C_("GS")$、$C_("GD")$、$C_("DB")$ 和 $C_("SB")$。可以快速将4个电容 $C_("GSn")$、$C_("GSp")$、$C_("SBn")$ 和 $C_("SBp")$ 排除在考虑之外，因为它们都没有连接到输出。如果现在分析一个任意方向的阶跃输入，则其中一个晶体管总是关闭着的，而另一个处于饱和区。因为对于 $t_("pHL")$ 或 $t_("pLH")$ 的计算包含一个到50%点的转换，所以可以假设晶体管处于关闭或者饱和状态。无论在哪一个区域，栅—漏电容 $C_("GD")$ 都是可以忽略的。将会只留下栅到漏的交叠电容，以及每个器件的一个结电容 $C_("DBn")$ 和 $C_("DBp")$。