// SOURCE PDF PAGE 249 / PRINTED 230. Source bibliography and exercises.
#set document(title:"第6章 · 逻辑强度小结、参考文献与习题 · PDF249")
#align(center)[#text(size:8pt,weight:"bold")[230　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.5pt)

反相器、二输入与非门和二输入或非门的逻辑强度：

#align(center)[$"LE"_("inv")=tau_("inv")/tau_("inv")=1$]
#align(center)[$"LE"_("nand2")=tau_("nand2")/tau_("inv")=4/3$]
#align(center)[$"LE"_("nor2")=tau_("nor2")/tau_("inv")=5/3$]

路径强度：

#align(center)[$"总路径强度"=product_i ("LE"_i times "BE"_i times "FO"_i)=product_i ("LE"_i times "BE"_i) times (C_("load")/C_("in"))$]

最佳级强度：

#align(center)[$"SE"^* = ("路径强度")^(1/N)$]

用最佳级强度计算门尺寸：

#align(center)[$C_("in")="LE" times C_("out")/("SE"^*)$]

归一化的延迟：

#align(center)[$D=N("路径强度")^(1/N)+sum_i P_i$]

== 6.8　参考文献

1. I. Sutherland, B. Sproull, and D. Harris, *Logical Effort: Designing Fast CMOS Circuits*, Morgan Kaufman Publishers, San Francisco, CA, 1999.
2. D. Harris, *Skew-Tolerant Circuit Design*, Morgan Kaufman Publishers, San Francisco, CA, 2001.
3. J. Rabaey, A. Chandrakasan, and B. Nikolic, *Digital Integrated Circuits: A Designer Perspective*, Second Edition, Prentice-Hall, Upper Saddle River, NJ, 2003.
4. S. M. Kang and Y. Leblebici, *CMOS Digital Integrated Circuits, Analysis and Design*, Third Edition, McGraw-Hill, New York, NY, 2003.
5. H. Veendrick, *Deep-Submicron CMOS ICs*, Second Edition, Kluwer Academic Publishers, Boston, MA, 2000.
6. J. P. Uyemura, *CMOS Logic Circuit Design*, Kluwer Academic Publishers, Boston, MA, 1999.

== 6.9　习题

*P6.1*　画出一个单位尺寸NMOS器件的导通电阻关于 $V_("DS")$ 的函数关系曲线。使用0.13 μm工艺参数，并设 $V_("DD")=1.2 " V"$。这条曲线和12.5 kΩ的设计值相比较如何？用速度饱和模型得出一个 $V_("DD")$ 和 $V_("DD")/2$ 之间的平均电阻表达式。

*P6.2*　用0.13 μm工艺参数计算一个七级环振的振荡频率。反相器的尺寸对结果有什么影响吗？将所得的结果与SPICE的结果进行比较。

*P6.3*　在0.13 μm工艺参数下用SPICE求 $R_("eqn")$、$R_("eqp")$、$C_g$ 和 $C_("eff")$ 的值。将其与用于手工计算的值相比有何不同？