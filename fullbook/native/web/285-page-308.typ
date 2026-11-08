// SOURCE PDF 308 / printed 289. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF308")
#align(center)[#text(size:8pt,weight:"bold")[289　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

#figure8(14)
#align(center)[*图8.14　地址转变探测电路（延迟链与异或结构重绘）*]

=== 8.4.2　列选择

位线预充后，列地址选择实际读写的列。列译码器和列多路器协同工作；如果有 $m$ 位列地址，一般从 $2^m$ 个列组中选择一个或多个。图8.15示意列译码器驱动若干CMOS传输门。

#figure8(15)
#align(center)[*图8.15　列译码与多路选择（可编辑图元）*]

每一个CMOS传输门需要一对互补使能信号；一次输出多个数据位时，一条列选择信号可以控制多个对应传输门。列译码器本身的负载较大，需要考虑信号极性、晶体管尺寸与互连。
