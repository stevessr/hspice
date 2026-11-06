// SOURCE PDF PAGE 109 / printed 90. Eq3.18–3.20 and example3.4 intro.
#import "../figures/bsim-effects-native.typ": dibl-threshold
#set document(title:"第3章 · DIBL、迁移率退化与速度饱和 · PDF109")
#set text(lang:"zh")
= 第3章 · 印刷第90页

#dibl-threshold()

*图3.14　漏感应势垒降低：短沟道器件的阈值随漏源电压增加而下降。*

包含前述短沟道效应、窄沟道效应和DIBL影响的阈值表达式：

$ V_T = "VTH0" + "K1"(sqrt("PHI" - V_("BS")) - sqrt("PHI"))
 - "K2" V_("BS") - eta V_("DS") - Delta V_("SCE") + Delta V_("NCE")
 quad "(3.18)" $

式中 $Delta V_("SCE")$ 与 $Delta V_("NCE")$ 分别表示短沟道和窄沟道效应的修正项。

== 3.6.3　迁移率模型

在BSIM3中，标称迁移率参数为UO，同时用UA、UB和UC描述垂直电场及体偏压对有效迁移率的影响。书中列出一种形式：

$ mu_v = "UO" /
  (1 + ("UA" + "UC" V_("BS")) ((V_("GS") - V_T)/t_("ox"))
  + "UB" ((V_("GS") - V_T)/t_("ox"))^2)
  quad "(3.19)" $

原书说明，水平高电场使载流子漂移速度趋向饱和；VSAT参数提供饱和速度。用有效迁移率计算临界场：

$ E_c = (2 "VSAT")/mu_v quad "(3.20)" $

该关系使低场漂移速度与高场饱和速度之间保持平滑过渡。

== 3.6.4　线性区和饱和区

确定阈值和迁移率后，可以计算不同漏源偏置下的电流。BSIM3公式加入许多修正项，实际表达复杂；教材本节着重其与第2章长短沟道公式的对应关系。

== 例3.4　0.18 μm CMOS 的BSIM3 I–V特性（开头）

以0.18 μm模型，将 $V_("DS")$ 从0扫描至1.8 V，在多个栅压下分别绘制NMOS与PMOS的 $I_("DS")$—$V_("DS")$。器件宽度约0.4 μm，原书使用HSPICE示例网表；继续见下一页。

_式3.18—3.20和图3.14已依据扫描整理，例3.4完整网表未提前复制后页。_
