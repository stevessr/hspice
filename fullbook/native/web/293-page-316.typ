// SOURCE PDF 316 / printed 297. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第8章·半导体存储器设计·PDF316")
#align(center)[#text(size:8pt,weight:"bold")[297　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

== 8.5　存储器体系结构

图8.25显示SRAM存储器的整体规划：存储器阵列构成最大区域，预充通常位于阵列上方，行译码靠近侧边，列多路器与I/O电路位于阵列下方。预译码与最终译码共同驱动穿过单元阵列的字线，列选择再连接感测放大器及写驱动。

#figure8(25)
#align(center)[*图8.25　基本的存储器结构（可编辑平面规划草图）*]

行线常由多晶硅及辅助金属线组成，分布RC带来延迟；位线虽可使用电阻较低的金属，但因连接大量存取晶体管，电容仍然很大。大型字线和位线不仅减慢访问，还会增加动态功耗。

为了减少负载与延迟，可以对阵列进行分块。教材以64K SRAM为例说明划分字线（DWL）：将部分行地址用来产生不直接驱动全部单元的全局字线，其他行地址在局部块中进行译码并驱动较短的局部字线。

图8.26展示四个局部区域的字线分割思路。在示例中，局部字线上的单元负载近似降为原来的四分之一。
