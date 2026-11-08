// SOURCE PDF PAGE 395 / printed 376; scan-guided editable Typst excerpt only.
// Literal paragraphs, layouts, photographed micrographs and electrical nets not fully verified.
#import "../figures/ch11-power-grid-em-native.typ": fig113,fig114,fig115,fig116,fig117,fig118,fig119,fig1110,fig1111,fig1112,fig1113,fig1114,fig1115
#set document(title:"第11章·电源完整性、电迁移与去耦电容·PDF395")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[376　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 11.2.5　电源分布设计举例（续）

源书图11.13是一幅芯片电源分布系统的实际照片。芯片由多个大功能模块组成，不同模块对电流密度和供电网格的需求不同。以下仅用可编辑区域块表示位置关系，*不是原照片的复制*。

#fig1113()
#align(center)[*图11.13　一个芯片的电源分布系统举例（照片内容的编辑式结构摘要）*]

原书先通过提取电源网格所有寄生电阻、合并片上电路/存储模块的平均电流需求，再使用网络方法求每个节点的IR压降。过高的压降会使某些局部区域的逻辑门看到的供电电压偏低，影响关键延迟。

如果电源网格的不同功能块被分配到较少的通孔或高电阻连接，也可能出现本地过载。排查问题时必须从最差节点、最差电流路径与模块布局一起考虑。

在图11.14和图11.15的原版分析中，设计者通过增加跨层电源连接改善IR与EM。要取得平衡，不可无限制使用高层金属，否则会挤占信号路由资源。
