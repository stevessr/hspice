// SOURCE PDF PAGE 407 / printed 388. Scan-guided current-density / EM examples.
// Industrial die routing is not reproduced; Fig 11.32 is an editable semantic map.
#import "../figures/ch11-em-pll-native.typ": fig1132
#set document(title:"第11章 · 时钟树布线和电迁移 · PDF407")
#set text(lang:"zh",size:7.35pt)
#show par: set par(leading:2pt,spacing:3pt)
#align(center)[#text(size:7.6pt,weight:"bold")[388　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

这是基于电流在导线中来回流动时产生的交流焦耳发热的。一个 $J_("AC,max")$ 的典型值是 20 mA/μm²。失效的标准是：

#align(center)[$J_("rms") > J_("AC,max") quad (11.8)$]

如果实际的 RMS 电流密度小于可承受的数量，则信号线的期望寿命会超出相应产品的寿命。

#fig1132()
#align(center)[#text(size:7.2pt)[图 11.32　工业芯片的时钟树布线（本图为原生结构示意）]]

图 11.33 说明了时钟的 EM 问题区域。在这个门的输出端的金属段既经受了单向（dc）又经受了双向（ac）电流流动机制。大部分导线由于电容的充放电会遇到双向电流。所以，对于 EM 失效电流密度的标准将基于式（11.8）。然而，有一个短的单向金属段连接 PMOS 器件与 NMOS 器件，其 EM 失效要用式（11.5）的标准进行判断。在图中，对这两段的每一段标注了通过 EM 检查的标准。

图 11.34 给出了对图 11.32 中时钟树的一部分的电迁移分析结果。用方框突出显示的区域违反了式（11.5）或式（11.8）的 EM 判据。所有信号的 EM 失效必须进行纠正，因为任何导线中的任何断裂都是灾难性的。同样，导线加宽是这个问题的典型解决方案。

_原扫描图 11.32 是工业芯片的复杂版图，尚待独立版图素材与走线几何校对，当前为结构性重绘。_
