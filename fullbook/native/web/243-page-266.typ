// SOURCE PDF PAGE 266 · PRINTED 247. Eq: switch RC model.
#import "../figures/ch7-transmission-mux-native.typ": fig714, fig715
#set document(title:"第7章 · 图7.14传输门组合与7.3.2 RC延迟 · PDF266")
#align(center)[#text(size:8pt,weight:"bold")[第7章　传输门和动态逻辑设计　　　　　　　　　　　247]]
#line(length:100%,stroke:.55pt)

况下，两个输入所做的是与非操作。一个输入是 $overline(A)overline(C)$，另一个输入是 $AB+A overline(B)C$。其结果功能 $F$ 是这两项的与非，如图中所示。

#fig714()
#align(center)[*图 7.14　传输门和标准门的组合*]

*练习 7.1*　描述图 7.14 中异或门的操作。讨论它相对于目前本书中讨论过的其他异或门的优点和缺点。

== 7.3.2　CMOS 传输门延迟

为了评价含有传输门的电路的时序性能，必须建立这些门的 RC 模型。CMOS 传输门（TG, transfer gate）的模型由一个导通电阻 $R_("TG")$ 与两个电容 $C_1$ 和 $C_2$ 组成，如图 7.15 所示。传输门的导通电阻是由 NMOS 器件和 PMOS 器件的导通电阻并联而成。电阻值取决于正在传输的是 0 还是 1。最终的 RC 模型必须和传输门的驱动以及负载的 RC 模型组合起来。这里必须注意的是传输门本身没有任何驱动能力，其任务是在门的控制下从输入到输出传输信号。在所有使用传输门的电路中，必须在输入处连接某种类型的门作为驱动器。

#fig715()
#align(center)[*图 7.15　CMOS 传输门的 RC 模型*]

对于导通电阻的详细分析可以通过参考前面图 7.8 中所示的两种情况来进行。大信号电阻可以用下面的公式计算：

#align(center)[$R_("on") approx V_("DS")/I_("DS")$]

如果返回到图 7.8（a）中，输入为 0 V，输出经历一个从 $V_("DD")$ 到 0 V 的变化。NMOS 器件开始处于饱和状态，当输出电压下降到 0 时转换到线性区。在饱和区时，导通电阻为：