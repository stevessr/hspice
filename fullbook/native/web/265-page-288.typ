// SOURCE PDF PAGE 288 / PRINTED269. Scan-backed editable exercise draft.
#import "../figures/ch7-exercises-ch8-native.typ": figP77, figP78
#set document(title:"第7章·习题P7.7—P7.9逻辑强度与艾蒙延迟·PDF288")
#align(center)[#text(size:8pt,weight:"bold")[第7章　传输门和动态逻辑设计　　　　　　　　　　　　269]]
#line(length:100%,stroke:.55pt)

*P7.7（续）*

#figP77()
#align(center)[*图P7.7　传输门负载网络（可编辑拓扑草图）*]

*P7.8*　对于图 P7.8 所示的电路，假设传输门尺寸均为 $4lambda:2lambda$，驱动传输门的反相器中的 PMOS 管尺寸为 $8lambda:2lambda$，且 NMOS 管尺寸为 $4lambda:2lambda$。这里 $lambda=0.1 mu m$。输出反相器要驱动 $50 "fF"$ 的负载。输出反相器尺寸的大小是输入反相器的 $f$ 倍。

#figP78()
#align(center)[*图P7.8　双路 TG 数据选择器与输出负载*]

(a) 根据 $A$、$B$、$"sel"$ 和 $"selB"$ 写出输出功能的表达式。

(b) 画出从 $A$ 到 $C$ 的等效 RC 电路模型，假定 $"sel"$ 信号为高。写出每个电阻和电容的作用并在合适的节点给出总值。

(c) 从 $A$ 到 $C$ 的延迟表达式是什么？这里使用艾蒙延迟。

(d) 已知输出反相器尺寸是输入反相器的 $f$ 倍，写出通过它的延迟表达式，这里使用 RC 延迟。

(e) 确定输出反相器的最优化尺寸从而使从 $A$ 到 OUT 的总延迟最小。写出延迟的完整表达式，然后得出 $f$ 的最佳值，使产生的总延迟最小。

*P7.9*　图 P7.9 中电路的逻辑强度是多少（$W_P=8lambda$，$W_N=12lambda$）？考虑每种情况的下降变化。