// SOURCE PDF PAGE 102 / editorial Typst candidate, not 1:1 accepted.
#set document(title:"第3章 · 有效沟道尺寸及SPICE网表示例3.2 · PDF102")
#set text(lang:"zh")
= 第3章 · 印刷第83页

MOS晶体管实例在模型名称之后用 $L$、$W$ 指定版图尺寸。结电容通常需要源、漏面积参数AS和AD，以及边缘长度PS与PD。

== 有效沟道长度和宽度

SPICE预先计算 $L$ 和 $W$ 的有效值：

$ L_("eff") = L - Delta L $

$ W_("eff") = W - Delta W quad "(3.2)" $

两式在原书中共用式号（3.2）。$Delta L$、$Delta W$ 反映制造过程导致的有效几何缩减。

== 例3.2　SPICE MOS 晶体管规格

原题指定：$L=0.2 " μm"$，$W=0.4 " μm"$，$Y=0.5 " μm"$，漏端为drainn，栅端为gaten，源和衬底接地，模型NMOS1。

#raw("M1 drainn gaten Gnd Gnd NMOS1 l=0.2u w=0.4u ad=0.2p pd=0.4u as=0.2p ps=0.4u", block:true)

另一个写法使用全局缩放因子来减少大量显式单位：

#raw(".opt scale=0.1u\nM1 drainn gaten Gnd Gnd NMOS1 l=2 w=4 ad=20 pd=4 as=20 ps=4",block:true)

在这种格式中，缩放因子与实例的长宽和扩散几何一起应用，而不是第2章的沟道长度调制参数LAMBDA。

== 3.5　SPICE MOS LEVEL 1 器件模型

原书列出 LEVEL 1 直流模型关键参数VTO、KP、LAMBDA、PHI、GAMMA，并说明这些参数可直接指定，也可以由NSUB、TOX、UO等工艺变量计算。

VTO是零体偏的阈值，PHI描述衬底费米势，GAMMA为体效应系数，KP为跨导参数，LAMBDA为沟道长度调制系数。对所有计算必须统一NMOS与PMOS的符号约定。

式（3.3）的衬底掺杂计算在下一扫描页展开。

_已核对图3.2的两个网表版本和式（3.2）的共用编号；公式中物理下标仍可继续微调。_
