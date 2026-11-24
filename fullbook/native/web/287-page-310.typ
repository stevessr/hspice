// SOURCE PDF 310 / printed 291. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第8章·半导体存储器设计·PDF310")
#align(center)[#text(size:8pt,weight:"bold")[291　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

使用四位列地址时，如果直接译码，会产生16条控制线。另一种方法是采用两个2至4译码级，每一级从四个传输门支路中选择一个。两级树状结构虽然可以减少部分译码器的尺寸和功耗，但会增加串联传输门的数量与数据延迟。

图8.17以NMOS传输管示意两级结构；若需完整CMOS传输门，还要为PMOS构建互补的控制网络。选型需根据时序与功耗规范，而不能仅以晶体管数为依据。

=== 8.4.3　写电路

图8.18描述简化SRAM写驱动。地址、数据与写信号首先建立并保持，然后把选中的位线拉低，其余位线保持预充状态。字线升高时，通过存取晶体管把对应内部节点拉到翻转阈值以下，完成写入。

#figure8(18)
#align(center)[*图8.18　写驱动器电路（功能结构可编辑草图）*]

=== 8.4.4　读电路

读操作中的位线电容较大，电压摆幅很慢。为了缩短读时间，灵敏放大器应在位线差分电压大约150～200 mV时工作，将微小差值放大为全摆幅数字电平。
