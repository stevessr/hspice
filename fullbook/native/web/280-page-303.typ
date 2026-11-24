// SOURCE PDF 303 / printed 284. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF303")
#align(center)[#text(size:8pt,weight:"bold")[284　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

位线产生感测所需的差分电压所需时间，可以由放电电容、电流及目标电压差近似计算：

#align(center)[$I_("cell") approx C_("BL") Delta V / Delta t$]
#align(center)[$Delta t approx C_("BL") Delta V / I_("cell")$]

*例8.2　读周期的设计方针*

题设采用0.13 µm工艺，要求单元读取0期间内部节点升幅受到限制，且在指定时间内形成可被感测的位线电压差。原书给出的设计约束包括：内部节点升幅约0.1 V，总位线电容2 pF，2 ns内实现200 mV的位线变化。

解法首先建立存取晶体管与下拉晶体管的电流平衡，从而求取两者的尺寸比。读稳定性要求决定单元比（cell ratio）；位线时间要求再决定绝对管宽。可以将计算划分为“稳定性比值”和“最小感测电流”两步。

以题设位线参数计算，平均单元放电电流为：

#align(center)[$I_("cell")=(2 "pF" times 0.2 "V")/(2 "ns")=200 mu "A"$]

这个值来自题设的电流—电容近似，器件级电流模型及源书尺寸结果仍待公式符号终审。
