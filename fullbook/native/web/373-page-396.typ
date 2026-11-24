// SOURCE PDF PAGE 396 / printed 377; scan-guided editable Typst excerpt only.
// Literal paragraphs, layouts, photographed micrographs and electrical nets not fully verified.
#import "../figures/ch11-power-grid-em-native.typ": fig113,fig114,fig115,fig116,fig117,fig118,fig119,fig1110,fig1111,fig1112,fig1113,fig1114,fig1115
#set document(title:"第11章·电源完整性、电迁移与去耦电容·PDF396")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[377　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

在原书的改造案例中，电源网格的初始 IR 压降过高；通过在芯片上下关键电源区域加入多条宽的高层金属连接，使不同供电层之间的电流路径更加均衡。

#fig1114()
#align(center)[*图11.14　修改之前和修改之后的IR压降图（示意，非原热图数值）*]

这同时影响电迁移风险。原书图11.15说明，补充金属连接可在降低电压降的同时改善部分电源线的局部电流密度，但也可能让新形成的供电连接承担更大电流，因此需要再次进行 EM 检查。

#fig1115()
#align(center)[*图11.15　修改之前与修改之后的电迁移图（定性编辑图）*]

图11.14和11.15来自原书布局工具的黑白结果图，目前只重新绘制了比较概念。真实的压降与电流密度分布数据不可从扫描图可靠恢复，不将此处的相同阴影当作量化比较。

工程上可通过改变导线宽度、增加并行电源路径和在不同点插入跨层连接来降低局部的平均电流密度。任何改动都需要在 IR、EM、时序及布局面积之间重新评估。
