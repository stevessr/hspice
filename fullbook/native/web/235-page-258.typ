// SOURCE PDF PAGE 258 · PRINTED 239. Feedthrough equations 7.1–7.3.
#import "../figures/ch7-pass-transistor-native.typ": fig75, fig74
#set document(title:"第7章 · 电容馈通等式7.1—7.3、例7.1 · PDF258")
#align(center)[#text(size:8pt,weight:"bold")[第7章　传输门和动态逻辑设计　　　　　　　　　　　239]]
#line(length:100%,stroke:.55pt)
#v(8pt)
#fig75()
#align(center)[*图 7.5　电容馈通的动态电路效应*]

内部节点准确的电压变化可以在图 7.5 中的理想情况下进行确定。这两个电容的电荷在平衡时必须相同：

#align(center)[$C_f(V_1-V_2)=C_("gnd")V_2 quad "(7.1)"$]

因而，

#align(center)[$V_2=(C_f V_1)/(C_f+C_("gnd")) quad "(7.2)"$]

如果节点 1 的电压有一个突然的变化，在节点 2 则有一个相应的但是较小的变化：

#align(center)[$Delta V_2=(C_f Delta V_1)/(C_f+C_("gnd")) quad "(7.3)"$]

在图 7.5（a）中，当 $V_1$ 有一个较大的正向变化时，内部节点电压改变一个由 $C_f/(C_f+C_("gnd"))$ 的比例所确定的值。节点 2 的变化将是正向的。有时候这称做自举（bootstrapping）。图 7.5（b）中，考虑负方向的馈通信号。如果有一个电压信号从 $V_("DD")$ 下降到 0，这一变化导致节点 2 产生负的电压变化。除了时钟馈通会引起逻辑电平的误差外，时钟信号在一个逻辑门的内部节点变化时还可能将一个暂态电压耦合到节点。

为了减少馈通效应，控制输出结点和耦合电容的相对大小是至关重要的。必须使 $C_f$ 很小而 $C_("gnd")$ 很大。此外，必须确保输出能得到正确的逻辑电平。

#line(length:100%,stroke:.5pt)
*例 7.1　$V_T$ 下降与时钟馈通效应*

*问题：*

在下面的电路中，输入为 1.2 V。当时钟在 1.2 V 时输出的初始值是多少？时钟其后降为 0 时输出的最终值。当前输入为 0 V 时重复该问题。假设采用 0.13 μm 工艺且器件尺寸为 $4lambda/2lambda$。

#fig74()

*解答：*

最初，输出将比 1.2 V 低一个阈值电压。