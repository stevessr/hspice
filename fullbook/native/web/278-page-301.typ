// SOURCE PDF 301 / printed 282. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF301")
#align(center)[#text(size:8pt,weight:"bold")[282　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

#figure8(9)
#align(center)[*图8.9　字线与差分位线构成的SRAM阵列（原生结构图）*]

位线也具有很大的总电容，来源包括多个单元的漏/源结电容、连线电容以及接触孔电容。相邻单元可以共享接触孔，以减少面积和电容。原书式（8.2）将每个单元的寄生电容与阵列列长度相乘。

写操作时，若要保存0，相关位线被拉低；若要保存1，则使另一条互补位线拉低。存储节点电压必须跨过对应反相器的翻转阈值，随后再生到另一稳定状态。

单元晶体管需要兼顾读稳定性、可写性、适当的单元放电电流、低面积和软错误免疫能力。由于单元电路对称，只需对一组代表性的上拉、下拉和存取晶体管指定尺寸。

=== 8.3.2　读操作

图8.10分析6T单元的读取过程。预充后的差分位线中，存储0的一侧通过存取管和下拉管产生放电电流；存储1的一侧保持高电平，两个位线形成微小差分电压供灵敏放大器检测。
