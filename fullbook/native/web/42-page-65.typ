// Source PDF page 065 / printed page 46. Eqs 2.21,2.22 and Fig 2.12.
#import "../figures/mos-velocity-native.typ": velocity-saturation
#set document(title:"第2章 · 垂直迁移率与速度饱和 · PDF65页")
#set text(lang:"zh")

= 第2章 · 印刷第46页

== 垂直电场导致的有效迁移率退化

在高栅压下，反型电子更靠近 Si–SiO₂ 界面，散射增加，使表面迁移率降低。原书使用经验模型：

$ mu_e = mu_0 / (1 + ((V_("GS") - V_T)/(theta t_("ox")))^eta) quad "(2.21)" $

其中 $mu_0$ 是低场标称迁移率，$theta$ 与 $eta$ 是经验模型参数。原书对 NMOS 举例取：

$ mu_0 approx 540 " cm"^2 / ("V" dot "s") $

$ theta = 3.6 times 10^6 " V/cm", quad eta=1.85 $

当 $t_("ox") = 22 " Å"$、$V_("GS")-V_T = 0.8 " V"$，由该模型得到 $mu_e approx 270 " cm"^2/("V" dot "s")$，约为低场的一半；书中同条件下 PMOS 约 $70 " cm"^2/("V" dot "s")$。

== 水平电场引起的速度饱和

#velocity-saturation()

*图2.12　载流子速度随水平电场先增长后趋于上限的原生矢量示意。*

在室温附近，教材采用 $v_("sat") approx 10^7 " cm/s"$ 作为速度饱和的数量级。图2.12在较大场强处逐渐趋平，定义临界场 $E_c$ 作为低场与饱和区的分界。

原书引述400 K实验，电子与空穴饱和速度约为 $8 times 10^6 " cm/s"$，并给出临界场估计：

$ E_("cn") = 6 times 10^4 " V/cm" quad "(电子)" $

$ E_("cp") = 24 times 10^4 " V/cm" quad "(空穴)" quad "(2.22)" $

_图2.12可编辑但尚未与原扫描逐坐标校准；式(2.21)/(2.22)与历史例题值已对照。_
