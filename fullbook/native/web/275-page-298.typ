// SOURCE PDF 298 / printed 279. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF298")
#align(center)[#text(size:8pt,weight:"bold")[279　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

两级译码器的主要优势是预译码生成的中间信号可以被许多末级门共用。图8.6使用六位地址，分为三个二位预译码组；每组生成四个组合信号，共12个中间信号。末级使用64个三输入逻辑门和反相器，产生64个输出。

#figure8(6)
#align(center)[*图8.6　六位地址的两级译码器结构（可编辑功能图）*]

每一个预译码信号驱动16个末级门，因此分支强度为16。逻辑强度设计不仅应考虑电气扇出，也要考虑预译码链的级数。

*例8.1　用逻辑强度的方法确定译码器尺寸*

假设规格化输出负载为1，使用FO4规则确定图8.6译码器尺寸。FO4规则采用最优级强度约4的工程设计方法。对各级应从末级输出负载向前逐级计算输入电容，预译码级还要计入16路分支负载。原书示例包含二输入NAND、反相器、三输入NAND和输出反相器等各级的尺寸反推。由于扫描中的部分分式下标尚未逐字确认，此处不擅自补造数值。
