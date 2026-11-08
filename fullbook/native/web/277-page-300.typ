// SOURCE PDF 300 / printed 281. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF300")
#align(center)[#text(size:8pt,weight:"bold")[281　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

交叉耦合反相器的电压传输特性（VTC）决定存储单元的静态稳定状态。读操作时内部节点不应越过翻转阈值；写操作则必须强制相关内部节点跨过阈值，使正反馈将电路再生到新状态。

CMOS工艺中通常使用六管（6T）SRAM：两个PMOS上拉晶体管、两个NMOS下拉晶体管和两个NMOS存取晶体管。为了存放大量单元，必须优化面积、泄漏功耗和噪声容限。教材还比较了使用高电阻负载代替上拉器件的4T结构及其工艺代价。

#figure8(8)
#align(center)[*图8.8　六晶体管SRAM单元（交叉耦合结构图）*]

在阵列中，字线沿行方向布设，位线沿列方向布设。当某条字线被激活时，其行内所有存取器件导通；列译码和多路选择结构再决定真正读出或写入哪一列。

字线负载主要来自单元的两个存取管栅电容与行连线电容。原书式（8.1）表示：单元数增加时总字线电容随之增加。
