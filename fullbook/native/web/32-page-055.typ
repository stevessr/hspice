// Source PDF page 055 / printed page 36; depletion charge.
#import "../figures/threshold-native.typ": depletion-bending
#set document(title: "第2章 MOS耗尽层与电荷 · 原书第55页")
#set text(lang:"zh")

= 第2章 · 第36页

== 图2.7：强反型之前的耗尽区

#depletion-bending()

*图2.7　栅偏置使半导体表面能带弯曲，并形成耗尽层的可编辑示意。*

在一维耗尽近似中，施加足够正的 NMOS 栅压后，p 型衬底表面的空穴首先被排斥，留下净受主离子负电荷。随表面势改变，耗尽区宽度也发生变化。

== 耗尽区宽度

根据一维泊松方程和近似均匀的受主掺杂浓度：

$ X_d = sqrt((2 epsilon_("si") abs(phi_s - phi_b))/(q N_A)) $

其中 $phi_s$ 为表面电势，$phi_b$ 为体区参考电势，$N_A$ 是 p 型衬底受主浓度。

== 单位面积耗尽电荷

$ Q_s = - sqrt(2 q epsilon_("si") N_A abs(phi_s - phi_b)) $

负号来自 p 型衬底被耗尽后留下的带负电受主离子。后续阈值方程应统一这一符号约定。

_本页式2.7与2.8整理为Typst；符号命名以正文解释为准，原书各变量下标尚待图文细校。_
