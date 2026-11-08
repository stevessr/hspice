// SOURCE PDF 295 / printed 276. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF295")
#align(center)[#text(size:8pt,weight:"bold")[276　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

*可编程只读存储器（PROM）* 可以在制造完成后通过电编程改变原始连接，熔断型PROM一经编程通常无法恢复。*EPROM* 可以电编程、通过紫外光擦除；*EEPROM* 可以使用电信号进行写入和擦除。各种非易失性技术在擦除的范围、单元结构、写入速度和所需工艺方面有所区别。

*Flash存储器* 支持以块为单位擦除。教材提及热电子注入与Fowler–Nordheim隧穿机制。*FRAM* 使用铁电材料剩余极化保存数据，也属于非易失性存储器。

## 8.1.3　存储器时间参数

图8.3描述随机存取存储器的读写时序。地址输入、数据输入和读写控制决定操作；读访问时间从地址有效到对应数据出现在输出端为止。存储周期时间是连续执行访问操作所需要的最短间隔。不同存储器的读写最小时间可能不相同。

教材说明，半导体读写存储器的读访问时间典型地占周期时间约50%～80%。写数据建立时间也必须在时序分析中单独考虑。
