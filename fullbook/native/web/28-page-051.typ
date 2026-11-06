// Source PDF page 051 / printed page 32.
#import "../figures/semiconductor-native.typ": cmos-wells
#set document(title: "第2章 图2.3 CMOS集成结构 · 原书第51页")
#set text(lang: "zh")

= 第2章 · 第32页

== CMOS工艺中的NMOS和PMOS

#cmos-wells()

*图2.3　具有 p 型区域、n阱和隔离沟槽的互补MOS器件结构（可编辑剖面示意）。*

CMOS 工艺要在同一芯片上同时制造 NMOS 和 PMOS。n阱为PMOS提供适当的体区，隔离结构限制相邻器件之间的寄生导电路径。

源漏接触、氧化层、阱和栅极形状均影响实际电学性质。电路图中常简化为四端晶体管，而版图模型和 SPICE 模型则需要考虑相应的结电容、接触电阻与几何效应。

== 2.3　MOS晶体管的阈值电压

阈值电压 $V_T$ 是 MOS 器件分析中的核心参数。为了描述栅极偏置怎样改变半导体表面电势，需要先了解能带结构、掺杂浓度、载流子平衡及氧化物电容。

阈值并非完全固定的器件常数，其有效值受源体偏置及工艺参数的影响。

_本页原图2.3采用更加细致的工艺剖面，当前图仍是教学重绘。_
