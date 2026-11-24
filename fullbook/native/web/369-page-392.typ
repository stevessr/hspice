// SOURCE PDF PAGE 392 / printed 373; scan-guided editable Typst excerpt only.
// Literal paragraphs, layouts, photographed micrographs and electrical nets not fully verified.
#import "../figures/ch11-power-grid-em-native.typ": fig113,fig114,fig115,fig116,fig117,fig118,fig119,fig1110,fig1111,fig1112,fig1113,fig1114,fig1115
#set document(title:"第11章·电源完整性、电迁移与去耦电容·PDF392")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[373　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 11.2.3　电源布线要考虑的问题（续）

大规模芯片使用规则的电源网格分配供电。图11.6展示了外环 $V_"DD"$、内环 $V_"SS"$ 的示意；供电母线可在较低层与较高层金属之间逐级连接到功能模块的电源引脚。

#fig116()
#align(center)[*图11.6　大模块级电源分布（可编辑拓扑示意）*]

电源线网的尺寸要减少 IR 压降，同时需满足电迁移和布局面积限制。图11.7比较了较窄和较宽的供电线，后者电阻更小，但也占用更多可用于信号布线的金属面积。

#fig117()
#align(center)[*图11.7　电源布线的不同选择：宽度与拥塞之间的权衡（概念重绘）*]

原书强调，跨区域供电的线路选择会改变局部电源完整性。如果某条电源线只从单侧接入，则电流集中于部分路径，容易增大 IR 压降；若允许双边供电，可降低最远节点的电阻路径并改善网络冗余。

关键设计目标是让整片芯片的电压、电流和温升保持在容许范围内，而不是只让某条典型线网符合预算。
