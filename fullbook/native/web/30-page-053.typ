// Source PDF page 053 / printed page 34; MOS oxide model.
#import "../figures/threshold-native.typ": oxide-and-channel
#set document(title: "第2章 氧化层电容与费米势 · 原书第53页")
#set text(lang:"zh")

= 第2章 · 第34页

在 p 型半导体中，平衡空穴浓度与受主掺杂浓度相关，其费米势的符号需与 n 型半导体区分。在使用本征浓度作为参考时，可写为：

$ phi_("Fp") = (k T)/q ln(n_i/N_A) $

对于典型 p 型衬底，$N_A > n_i$，因此 $phi_("Fp")$ 为负值。阈值推导中经常使用 $2 abs(phi_("Fp"))$ 的正量，避免符号混用。

== 栅氧化层电容

栅氧化层单位面积电容为：

$ C_("ox") = epsilon_("ox")/t_("ox") $

其中 $epsilon_("ox")$ 为氧化层介电常数，$t_("ox")$ 为物理厚度。氧化物越薄，单位面积电容越大，但不能忽略漏电和可靠性限制。

== 图2.5：栅压形成反型沟道

#oxide-and-channel()

*图2.5　NMOS栅压、氧化层与反型沟道的可编辑结构示意。*

在栅极偏置发生变化时，半导体表面的耗尽与反型状态随之改变，构成阈值电压分析的物理基础。

_该页保留核心原书公式2.4、2.5的原生结构；图2.5与全文尚未逐项精校。_
