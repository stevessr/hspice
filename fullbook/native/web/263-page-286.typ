// SOURCE PDF PAGE 286 / PRINTED267. Scan-backed editable exercise draft.
#import "../figures/ch7-exercises-ch8-native.typ": figP72, figP73
#set document(title:"第7章·习题P7.2及动态D锁存器P7.3·PDF286")
#align(center)[#text(size:8pt,weight:"bold")[第7章　传输门和动态逻辑设计　　　　　　　　　　　　267]]
#line(length:100%,stroke:.55pt)

*P7.2　传输门组合逻辑*

图 P7.2（a）至（d）给出串联、并联和复合传输门网络。依据第 7.8 节题目要求，分别建立真值表并识别输出可能出现的高阻态。

#figP72()
#align(center)[*图P7.2　四种传输门网络（原生图元草图，节点仍待逐管复查）*]

*P7.3　动态 D 锁存器*

(a) 对于图 P7.3（a）所示的动态 D 锁存器，假定 CLK 升高（$V_("DD")$）时输入为 $V_("DD")$，估计 $Q$ 和 $overline(Q)$ 的输出电压。假设 $W=200 "nm"$ 且 $V_("DD")=1.8 "V"$。然后，当 CLK 变低时重新计算该值。考虑时钟馈通效应。

#figP73()
#align(center)[*图P7.3（a）单管与图P7.3（b）CMOS 传输门 D 锁存器（结构重绘）*]