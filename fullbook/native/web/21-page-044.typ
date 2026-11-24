// SOURCE PDF PAGE 044 / printed page 25
// Scan proofread: original references 5–9 and problem statements P1.1–P1.7(a).
// Formula bars manually compared with the uploaded source scan; editorial draft, not 1:1 layout acceptance.
#set document(title: "第1章 · 参考文献 5–9 和习题 P1.1–P1.7 · PDF044")
#set text(lang: "zh")

= 第1章 · 印刷第25页
== 1.8　参考文献（续）

5. H. Chang et al., *Surviving the SOC Revolution*, Kluwer Academic Publishers, Boston, 1999.

6. D. D. Gajski, *Principles of Digital Design*, Prentice-Hall, New Jersey, 1997.

7. S. Edwards, *Languages for Digital Embedded Systems*, Kluwer Academic Publishers, Boston, 2000.

8. W. Wolf, *Modern VLSI Design: System-on-Chip*, 3rd ed., Prentice-Hall, New Jersey, 2002.

9. ITRS 2001 documents, http://public.itrs.net.

== 1.9　习题

*P1.1*　简化下面的函数，并将其表示为（a）积之和形式；（b）和之积形式：

（i）
$ F = C B overline(A) + C overline(B) A + overline(C) B A + C B A $

（ii）
$ F = D C overline(A) + overline(D) C A + D overline(C) overline(A) + overline(D) overline(C) A $

*P1.2*　用 3 个开关 $A$、$B$ 和 $C$ 控制长廊上的一盏灯。如果开关向上，其逻辑值是 1。如果向上的开关数是奇数，灯就亮；如果向上的开关数是偶数，灯就灭。用 $A$、$B$ 和 $C$ 设计逻辑电路 $F$（灯亮时 $F=1$）。（a）全部是 NAND 门的电路；（b）全部是 NOR 门的电路。

*P1.3*　仅仅使用 NAND、NOR 和 INV，实现下面的函数：

（a）$ F = A B + B C $

（b）$ F = A xor B xor C $

*P1.4*　一个半加器具有如下的真值表：

*表 P1.4*

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  table.header([*$A$*], [*$B$*], [*和*], [*进位*]),
  [0], [0], [0], [0],
  [0], [1], [1], [0],
  [1], [0], [1], [0],
  [1], [1], [0], [1],
)

（a）利用卡诺图（K-Map）方法，将这张表转换成两个布尔表达式，一个是和（Sum）的表达式，一个是进位（Carry）表达式。

（b）绘出与（a）中表达式相对应的门级电路图。

*P1.5*　设计“全加器”的真值表，重复习题 P1.4 的（a）和（b）。

*P1.6*　运用摩根定律，求出下列函数的反函数表达式：

（a）
$ F = overline(A) overline(B) C + overline(A) B overline(C) + A B overline(C) $

（b）
$ F = A B C + overline(A) overline(B) C $

*P1.7*　一个反相器有 2 ns 的标准延迟。

（a）如果有 5 个相同的反相器以图 P1.7（a）中所示的方式级联，那么，从 $a$ 到 $b$ 的延迟是多少？

#text(size: 7pt, fill: gray)[已恢复本页参考文献与全部题目，P1.1/P1.6 反相横线采用可编辑 Typst 数学语法；P1.7 其余小题续于 PDF045。此处保留原书题目，不混入配套答案。1:1 版式仍待验收。]
