// SOURCE PDF PAGE 291 / PRINTED272. Scan-backed editable exercise draft.
#import "../figures/ch7-exercises-ch8-native.typ": figP714, figP715
#set document(title:"第7章·习题P7.14/P7.15插图与自举MOS反相器·PDF291")
#align(center)[#text(size:8pt,weight:"bold")[272　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

*图 P7.14*　两种用作简单锁存器的时钟控制 CMOS 门：两种排列有不同的 PMOS/NMOS 时钟控制顺序，在输入 IN、使能 EN 及其反相控制下，判断能否保持节点电平。

#figP714()
#align(center)[*图P7.14　两种时钟控制 CMOS 锁存器候选电路*]

*图 P7.15*　自举反相器采用线性增强型负载 $M_2$。器件 $M_3$ 为节点 $X$ 提供充电，耦合电容 $C_b$ 使输出上升时节点 $X$ 的栅驱动提高。输出有负载电容 $C_("out")$，节点 $X$ 有接地电容 $C_X$。

#figP715()
#align(center)[*图P7.15　自举反相器与节点X、耦合电容（可编辑结构重绘）*]

这页保留两张原习题图的编号与设计目标。图中 MOS 栅、源、漏和体端的精确连接仍需对原扫描逐管复核，不能将本页标记为 1:1 已验收。