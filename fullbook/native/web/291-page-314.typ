// SOURCE PDF 314 / printed 295. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第8章·半导体存储器设计·PDF314")
#align(center)[#text(size:8pt,weight:"bold")[295　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

#figure8(22)
#align(center)[*图8.22　基于锁存器的灵敏放大器（结构及感测时序）*]

对锁存式感测放大器而言，感测使能信号必须在位线已产生足够差分电压之后到达，但又不能过晚，否则会增加不必要的访问延迟。实际设计还必须考虑工艺、电压和温度变化。

为追踪真正的数据通路延迟，可以采用复制（replica）路径产生感测使能。图8.23将实际路径与复制路径并列：实际路径通过译码器、字线、单元放电和位线；复制路径通过等效单元和译码器电路，使感测使能时刻跟随真实位线变化。

教材说明，复制单元若放在译码器之后可能面临驱动众多灵敏放大器的负担，因此结构安排需谨慎。复制路径的目标是使两侧延迟特性接近，并在实际位线达到目标摆幅时提供正确的感测控制信号。
