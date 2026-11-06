// Source PDF page 052 / printed page 33; threshold voltage physics.
#import "../figures/semiconductor-native.typ": energy-bands
#set document(title: "第2章 阈值电压和载流子浓度 · 原书第52页")
#set text(lang: "zh")

= 第2章 · 第33页

== 图2.4：硅的能带与载流子

#energy-bands()

*图2.4　导带底、费米能级和价带顶的可编辑示意。* 原扫描图还区分本征和不同掺杂下的费米能级位置，完整相对位置尚待核对。

本征硅的电子浓度和空穴浓度相等，用 $n_i$ 表示本征载流子浓度。按教材的历史工艺参数，室温附近常用 $n_i approx 1.45 times 10^10 " cm"^(-3)$。

== 载流子平衡与质量作用定律

在平衡条件下：

$ n p = n_i^2 $

由该关系，若已知多数载流子的平衡浓度，可估算少数载流子浓度。例如 p 型半导体的空穴近似由受主掺杂主导时，有：

$ n approx n_i^2 / N_A $

其中 $N_A$ 为受主掺杂浓度；对应地，n型半导体的多数载流子由施主浓度 $N_D$ 决定。

== 费米势

以本征费米能级为参考，载流子浓度与费米势的关系可以写成：

$ phi_("Fn") = (k T)/q ln(n/n_i) $

$ phi_("Fp") = (k T)/q ln(n_i/p) $

这里 $k$ 为玻尔兹曼常数，$T$ 为绝对温度，$q$ 为电子电荷量的大小。

_本页公式已经编辑为Typst数学表达；原书标号2.1—2.3、表注及完整正文位置仍需比对。_
