// ORIGINAL PDF217 / PRINTED198 · complete scan-grounded Miller derivation.
#import "../figures/ch6-pass4-native.typ": cap-inverter-panel, miller-panel
#set document(title:"第6章·自身电容的计算与米勒效应·PDF217")
#align(center)[#text(size:8pt,weight:"bold")[198　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#cap-inverter-panel()
#align(center)[*图6.9　输出电容的计算*]

因为交叠电容是从输入连接到输出的，所以必须以一种特殊的方式进行处理。当输入从0转变到 $V_("DD")$ 时，输出从 $V_("DD")$ 转变到0。其结果是交叠电容经历了一个 $2V_("DD")$ 的电压摆幅。可以通过假设幅度为 $V_("DD")$ 然后使电容的值加倍来对其进行模拟。这个对电容值加倍的过程一般称做米勒效应（Miller Effect）建模，如图6.10所示。这意味着输出必须给交叠电容提供两倍的电荷以解决输入和输出在相反的方向变化相同数量的事实。

#miller-panel()
#align(center)[*图6.10　使用米勒效应处理交叠电容*]

现在，可以计算反相器总的自身电容，也就是结电容和由于边缘和侧面扩散引起的交叠电容（包括了米勒效应）的简单相加：

#align(center)[$C_("self") = C_("DBn") + C_("DBp") + 2C_("OL") + 2C_("OL")$]
#align(center)[$= C_("jn")W_n + C_("jp")W_p + 2C_("ol")(W_n + W_p) quad "(6.10)"$]
#align(center)[$= C_("eff")(W_n + W_p)$]

这里，我们将自身电容与单位宽度有效电容 $C_("eff")$ 联系起来。为了简化计算，把 $C_("jn")$ 和 $C_("jp")$ 合并成一个参数项。如同第2章介绍的，结电容依赖于掺杂水平、结的类型、电压变化和源区与漏区的面积。然而，为了进行手工计算而将其进行合并是比较方便的。对于0.13 μm工艺，这两个结的平均结电容大约为 $0.5 " fF/μm"$。交叠电容大约为 $0.25 " fF/μm"$，因此，