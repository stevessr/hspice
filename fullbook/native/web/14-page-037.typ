// SOURCE PDF PAGE 037 / printed page 18
// Scan-proofread captions and inductive-noise paragraph; original die photograph remains a separate source asset.
#import "../figures/interconnect-native.typ": adjacent-buses, rlcladder
#set document(title: "第1章 · 图1.17–1.19 IR降、耦合电容及RLC · PDF037")
#set text(lang: "zh")

= 第1章 · 印刷第18页
== 图 1.17　数字集成电路上 IR 下降的等电位图

图 1.17 原图为 Simplex Solutions, Inc. 授权引用的芯片供电压降等电位图。扫描图的明暗区域反映实际芯片的电压下降，中央深色区标有“IR 下降违例”。这是一幅真实测量的图像，不能用理想矩形矢量示意来冒充。

== 图 1.18　耦合电容的影响

#adjacent-buses()

*图 1.18　耦合电容的影响。* 相邻多路导线之间不仅有对地电容，线与线之间还存在耦合电容。当前电路拓扑是独立可编辑的 Typst 重绘，不是原始测量数据。

除此之外，最近还出现了自感应和互感应问题。在电源网格中，除了上述的 IR 下降之外，还有一个关于 $L dif i / dif t$ 的电压下降。在先进的高速设计中，由于电流的变化率很大，所以这一项很重要。事实证明，多位总线中会产生互感应耦合效应，从而使设计不断出现失误。图 1.19 中所示的是当今的电源线和信号线现实的一种设想。由于图形的复杂性，这里没有给出连线之间的电容耦合和电感耦合。所有这些问题给出之后，人们不再怀疑在深亚微米工艺中互连实际上远比器件更加重要的许多观点。

== 图 1.19　DSM 逻辑电路中的电源线和信号线

#rlcladder()

*图 1.19　DSM 逻辑电路中的电源线和信号线。* 信号及电源返回路径具有串联的 $R$ 和 $L$，节点还存在寄生 $C$。本图为结构性编辑示意，源图的每段拓扑和空间层次尚需单独校对。

#text(size: 7pt, fill: gray)[PDF037的图号、授权说明、Ldi/dt 术语与原书主段落已对照扫描。图1.17的实际版图照片、图1.18及图1.19精确元件数量与位置尚未实现1:1。]
