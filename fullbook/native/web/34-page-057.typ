// Source PDF page 057 / printed page 38; threshold and body-effect factor.
#set document(title: "第2章 MOS阈值与体效应公式 · 原书第57页")
#set text(lang:"zh")

= 第2章 · 第38页

== 阈值电压的定义

以 NMOS p 型衬底的平带电压 $V_("FB")$、费米势和强反型所需的耗尽电荷为基础，可将无源体偏置时的阈值写成：

$ V_("T0") = V_("FB") + 2 abs(phi_("Fp")) + abs(Q_("B0"))/C_("ox") $

若把 $phi_("Fp")$ 和 $Q_("B0")$ 保持为带符号负量，则等价地有：

$ V_("T0") = V_("FB") - 2 phi_("Fp") - Q_("B0")/C_("ox") $

== 体效应

增加 NMOS 的源体反向偏压 $V_("SB")$ 会扩大耗尽区，阈值变化可写成：

$ V_T = V_("T0") + gamma (sqrt(2 abs(phi_("Fp")) + V_("SB")) - sqrt(2 abs(phi_("Fp")))) $

体效应系数：

$ gamma = sqrt(2 q epsilon_("si") N_A)/C_("ox") $

这里 $gamma$ 的量纲为 $sqrt("V")$，与阈值变化关系中的平方根电压相配。

== 例2.3：氧化层电容与体效应

原书以氧化层厚度22 Å求得单位面积氧化电容约 $1.6 times 10^(-6) " F/cm"^2$，并通过掺杂参数估算体效应系数。

对于 CMOS 反相器和传输门，源体偏置会使器件有效阈值变化，进而影响导通阻抗、传输电平和时序。

_本页式2.10—2.12的符号与物理含义已整理；完整数值中间步骤与原书页面布局仍需最终对照。_
