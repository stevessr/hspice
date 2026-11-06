// Source PDF page101 / printed82, figure3.10 and detailed instance table.
#import "../figures/ch3-layout-spice-native.typ": mos-spice-geometry
#set document(title:"第3章 · 图3.10与MOS晶体管实例描述 · PDF101")
#set text(lang:"zh")
= 第3章 · 印刷第82页

一组物理模型参数需要包含不同尺寸及温度的工艺角数据。参数提取后，设计者将其放入模型库文件，SPICE再依据实例的端子与尺寸选择对应模型。

== 3.4.2　MOS 晶体管的具体说明

#mos-spice-geometry()

*图3.10　用于SPICE建模的MOS版图和电路符号。* 图中给出沟道宽度 $W$、长度 $L$，漏侧外延 $Y_D$、源侧外延 $Y_S$ 以及栅和场区重叠 $Z$。

对MOS晶体管实例，书中按照漏、栅、源、体四端、模型名称和几何参数排列：

#raw("Mxxx D G S B mname L=值 W=值 AD=值 PD=值 AS=值 PS=值", block:true)

#table(columns:(0.86fr,2.8fr),inset:(x:3pt,y:1.6pt),
 table.header([*符号*],[*含义*]),
 [Mxxx],[MOSFET实例名称],
 [D],[漏节点], [G],[栅节点], [S],[源节点], [B],[体/衬底节点],
 [mname],[SPICE模型名称，用以区分NMOS和PMOS],
 [$L$],[沟道长度],[$W$],[沟道宽度],
 [AD],[漏扩散区域面积],
 [PD],[漏周边长度，用来计算侧壁结电容],
 [AS],[源扩散区域面积],
 [PS],[源周边长度，用来计算侧壁结电容],
)

实例描述中的几何尺寸通常来自版图，而模型库参数来自制造工艺。为了让SPICE计算结电容，还必须提供扩散区面积和周长。

_图3.10原书标签、四端实例顺序及12项字段已按扫描核对，版图尺寸与图中文字位置未通过1:1验收。_
