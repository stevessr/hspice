// SOURCE PDF PAGE 357. Source scan-assisted Typst native editorial draft.
// All circuit diagrams, text positions and equations still require strict 1:1 acceptance.
#import "../figures/ch10-rc-elmore-native.typ": figure10more,fig-example102,fig-example101
#set document(title:"第10章·连线RC与艾蒙延迟·PDF357")
#align(center)[#text(size:8pt,weight:"bold")[338　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

不同金属层的方块电阻与其厚度及材料有关。对教材中0.18 μm工艺的示例，较低层铝金属的典型方块电阻约为54 mΩ/□，较高金属层约为27 mΩ/□。

#align(center)[$R_("sq", "lower") approx 54 "mΩ/□" quad R_("sq", "upper") approx 27 "mΩ/□" quad (10.3)$]

对0.13 μm示例，低层与高层金属的值分别约为42 mΩ/□和21 mΩ/□：

#align(center)[$R_("sq", "lower") approx 42 "mΩ/□" quad R_("sq", "upper") approx 21 "mΩ/□" quad (10.4)$]

工程上可把导线等效成方块电阻串联，均匀矩形线的结果为：

#align(center)[$R = R_("sq") (L/W) quad (10.5)$]

随着层数、导体厚度和宽度发生变化，应该按实际工艺使用不同的单位长度电阻。在模拟微米级金属连线时，厚度和宽度往往不再能简单地视为相同。

原书比较铝与铜的电阻率：$rho_("Al")=2.7 "µΩ·cm"$、$rho_("Cu")=1.7 "µΩ·cm"$。对于 0.18 μm 的五层铝工艺，金属 1–4 层厚度约 $0.5 "µm"$，第 5 层约 $1.0 "µm"$，有：

$ R_("sq,1–4") = rho/T = (2.7 "µΩ·cm")/(0.5 "µm") = 54 "mΩ/□" quad "(10.3)" $

$ R_("sq,5") = (2.7 "µΩ·cm")/(1.0 "µm") = 27 "mΩ/□" $

对 0.13 μm 的八层铜工艺，层 1–6 厚 $0.4 "µm"$，层 7–8 厚 $0.8 "µm"$：

$ R_("sq,1–6") = (1.7 "µΩ·cm")/(0.4 "µm") approx 42 "mΩ/□" $
$ R_("sq,7–8") = (1.7 "µΩ·cm")/(0.8 "µm") approx 21 "mΩ/□" quad "(10.4)" $

此处的 $L/W$ 就是方块数，薄层方块电阻对导线方向上的总电阻贡献更大。

=== 10.2.2　艾蒙延迟计算

对于长的RC网络，简单地把总串联电阻乘总并联电容，可能不能准确表示电荷分布和各内部节点的延迟。图10.4用由多个电阻段和对地电容组成的RC梯形网络代替均匀长线。

#figure10more(4)
#align(center)[*图10.4　均匀互连线的分布RC梯形模型（可编辑图元）*]
