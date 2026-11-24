// SOURCE PDF 293 / printed 274. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF293")
#align(center)[#text(size:8pt,weight:"bold")[274　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

== 8.1.1　存储器结构

大多数大型存储器采用图8.1所示的随机存取结构。所谓随机存取，是指读、写操作的存取速度不依赖存储单元在阵列中的物理位置。存储阵列（内核，core）由重复的单元电路组成。水平方向的行连接称为字线，垂直方向的数据连接称为位线。

#figure8(1)
#align(center)[*图8.1　存储器系统的结构（原生可编辑结构草图）*]

单元读写通过同时选择行、列完成。行地址译码器具有 $n$ 位输入、$2^n$ 条输出；列地址译码器由 $m$ 位输入选择列线。一个内核总共有 $2^n times 2^m$ 个存储单元，列多路器将选中的存储值送入数据寄存器。

例如，64 Kb随机存取存储器可以使用 $256 times 256=65536$ 个单元；需要16位地址信息以确定位置。实际的存储器可能一次选择4、8、16、32或64列以实现多个位并行传送。

尽管可以由触发器构造存储单元，但在大规模阵列中面积代价很大，因此常用更简单的1～6晶体管存储单元。其信号隔离、再生及输出驱动能力由外围电路恢复。
