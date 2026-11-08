// SOURCE PDF PAGE 361 / printed 342. Example 10.2, source circuit and numerical parameters.
// Source figure marks PMOS W/L=0.8/0.2 µm, NMOS W/L=0.4/0.2 µm.
// Editorial formulas and circuit diagram remain non-certified for 1:1 layout.
#import "../figures/ch10-rc-elmore-native.typ": fig-example102
#set document(title:"第10章 · 例10.2短导线延迟：扇出、自身电容与导线电阻 · PDF361")
#set text(size:7.3pt)
#set par(justify:true,leading:2.5pt,spacing:4pt)
#align(center)[#text(size:8pt,weight:"bold")[342　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

π 模型是最常用的集总模型。

== 例 10.2　对短导线具有和没有电阻影响的延迟

*问题：* 下图中忽略导线电阻时经过第一个反相器的传输延迟是多少？假设所有反相器的大小相等。要包括所有的寄生电容。使用 0.18 μm 工艺参数。考虑连线电阻重新计算延迟。假设金属是 Al 并且导线的宽度是 0.2 μm。导线的电阻重要吗？

*参数：* $C_("eff")=1 " fF/µm"$，$C_("int")=0.2 " fF/µm"$，$C_g=2 " fF/µm"$。

#fig-example102()
#align(center)[#text(size:6.8pt)[图：20 μm 连线驱动 4 个反相器，末端另一条导线长 15 μm]]

*解答：*

扇出电容：反相器驱动 4 个相同的反相器。原图中 PMOS 的宽长为 0.8 μm/0.2 μm，NMOS 为 0.4 μm/0.2 μm。

$ C_("fanout") = 4 C_g (W_N+W_P) = 4(2 " fF/µm")(0.8 " µm"+0.4 " µm") = 9.6 " fF" $

本身电容：

$ C_("self") = C_("eff") (W_N+W_P) = (1 " fF/µm")(0.8 " µm"+0.4 " µm") = 1.2 " fF" $

导线电容：

$ C_("wire") = C_("int") L_("wire") = (0.2 " fF/µm")(20 " µm") = 4 " fF" $

总电容：

$ C_("load") = C_("fanout") + C_("self") + C_("wire") = 9.6+1.2+4 = 14.8 " fF" $

基于这个总电容，假设输入为斜坡，延迟为：

$ tau_("driver") = R_("eff") C_("load") = (12.5 " kΩ")(L/W)(14.8 " fF") $

$ = (12.5 " kΩ")(1/2)(14.8 " fF") = 6.25 " kΩ" times (14.8 " fF") = 92.5 " ps" $

为了能包含导线电阻，我们首先计算 20 μm 导线的电阻为：

$ R_("wire") = R_("sq") (L/W) = 54 " mΩ/□" times (20 " µm") / (0.2 " µm") approx 5.4 " Ω" $

其次，对该导线使用 π 模型：驱动器等效电阻 6.25 kΩ，近端包含 1.2 fF 本身电容与半条线的 2 fF，远端包含另外 2 fF 和 9.6 fF 栅负载。于是近端总电容为 3.2 fF，远端为 11.6 fF。延迟结果在下一页继续计算。
