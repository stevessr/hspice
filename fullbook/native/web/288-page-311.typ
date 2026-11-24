// SOURCE PDF 311 / printed 292. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第8章·半导体存储器设计·PDF311")
#align(center)[#text(size:8pt,weight:"bold")[292　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

图8.19给出了CMOS SRAM读电路的简化结构：位线首先经过列上拉电路预充，地址和时钟选择字线及列线；灵敏放大器检测BL与互补BL之间的微小差分电压，并驱动数据输出缓冲器。

#figure8(19)
#align(center)[*图8.19　基本读电路：预充、列选择与灵敏放大器*]

预充与感测电路必须配合。图8.20给出传统CMOS差分电压灵敏放大器示例。该放大器可以同时减小共模噪声对读取数据的影响，并提升读通路速度。原书特别指出，应采用与放大器输入偏置相匹配的列上拉结构，例如图8.13(c)的NMOS负载。

图8.20可以分成电流镜、差分输入对及尾电流偏置源等部分。工作点通常设计在适合放大器获得所需增益的饱和区，因此属于数字存储器设计中与模拟设计紧密联系的一部分。
