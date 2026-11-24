// SOURCE PDF PAGE 389 / printed 370; scan-guided editable Typst excerpt only.
// Literal paragraphs, layouts, photographed micrographs and electrical nets not fully verified.
#import "../figures/ch11-power-grid-em-native.typ": fig113,fig114,fig115,fig116,fig117,fig118,fig119,fig1110,fig1111,fig1112,fig1113,fig1114,fig1115
#set document(title:"第11章·电源完整性、电迁移与去耦电容·PDF389")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[370　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 11.2.1　IR压降和 $L dif i/dif t$（续）

原书图11.3采用BGA封装例子估算供电噪声：在同一时钟边沿内，电源驱动多个大型反相器。假设接地与供电端的焊球/通孔寄生电感各为0.2 nH，电流在100 ps内改变25 mA，则两个供电支路产生的电压降约为：

#align(center)[$V_L = 2 L (dif i)/(dif t) = 2 (0.2 "nH") (25 "mA") / (100 "ps") = 100 "mV"$]

#fig113()
#align(center)[*图11.3　芯片外电感对供电的影响（可编辑等效示意）*]

在1.2 V供电系统中，这已是相当显著的瞬态变化。实际情况下，供电路径与芯片电源网格还存在寄生电阻、电感，并且更多驱动器可能同时切换。

#fig114()
#align(center)[*图11.4　电源与地分布网络的分布RLC组合效应（编辑示意）*]

为此，需要把电源轨的 IR 压降、地线反跳和封装/板级电感视为同一供电完整性问题的一部分。原书把同时切换引发的供电噪声称为*SSN（simultaneous switching noise）*。

== 11.2.2　电迁移

电迁移（EM）是大电流密度导致金属原子沿电流方向缓慢迁移的可靠性问题，会在芯片运行期间造成金属线断裂、通孔失效或其他连线故障。高电流密度、温度、导体材料和几何尺寸共同影响发生的可能性。
