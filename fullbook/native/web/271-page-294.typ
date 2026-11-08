// SOURCE PDF 294 / printed 275. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF294")
#align(center)[#text(size:8pt,weight:"bold")[275　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

#figure8(2)
#align(center)[*图8.2　存储器设计的总体结构（可编辑结构图）*]

== 8.1.2　存储器类型

读写随机存取存储器可以用触发器型电路保存信息，也可以用电容上存储的电荷表示信息。电源断开后数据消失，因此属于易失性存储器。尽管严格说读写存储器也称RWM，实际更常使用RAM这一缩写。

*静态RAM（SRAM）* 使用双稳态电路，只要有电源即可保持信息，不需要周期性刷新。*动态RAM（DRAM）* 通过电容电荷保存位值，必须考虑泄漏、噪声和刷新。原书给出典型周期范围，SRAM约5～50 ns，DRAM约50～200 ns；这些是原教材中的技术背景数值。

*只读存储器（ROM）* 通常由制造时确定的行列连接决定数据。掩膜ROM在制造过程中编程；其数据即使失去电源仍可保存。
