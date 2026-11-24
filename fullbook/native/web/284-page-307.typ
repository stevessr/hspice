// SOURCE PDF 307 / printed 288. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF307")
#align(center)[#text(size:8pt,weight:"bold")[288　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

#figure8(13)
#align(center)[*图8.13　三种列上拉结构（原生可编辑草图）*]

图8.13(a)中PC激活时同时打开两条位线的上拉与均衡开关，使它们预充且电平相等。字线激活后，存储0的一侧放电；两条位线上的电压差交由灵敏放大器处理。

图8.13(b)使用静态负载，读出时其中一侧能够形成持续的电流通路。图8.13(c)的NMOS增强型负载可能使预充最高电压低于 $V_("DD")$，适用于需要较低共模输入偏置的差分感测电路。

地址转变探测（ATD）可以产生预充控制脉冲。图8.14利用每个地址位的原信号与经延迟的信号送入异或门；发生跳变时两路径短暂不同，因此得到短脉冲。脉冲宽度取决于延迟链的传播时间。多个地址检测脉冲组合后产生ATD或PC控制信号。
