// SOURCE PDF PAGE 417 / printed 398; chapter 11 problem set.
// Editable source-check draft. Diagrams are topology sketches, strict 1:1 pending.
#import "../figures/ch11-exercises-native.typ": figP112,figP113,figP114,figP116,figP117
#set document(title:"第11章 · 习题与电路图 · PDF417")
#set text(lang:"zh",size:7.4pt)
#show par: set par(leading:2.1pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[398　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

*P11.4（续）*　Phi1 上升之间需要的最小延迟是多少？假设任何时钟之间最大的偏斜是 1 ns，并且通过锁存器的延迟是 0。解释你的答案。（提示：注意答案可以是正或负。）

#figP114()
#align(center)[#text(size:7.1pt)[图 P11.4　两相非交叠时钟、锁存器与组合路径]]

*P11.5*　在上面的问题中，假设用触发器代替锁存器，并使用单一时钟，请重新进行分析。

*P11.6*　在图 P11.6 所示的系统中用了两个边沿触发的触发器，找出最小的时钟周期。假设触发器的建立时间是 0.4 ns，clk-to-q 的延迟是 0.3 ns，保持时间是 0.1 ns。最坏情况下的时钟偏斜是 0.6 ns。组合逻辑（CL, combinational logic）块里的点线显示了沿着从输入到输出路径的最长延迟。标出关键路径，对于所计算的时钟周期标注哪个时钟偏斜是早的、哪个偏斜是晚的。（提示：考虑从一个触发器输出端到下一个触发器输入端的时间，并且考虑完成这个传递的所有时间组成部分。）

#figP116()
#align(center)[#text(size:7.1pt)[图 P11.6　带交叉关键路径的双触发器系统]]

*P11.7*　图 P11.7 所示的电路是用来设计去耦电容的，实际上也可用于选择适当的沟道长度。给电源节点加上 1.8 V 电压作为一个初始条件（这里不要用电压源），用 SPICE 模拟这个电路，绘制当反相器输出从低到高变化时电源节点的电压。在改变去耦电容的 $W$ 和 $L$、但保持去耦电容的栅面积为一个常数值的条件下生成一系列曲线。按照所得结果最优化的 $L$ 值是多少？假设使用 0.18 μm 工艺参数，将不得不使用一个非准静态的 SPICE 模型。