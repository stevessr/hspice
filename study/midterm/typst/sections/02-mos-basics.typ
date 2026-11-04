// GENERATED FILE -- edit Markdown and run scripts/sync_typst.py
= MOS 晶体管的基础与工作状态
<mos-晶体管的基础与工作状态>
== 四个端口及电压定义
<四个端口及电压定义>
MOS 晶体管通常包含漏极 D、栅极 G、源极 S、衬底 B（体端）。对于 NMOS，常按下列电压定义：

$ V_(upright(G S)) = V_G - V_S , #h(2em) V_(upright(D S)) = V_D - V_S , #h(2em) V_(upright(S B)) = V_S - V_B . $

#strong[源极是分析时的电位参考端，不能把“某节点电压”和“栅源电压”混为一谈。];若源极处于 $0.8 thin upright(V)$，栅极对地 $1.4 thin upright(V)$，则 $V_(G S) = 0.6 thin upright(V)$，而不是 $1.4 thin upright(V)$。

PMOS 通常使用正值的 $V_(S G) = V_S - V_G$、$V_(S D) = V_S - V_D$ 和 $lr(|V_(T P)|)$ 来描述；这比直接代入负的 PMOS 阈值电压更便于记忆。NMOS 的衬底常接电路最低电位，PMOS 的阱（体端）常接最高电位，以防止源／漏—体 pn 结意外正向偏置。

== NMOS 的三个主要工作区域
<nmos-的三个主要工作区域>
定义 $V_(O V) = V_(upright(G S)) - V_(upright(T H))$，它称为#strong[过驱动电压];。在 $V_(upright(D S)) gt.eq 0$、无明显亚阈值导电且采用长沟道平方律近似时：

#figure(
align(center)[#table(
  columns: 3,
  align: (col, row) => (left,left,left,).at(col),
  inset: 6pt,
  [#strong[区域];], [#strong[判断条件];], [#strong[主要特征];],
  [截止区],
  [$V_(upright(G S)) lt.eq V_(upright(T H))$],
  [理想模型中 $I_D tilde.eq 0$；实际存在漏电流。],
  [线性／三极管区],
  [$V_(upright(G S)) > V_(upright(T H))$, $0 lt.eq V_(upright(D S)) < V_(O V)$],
  [沟道贯通，$I_D$ 随 $V_(D S)$ 增加。],
  [饱和区],
  [$V_(upright(G S)) > V_(upright(T H))$, $V_(upright(D S)) gt.eq V_(O V)$],
  [漏端沟道夹断；理想长沟道电流近似不随 $V_(D S)$ 变化。],
)]
)

$ I_(D , upright(l i n)) & approx mu_n C_(o x) W / L [(V_(upright(G S)) - V_(upright(T H))) V_(upright(D S)) - V_(upright(D S))^2 / 2] ,\
I_(D , upright(s a t)) & approx 1 / 2 mu_n C_(o x) W / L (V_(upright(G S)) - V_(upright(T H)))^2 . $

$mu_n$ 为电子迁移率，$C_(o x)$ 为单位面积栅氧化层电容，$W$ 和 $L$ 分别为沟道宽度与长度。以上是#strong[理解趋势与完成基础计算];的公式，不应当替代深亚微米工艺模型的精确仿真。

#quote(block: true)[
饱和不等于完全无电流变化。受沟道长度调制、速度饱和等影响，实测 $I_D - V_(D S)$ 的“饱和段”往往仍有一定正斜率。#strong[栅极控制电流、漏极改变电流分布、体端影响阈值电压];是解释实验曲线的主线。
]

== 如何阅读两类伏安特性曲线
<如何阅读两类伏安特性曲线>
#emph[（示意图参阅原讲义 PDF；此处保留理论说明。）]

当横轴为 $V_(D S)$、每条曲线对应不同 $V_(G S)$ 时，得到#strong[输出特性族];；横轴为 $V_(G S)$、每条曲线对应不同 $V_(D S)$ 时，得到#strong[转移特性族];。实验一要求通过调整 `.dc` 的扫描次序，将前者改为后者。

#quote(block: true)[
#strong[题型：根据电压判断工作区域。];某 NMOS 的 $V_G = 1.2 thin upright(V)$、$V_S = 0.2 thin upright(V)$、$V_D = 0.8 thin upright(V)$，设 $V_(T H) = 0.4 thin upright(V)$。则 $V_(G S) = 1.0 thin upright(V)$、$V_(D S) = 0.6 thin upright(V)$、$V_(O V) = 0.6 thin upright(V)$，处于理想模型的饱和边界。若只依据 $V_G = 1.2 thin upright(V)$ 判断，会忽视源极抬升。
]

== PMOS 的判别与电流方向
<pmos-的判别与电流方向>
PMOS 在 $V_(S G) > lr(|V_(T P)|)$ 时形成导电沟道；长沟道饱和判据为 $V_(S D) gt.eq V_(S G) - lr(|V_(T P)|)$。在输出特性图上，若坐标使用 $V_(D S) = V_D - V_S$ 与从漏到源定义的有符号 $I_D$，PMOS 常位于负电压、负电流象限；若改用 $V_(S D)$ 与 $lr(|I_D|)$，曲线可在第一象限表示。#strong[必须先确认坐标和电流正方向，不能只凭正负判定结果错误。];（资料对应：实验二。）

== 短沟道效应的基本认识
<短沟道效应的基本认识>
深亚微米工艺中，器件电流特性会偏离平方律。应能解释：#strong[速度饱和];会使高电场下电流对栅压的依赖减弱；#strong[沟道长度调制];使饱和区电流随漏压上升；#strong[体效应];使体源反向偏置增大时阈值升高。由于这些效应共同存在，手算结果与 HSPICE 工艺模型的曲线不完全一致是正常的，但需要先排除节点、单位与偏置设置错误。
