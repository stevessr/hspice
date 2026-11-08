// SOURCE PDF 320 / printed 301. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第8章·半导体存储器设计·PDF320")
#align(center)[#text(size:8pt,weight:"bold")[301　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

*设计题1（续）*

题设要求对256条字线的译码器进行逻辑强度优化。地址输入允许的最大栅电容约为5 fF，目标是在考虑输出字线电容以及互连电容时，尽量缩短地址有效到字线升高的延迟。

(a) 计算字线总负载，包括SRAM存取晶体管栅电容和金属2字线电容。

(b) 估计整个译码路径的逻辑强度、分支强度与路径强度，从而确定合理级数。

(c) 比较采用两级预译码与四级逻辑结构的设计，分析哪种具有较小延迟。

(d) 选择逻辑结构和晶体管尺寸，并把门的寄生延迟考虑在FO4估计中。

(e) 计入预译码输出节点的旁路布线电容，重新计算尺寸。

(f) 将手工延迟与SPICE仿真结果比较。

#figure8(4)
#align(center)[*图D8.2　译码器结构、分支和连线负载（功能框图）*]

原习题中的多组数值与图上晶体管尺寸，仍需与源扫描逐项比对。
