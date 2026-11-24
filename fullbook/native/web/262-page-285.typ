// SOURCE PDF PAGE 285 / PRINTED266. Scan-backed editable draft, NOT 1:1.
#import "../figures/ch7-exercises-ch8-native.typ": chain
#set document(title:"第7章·7.6小结、参考文献和习题P7.1·PDF285")
#align(center)[#text(size:8pt,weight:"bold")[266　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 7.6　小结

电容性馈通和自举公式：

#align(center)[$Delta V_2=(C_f Delta V_1)/(C_f+C_("gnd"))$]

电荷共享公式：

#align(center)[$V^"*"=(C_1 V_1+C_2 V_2)/(C_1+C_2)$]

CMOS 传输门的大信号电阻：

#align(center)[$R_("on") approx V_("DS")/I_("DS")$]
#align(center)[$R_("TG") approx R_("eqn") (L/W)$]

== 7.7　参考文献

1. I. Sutherland, B. Sproull, and D. Harris, *Logical Effort: Designing Fast CMOS Circuits*, Morgan Kaufmann Publishers, San Francisco, CA, 1999.
2. J. Rabaey, A. Chandrakasan, and B. Nikolic, *Digital Integrated Circuits: A Designer Perspective*, Second Edition, Prentice-Hall, Upper Saddle River, NJ, 2003.
3. S. M. Kang and Y. Leblebici, *CMOS Digital Integrated Circuits, Analysis and Design*, Third Edition, McGraw-Hill, New York, NY, 2003.
4. H. Veendrick, *Deep-Submicron CMOS ICs*, Second Edition, Kluwer Academic Publishers, Boston, MA, 2000.
5. J. P. Uyemura, *CMOS Logic Circuit Design*, Kluwer Academic Publishers, Boston, MA, 1999.

== 7.8　习题

*P7.1*　计算图 P7.1 传输管电路中所有节点上的电压，考虑体效应。使用 $0.13 mu m$ 工艺参数。假设所有节点的初始电压为 $0 "V"$。

#chain()
#align(center)[*图P7.1　传输管网络（可编辑结构图草稿）*]

*P7.2*　对于图 P7.2 中的各个电路，给出描述其功能的真值表。（注意：在某些情况下，电路的输出可能是高阻态。）$overline(A)$ 代表 $A$ 的取反。