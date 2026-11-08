// SOURCE PDF 305 / printed 286. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF305")
#align(center)[#text(size:8pt,weight:"bold")[286　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

写操作开始前先把需要写成0的位线降低，可减少整次写入访问的延迟。存取管与单元上拉管构成类似伪NMOS的临时竞争结构。写驱动必须有足够下拉能力，压低内部节点，使正反馈迫使单元翻转。

式（8.4）给出由经验得到的写操作晶体管尺寸比例。式（8.3）、（8.4）只能作为初始估计，仍需根据单元面积、工艺变化、噪声、功耗和速度进行晶体管仿真。

*练习8.1*　计算图8.11所示单元中相关存取管与上拉管的尺寸比；假设目标内部节点电压明显低于反相器转换阈值。

=== 8.3.4　SRAM单元版图

图8.12展示对称式六管SRAM版图。单元可以像瓷砖一样在横向和纵向反复复制。利用多层金属与多晶硅连接器件：位线通常沿垂直方向，字线沿水平方向。相邻单元通过镜像排布共享接触孔，降低面积与电容。

#figure8(12)
#align(center)[*图8.12　SRAM单元版图（可编辑分层结构草图，非实际掩膜图）*]
