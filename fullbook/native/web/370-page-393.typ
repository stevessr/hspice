// SOURCE PDF PAGE 393 / printed 374; scan-guided editable Typst excerpt only.
// Literal paragraphs, layouts, photographed micrographs and electrical nets not fully verified.
#import "../figures/ch11-power-grid-em-native.typ": fig113,fig114,fig115,fig116,fig117,fig118,fig119,fig1110,fig1111,fig1112,fig1113,fig1114,fig1115
#set document(title:"第11章·电源完整性、电迁移与去耦电容·PDF393")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[374　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

图11.8对比电源线单边、双边供电方案。双边供电降低个别区域对单条电源主干的依赖，有利于同时满足 IR 压降和电迁移约束。

#fig118()
#align(center)[*图11.8　减小IR压降的简单技术（可编辑示意）*]

原书图11.9展示了使用两个金属层构成正交的电源网格：相邻金属层通过通孔阵列相连。多层导线相互并联可以形成低电阻供电路径，同时分散单个通孔的电流压力。

#fig119()
#align(center)[*图11.9　网孔阵列方法的通孔与两层金属结构（编辑示意）*]

== 11.2.4　去耦电容设计

芯片上的去耦电容（decaps）用于电路快速转换时提供暂态充放电电荷，抵抗来自有限电阻、电感的供电噪声。在驱动器附近设置去耦电容有助于缓解 IR 压降与 $L dif i/dif t$ 噪声的瞬态影响。

#fig1110()
#align(center)[*图11.10　芯片上的去耦电容（可编辑电源网格示意）*]

去耦电容也消耗面积并增加漏电，选取容量和布局时需要结合活动区域及频率。
