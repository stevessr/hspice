// SOURCE PDF 309 / printed 290. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第8章·半导体存储器设计·PDF309")
#align(center)[#text(size:8pt,weight:"bold")[290　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

图8.16比较两种列译码与多路选择的结构。由于CMOS传输门需要互补控制信号，同时布设NMOS与PMOS的控制线可能产生布局问题。一个可行的方向是分别实现互补控制，再在需要的位置组合它们。

#figure8(16)
#align(center)[*图8.16　列选择结构（可编辑拓扑草图）*]

图8.17将列选择的逻辑拆成两级译码，从而减小某些译码门的扇入与电容负担。预译码策略也可以用于后续列I/O电路。

#figure8(17)
#align(center)[*图8.17　用于四位列地址的两级树状译码器*]

对两级或多级列选择树，需要同时分析信号通路上的传输门电阻、电容负载以及译码器的驱动能力。增加选择级数会降低单级译码扇入，却可能延长数据路径。
