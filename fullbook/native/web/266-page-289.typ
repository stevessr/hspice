// SOURCE PDF PAGE 289 / PRINTED270. Scan-backed editable exercise draft.
#import "../figures/ch7-exercises-ch8-native.typ": figP79, figP710
#set document(title:"第7章·习题P7.9–P7.11动态门尺寸与延迟·PDF289")
#align(center)[#text(size:8pt,weight:"bold")[270　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

*P7.9（续）*

#figP79()
#align(center)[*图P7.9　两种时钟控制的动态逻辑门*]

*P7.10*　图 P7.10 所示的电路，确定每个节点的电容并计算最小和最大延迟。（除非特别指定，所有晶体管都是最小尺寸，$L=2lambda$，$W=2lambda$。）

#figP710()
#align(center)[*图P7.10　复合传输门网络（可编辑结构图草稿）*]

*P7.11*　图 P7.11 所示的预充电路是一个 2 输入与门。画出节点 $F$、$X$ 和 $Y$ 随时间变化的波形图。可以假设上升和下降时间很短（也就是不需要加以计算），但是每一个阶段的最终值必须是正确的。只需要考虑画出的电容。所有器件都是最小尺寸。$F$ 和 $Y$ 的初值是未知的。使用 $0.13 mu m$ 参数。