// SOURCE PDF PAGE 267 · PRINTED 248. Voltage-dependent Ron.
#import "../figures/ch7-transmission-mux-native.typ": fig716
#set document(title:"第7章 · 传输门NMOS/PMOS分段导通电阻 · PDF267")
#align(center)[#text(size:8pt,weight:"bold")[248　　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#align(center)[$R_N=V_("out")/I_("Dsat,n")$]

当该器件变化到线性区时，导通电阻为：

#align(center)[$R_N=V_("out")/I_("Dlin,n")$]

PMOS 器件是偏置在饱和区的，直到输出达到 $abs(V_("Tp"))$ 为止。在这一点上，它进入截止区且其阻值增加到无穷大。在饱和区，电阻值为：

#align(center)[$R_P=V_("out")/I_("Dsat,p")$]

单位尺寸的 NMOS 器件和 PMOS 器件的导通电阻，及其并联的等效电阻在图 7.16（a）中给出。注意，PMOS 器件的电阻在输出电压从 $V_("DD")$ 变化到 $abs(V_("Tp"))$ 的时候发生了显著增长，而 NMOS 器件的电阻在同样的范围内线性下降。然而，这两个电阻的并联等效电阻却相对稳定的。用一个基于传输期间平均值的常量来模拟这个电阻十分方便。

#fig716()
#align(center)[*图 7.16　上升和下降情况下的 NMOS 和 PMOS 导通电阻*]

对图 7.8（b）中的第二种情况可以进行同样的分析，这里输入是 $V_("DD")$，输出从 0 V 转变到 $V_("DD")$。PMOS 器件开始时在饱和区，当输出电压上升到 $V_("DD")$ 的时候转换到线性区。在饱和区时，导通电阻是：

#align(center)[$R_P=(V_("DD")-V_("out"))/I_("Dsat,p")$]

当该器件转换到线性区，导通电阻是：

#align(center)[$R_P=(V_("DD")-V_("out"))/I_("Dlin,p")$]

NMOS 器件保持在饱和区，直到输出达到 $V_("DD")-V_("Tn")$ 为止。在这一点上，它进入截止区且电阻增加至无穷大。在饱和区，电阻为：

#align(center)[$R_N=(V_("DD")-V_("out"))/I_("Dsat,n")$]

第二种情况中单位尺寸的 NMOS 和 PMOS 器件的导通电阻及其并联的等效电阻如图 7.16（b）所示。这里，当输出电压接近 $V_("DD")-V_("Tn")$ 时 NMOS 器件的电阻增加到无穷大，而 PMOS 器件的电阻在同样的范围内线性减小。