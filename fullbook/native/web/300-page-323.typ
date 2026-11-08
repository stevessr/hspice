// SOURCE PDF 323 / printed 304. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第9章·存储器设计中的其他课题·PDF323")
#align(center)[#text(size:8pt,weight:"bold")[304　数字集成电路分析与设计 · 第9章]]
#line(length:100%,stroke:.55pt)

读写存储器包括SRAM、DRAM，也包括利用内容匹配进行存取的特殊结构，如CAM，以及FIFO、移位寄存器等。非易失性存储器断电后仍能保存数据，包含掩膜ROM、EPROM、EEPROM和Flash等。

## 9.2　内容寻址存储器

第8章的SRAM通常通过已知地址读取数据。然而，在某些应用中已知的是一个二进制关键词，而不是保存该数据的物理地址。内容寻址存储器（CAM，content-addressable memory）存储标签（tag）并与输入关键词进行比较，匹配成功后找到对应数据。

#figure9(1)
#align(center)[*图9.1　内容寻址存储器的标签与数据关联（结构重绘）*]

CAM也称关联存储器（associative memory）。例如缓存系统中，可以使用标签匹配来定位需要的数据块；不必依靠数据在缓存中的固定物理顺序。CAM可由SRAM单元演化而来，但读出机制是并行比较，而非简单地用地址译码器选择一行。
