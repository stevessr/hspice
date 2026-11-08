// SOURCE PDF PAGE 367. Scan-guided editable Typst selection; NOT full 1:1 acceptance.
// Original source scan: printed page 348; images/figures are editable abstractions.
#import "../figures/ch10-coupling-native.typ": fig1011,fig1012,fig1013,fig1014,fig1015,fig1016,fig1017,fig1018,fig1019
#set document(title:"第10章·连线设计·源扫描PDF367")
#set text(size:7.2pt)
#show par: set par(leading:2.3pt,spacing:3.4pt)
#align(center)[#text(size:7.5pt,weight:"bold")[348　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 10.4.1　耦合电容的构成

在现代集成电路中，连线电容由导线的布线拓扑、相邻导线间距以及上下金属层和衬底的距离共同决定。为便于分析，原书将电容分成几种来源：

- *对地电容：* 导线与衬底之间的电容；随导线缩放，其重要性趋于降低。
- *侧向电容：* 同层邻近导线之间的电容，是延迟和串扰的重要来源。
- *边缘电容：* 电场从金属边缘向相邻导体扩散时形成的电容。
- *区域电容：* 不同金属层导线在上下投影重叠时产生的电容。

#fig1011()
#align(center)[*图10.11　区域、侧向和边缘成分（Typst可编辑示意）*]

耦合电容长期增长而对地电容减少，图10.12总结了两者相对贡献的趋势。教材指出，在典型0.13 μm设计中，一个节点超过70%的导线电容可能由线间耦合产生；长线尤其常见。

#fig1012()
#align(center)[*图10.12　耦合、对地和总电容的定性趋势（非原图测量数据）*]

实际门的扩散结电容和栅电容会增加等效对地负载，但这并不意味着可以忽略邻线耦合对时延和噪声的影响。

#text(size:7pt)[脚注：图10.11是用于解释组成的一阶模型；原书说明还存在未画出的其他边缘电容。]
