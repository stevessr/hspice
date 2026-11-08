// SOURCE PDF PAGE 258 / printed 239. Source original Eq7.1-7.3, Example7.1.
#import "../figures/ch7-pass-transistor-native.typ": fig75, feedthrough-panel
#set document(title:"第7章·时钟馈通电容分压公式与例7.1 · PDF258")
#align(center)[#text(size:8pt,weight:"bold")[第7章　传输门和动态逻辑设计　　　　　　　　　　　239]]
#line(length:100%,stroke:.55pt)

#fig75()
#align(center)[*图7.5　电容馈通的动态电路效应*]

内部节点准确的电压变化可在图7.5中的理想情况下进行确定。这两个电容的电荷在平衡时必须相同：

#align(center)[$C_f(V_1-V_2)=C_("gnd") V_2 quad "(7.1)"$]

因此，

#align(center)[$V_2=(C_f V_1)/(C_f+C_("gnd")) quad "(7.2)"$]

如果节点1的电压有一个突然的变化，在节点2则有一个相应的但是较小的变化：

#align(center)[$Delta V_2=(C_f Delta V_1)/(C_f+C_("gnd")) quad "(7.3)"$]

在图7.5（a）中，当 $V_1$ 有一个较大的正向变化时，内部节点电压将改变一个由 $C_f$ 与 $C_f+C_("gnd")$ 的比值所确定的量。节点2的变化将是正向的。有时候这称做自举（bootstrapping）。图7.5（b）中，在节点1处有一个负向的阶跃并引起节点2处一个相应的负向阶跃。考虑馈通的两个极端情况。如果 $C_f$ 比 $C_("gnd")$ 大得多，那么 $Delta V_2$ 接近 $Delta V_1$。另一方面，如果 $C_("gnd")$ 比 $C_f$ 大得多，则 $Delta V_2$ 接近于0。对于传输管，$C_f$ 的值由 $C_("GS")$ 决定而 $C_("gnd")$ 由节点电容 $C_("SB")$ 加上下一个门的负载电容决定。为了减少馈通效应，我们要确保 $C_("gnd") >> C_f$。

#line(length:100%,stroke:.55pt)
*例7.1　$V_T$ 下降与时钟馈通效应*

*问题：*

在下面的电路中，输入为1.2 V，当时钟在1.2 V时输出的初始值是多少？估计时钟降低后输出的最终值。当输入为0 V时重复该问题。假设采用0.13 μm工艺且器件尺寸为 $4lambda/2lambda$。

#feedthrough-panel()

*解答：*

最初，输出将比1.2 V低一个阈值电压：