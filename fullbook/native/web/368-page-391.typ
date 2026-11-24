// SOURCE PDF PAGE 391 / printed 372; scan-guided editable Typst excerpt only.
// Literal paragraphs, layouts, photographed micrographs and electrical nets not fully verified.
#import "../figures/ch11-power-grid-em-native.typ": fig113,fig114,fig115,fig116,fig117,fig118,fig119,fig1110,fig1111,fig1112,fig1113,fig1114,fig1115
#set document(title:"第11章·电源完整性、电迁移与去耦电容·PDF391")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[372　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

=== 例11.1　用MTTF建立最大允许电流密度

题设要求10年寿命，以加速测试得到的电迁移模型为基础，采用教材给定的经验系数及 $Delta H=0.85 "eV"$、温度 $125 °"C"$。

由于 MTTF 是部分器件失效的统计量，原书为安全采用因子10：

#align(center)[$t_"target" = 10 times (10 "年" times 365 "天/年" times 24 "小时/天") approx 8.8 times 10^5 "h"$]

将这一数值带入式（11.3）求允许的电流密度：

#align(center)[$J_"max" = sqrt(A / t_"target" exp((Delta H)/(k T)))$]
#align(center)[$J_"max" approx 8.95 times 10^5 "A/cm²"$]

对实际互连金属，平均电流密度定义为：

#align(center)[$J_"avg" = I_"avg" / (W T) quad (11.4)$]

其中 $W$ 为线宽，$T$ 为线厚。原书将电迁移的失效风险判据写为：

#align(center)[$J_"avg" > J_"max" quad (11.5)$]

通常应该反向设计，使运行条件下的 $J_"avg"$ 不超过工艺允许值。金属通孔也需要单独检查电流容量与电迁移可靠性。

== 11.2.3　电源布线要考虑的问题

电源网络除线阻与封装电感外，还受逻辑门的同时开关、布局密度、峰值和平均电流以及温度影响。布局布线时应同时考虑 IR 压降、地线反跳、瞬态 $L dif i/dif t$ 与电迁移。
