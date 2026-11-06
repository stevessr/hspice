// Source PDF page 077 / printed 58. Exact equation 2.40 and Fig 2.20 labels checked.
#import "../figures/mos-ch2-end-native.typ": junction-plan
#set document(title:"第2章 · n+结与结电容版图模型 · PDF077")
#set text(lang:"zh")
= 第2章 · 印刷第58页

== n⁺/p 结的零偏置结电容

对于 NMOS 晶体管中的 $n^+$/$p$ 结，教材将式（2.39）按 $N_D$ 远大于 $N_A$ 的情形简化为：

$ C_("j0") = sqrt((epsilon_("si") q N_A)/(2 phi_B)) quad "(2.40)" $

该 $C_("j0")$ 是单位面积零偏置结电容，量纲为 $\mathrm("fF/μm²")$，计算整个扩散结时仍须乘以面积。

== 图2.20　来源于版图数据的结电容

#junction-plan()

*图2.20　NMOS 的栅极 G、源 S、漏 D、扩散区及其截面示意（原生可编辑结构图）。*

原图描述版图顶视图和横截面。扩散区中，栅极边缘以外的延伸量记为 $Y$，沟道宽度记为 $W$，源漏扩散深度记为 $x_j$。对底部结面积：

$ A_b = W Y $

对源漏区域侧壁面积，可在理想矩形近似下使用 $A_("sw") = W x_j$，但教材下一页还讨论其他边界侧壁的处理。

结电容由底部 pn 结和源漏侧壁 pn 结两部分贡献。由于STI浅沟槽隔离的存在，现代工艺中与沟槽相邻的三条侧边通常可忽略；面向沟道的一条侧边需计入侧壁电容。

_本页式2.40、图2.20的W/L/Y/x_j和底结面积已核对；所有图元仍需原版尺寸与文字逐行验收。_
