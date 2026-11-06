// Source PDF page 050 / printed page 31; PMOS structure.
#import "../figures/semiconductor-native.typ": pmos-well
#set document(title: "第2章 图2.2 PMOS结构 · 原书第50页")
#set text(lang: "zh")

= 第2章 · 第31页

== 图2.2：PMOS晶体管的结构与符号

#pmos-well()

*图2.2　PMOS横截面的原生示意。* PMOS 的源漏通常为 p+ 扩散区，导电沟道由空穴构成，器件可以制作在 n 型阱或 n 型衬底内。

对于 PMOS，通常需要栅极相对于源极足够低，使栅下形成 p 沟道。在 CMOS 电路中，PMOS 常位于上拉网络，NMOS 常位于下拉网络。

== NMOS与PMOS偏置对照

#table(
  columns:(1fr,1.3fr,2.0fr),
  table.header([*器件*],[*典型衬底*],[*增强型导通条件*]),
  [NMOS],[p型区域],[$V_("GS") > V_("TN")$],
  [PMOS],[n阱或n型区域],[$V_("SG") > abs(V_("TP"))$],
)

表中的 $V_("TN")$ 为 NMOS 阈值，$V_("TP")$ 通常按负号约定描述 PMOS 阈值。使用 $V_("SG")$ 可以避免 PMOS 的极性混淆。

_原图2.2还包含更精细的截面位置和体端连接；当前尚未通过几何精校。_
