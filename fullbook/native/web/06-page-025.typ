// SOURCE PDF PAGE 025 / printed page 6
// Editable editorial excerpt with independently inspectable mathematical syntax.
#set document(title:"第1章：布尔代数、XOR与MUX")
= 第1章 · 印刷第6页
== 1.3.1 基本的逻辑函数（续）
原书以和项之积、积项之和说明等价布尔表达式。对变量 $A,B,C,D$，教材给出的示例包含：

$ F = A C + B C + A D + B D $
$ F = (A+B)(C+D) $

异或函数仅在两个输入取值不同时输出逻辑 1：

$ F = A xor B = overline(A) B + A overline(B) $

二选一选择器根据选择信号 $S$ 决定输出。当 $S=0$ 时选择 $B$，当 $S=1$ 时选择 $A$：

$ F = A S + B overline(S) $

=== 德摩根定律（原书式1.1）
$ overline(A+B) = overline(A) dot overline(B) $
$ overline(A dot B) = overline(A) + overline(B) $

这两个式子说明，适当变更门级反相逻辑后，可以通过 NAND、NOR 网络实现多种组合函数。

=== 后续图示
原扫描在图 1.4 与图 1.5 中继续介绍缓冲器、三输入 NAND/NOR、异或/同或符号、二选一多路选择器以及上升沿触发 D 触发器。

_此页为公式与主题的原生 Typst 校对稿；未宣称原书整页文字和图形已复刻完成。_
