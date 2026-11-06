// Source PDF page 056 / printed page 37; threshold onset and substrate bias.
#set document(title: "第2章 强反型与耗尽电荷 · 原书第56页")
#set text(lang:"zh")

= 第2章 · 第37页

== 强反型条件

在 p 型 NMOS 衬底上，当半导体表面电势达到约两倍费米势幅值时，表面电子浓度达到与衬底掺杂浓度相当的条件，通常作为强反型的近似判据：

$ abs(phi_s - phi_b) approx 2 abs(phi_("Fp")) $

例2.1中，原书采用130 nm技术、受主掺杂浓度约 $3 times 10^17 " cm"^(-3)$ 的参数，得到 $2 abs(phi_("Fp")) approx 0.88 " V"$。这里给出的数值是书中例题条件，不是所有工艺通用值。

== 反型边界处的耗尽电荷

在零源体偏压下：

$ Q_("B0") = - sqrt(2 q epsilon_("si") N_A (2 abs(phi_("Fp")))) $

当源体之间存在反向偏压 $V_("SB")$，对应近似为：

$ Q_B = - sqrt(2 q epsilon_("si") N_A (2 abs(phi_("Fp")) + V_("SB"))) $

随着 $V_("SB")$ 增大，耗尽区通常变宽，使达到强反型所需的栅压升高。

== 例2.2：反向体偏置

源体偏压进入电荷平衡公式时，应注意 $Q_B$ 本身为负，不能把它当作正的电容电荷直接相加。

_本页正文、例2.1/2.2数值为按原书知识选段整理；完整推导式与原公式编号待最后校验。_
