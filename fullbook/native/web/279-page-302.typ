// SOURCE PDF 302 / printed 283. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF302")
#align(center)[#text(size:8pt,weight:"bold")[283　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

#figure8(10)
#align(center)[*图8.10　SRAM读操作及相应时序（结构图）*]

读操作不能错误地翻转内部存储值。读取0时，存取晶体管与单元下拉晶体管形成电压分配，因此应使下拉器件的电导足够大，以限制存储节点的上升。教材讨论下拉器件的电导约为存取器件的3～4倍作为读稳定性设计依据。

因为位线电容很大，而单元电流通常较小，位线从高电平下降的过程可能比较缓慢。用一个平均单元电流近似时，位线的放电速率与电容成反比：

#align(center)[$abs((dif V_("BL"))/(dif t)) approx I_("cell") / C_("BL")$]

如果试图仅通过增大晶体管尺寸加快位线放电，则阵列面积与功耗会上升。因此通常使用灵敏放大器，只要求位线产生足以辨别数据的小电压差。字线激活至感测使能之间的延迟必须合理选择。
