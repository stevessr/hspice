// SOURCE PDF 306 / printed 287. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF306")
#align(center)[#text(size:8pt,weight:"bold")[287　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

SRAM单元的实际版图尺寸及寄生电容必须与所选工艺规则和布线层相协调。

*例8.3　字线和位线电容的计算*

原书设定64K SRAM阵列，按 $256 times 256$ 个单元排列，采用图8.12的单元版图、存取器件尺寸和共享位线接触孔。字线负载包含512个存取管栅电容与256个单元所对应的连线电容；位线负载包含256个单元扩散结电容、布线电容及共享接触孔电容。原书示例结果约为509 fF的字线电容、230 fF的位线电容；尚需对题设几何单位进行二次核对。

## 8.4　SRAM列I/O电路

列输入/输出电路包含预充、列多路器、写驱动及读感测电路，需要与存储器时序、单元设计同步考虑。

### 8.4.1　列上拉电路

在读写开始前将位线上拉至接近供电高电平。图8.13说明三种可能的结构：(a) 受预充信号PC控制的动态上拉与均衡管；(b) 带静态上拉器件与均衡管的方案；(c) 使用NMOS增强型负载的方案。各结构产生不同的初始电压、静态功耗与感测输入条件。
