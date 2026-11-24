// SOURCE PDF 317 / printed 298. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第8章·半导体存储器设计·PDF317")
#align(center)[#text(size:8pt,weight:"bold")[298　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

#figure8(26)
#align(center)[*图8.26　为了减小延迟与功耗而采用的划分字线方法*]

类似思想也可用于位线。若将位线拆成两段，则每段连到的单元数减少，等效位线电容也随之下降；需要通过增加一级或多级列选择将局部位线连接到输出通路。

#figure8(27)
#align(center)[*图8.27　为了减少延迟而采用的位线划分*]

在教材示例中，位线分成两部分后，要达到原先相同的位线摆幅，局部位线的放电时间可能下降到近似一半。然而，更多的分块也引入更多的多路选择级，必须一起考虑控制逻辑、布线和信号通路延迟。
