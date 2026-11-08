// SOURCE PDF 315 / printed 296. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第8章·半导体存储器设计·PDF315")
#align(center)[#text(size:8pt,weight:"bold")[296　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

#figure8(23)
#align(center)[*图8.23　复制路径产生感测使能信号（可编辑时序功能图）*]

一个存储单元的微小放电量往往无法直接作为全摆幅逻辑信号驱动复制译码链。原书提出使用一条缩短的复制列线：通过减少复制列上的单元数，使它在与真实位线相同的时间内产生更大、接近全摆幅的电压变化。

例如，若真实列有256个单元，在规定时间中需要形成180 mV变化，则复制列可以使用约26个等效单元，使其产生约1.8 V变化；该比例是教材提供的设计示意，而不是适用于所有工艺的固定常数。

#figure8(24)
#align(center)[*图8.24　复制单元的设计（缩短的复制列）*]

设计时可以把复制路径设得略慢于实际感测路径，确保感测使能信号不会提前触发。
