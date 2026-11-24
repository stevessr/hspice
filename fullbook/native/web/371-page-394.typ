// SOURCE PDF PAGE 394 / printed 375; scan-guided editable Typst excerpt only.
// Literal paragraphs, layouts, photographed micrographs and electrical nets not fully verified.
#import "../figures/ch11-power-grid-em-native.typ": fig113,fig114,fig115,fig116,fig117,fig118,fig119,fig1110,fig1111,fig1112,fig1113,fig1114,fig1115
#set document(title:"第11章·电源完整性、电迁移与去耦电容·PDF394")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[375　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

芯片上常利用MOS晶体管构成去耦电容。教材给出：通过栅与源漏形成大面积的氧化层电容，MOS器件的工作方式需保持在电压允许范围内。

#align(center)[$C_"decap" = C_"ox" W L$]

#fig1111()
#align(center)[*图11.11　用MOS电容的芯片上去耦电容（可编辑示意）*]

如果考虑多晶硅边沿与源漏区之间的边缘/覆盖电容，可得到：

#align(center)[$C_"decap" = C_"ox" W L + C_"ol" W$]

电容大小还取决于工艺模型，原书说明应针对栅氧化层、覆盖电容等项选择正确的器件尺寸。

#fig1112()
#align(center)[*图11.12　对芯片中的一块进行电源网格模拟（原生网格示意）*]

去耦电容布置需要兼顾不同模块的电流需求、节点的供电阻抗和电容自身的有效频率。原书指出，电容数量可能是无用区域中某些空隙的填充方案，但不能代替对整个电源网格的IR与EM分析。

== 11.2.5　电源分布设计举例

下一页开始一个真实芯片的布局例子。原书使用片上电源网格、功能块电源需求和IR/EM的图形分析结果示范从测量到设计修改的过程。
