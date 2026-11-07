// SOURCE PDF PAGE 024 / printed page 5
// Editable editorial excerpt: not complete verbatim transcription.
#set document(title:"第1章：DSM与数字逻辑门")
= 第1章 · 印刷第5页
== 1.2 工艺发展（续）
原书表 1.1 对比深亚微米设计涉及的若干关键现象与早期技术条件，包括布线、功耗和器件行为的变化。表中逐行措辞和数据仍须对照高分辨率扫描原件复核。

== 1.3 数字逻辑门设计的回顾
=== 1.3.1 基本的逻辑函数
数字逻辑函数可以采用布尔代数、真值表和逻辑门符号三种互补的方式表达。图 1.3 包含反相器 INV、与非门 NAND 及或非门 NOR 的示例。

#table(
 columns:(1fr,1.2fr,1.2fr),
 table.header([输入], [INV 输出], [说明]),
 [0],[1],[逻辑取反],
 [1],[0],[逻辑取反],
)
#table(
 columns:(1fr,1fr,1fr,1fr),
 table.header([A],[B],[NAND],[NOR]),
 [0],[0],[1],[1],
 [0],[1],[1],[0],
 [1],[0],[1],[0],
 [1],[1],[0],[0],
)

$ F_("NAND") = overline(A B) $
$ F_("NOR") = overline(A+B) $

_逻辑符号与线宽为课程重绘目标；此文件并非原扫描完整页的复制。_
