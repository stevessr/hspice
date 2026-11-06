// Source PDF page 064 / printed page 45. Historical field examples and Fig 2.11.
#import "../figures/mos-velocity-native.typ": short-channel-iv
#set document(title:"第2章 · 深亚微米I-V数据与电场趋势 · PDF64页")
#set text(lang:"zh")

= 第2章 · 印刷第45页

== 图2.11　0.18 μm 工艺的 MOS 电流—电压特性

#short-channel-iv()

*图2.11　(a) $I_("DS")$—$V_("DS")$；(b) $I_("DS")$—$V_("GS")$。* 原书分别取 $V_("GS") = 0.9, 1.35, 1.8 " V"$ 或不同漏极偏置，说明电流随栅压变化比平方律更接近线性，并且漏极电压增大时会提前饱和。本图为可编辑示意，实验散点仍需逐点数字化校对。

== 2.5.1　高电场的影响

原书通过历史工艺条件比较横向场 $E_y = V_("DS")/L$：

#table(columns:(1fr,1.4fr,2.2fr),
  table.header([*年份*],[*假定供电/长度*],[*横向场*]),
  [1980],[$5 " V"/5 " μm"$],[$1.0 times 10^4 " V/cm"$],
  [1995],[$3.3 " V"/0.35 " μm"$],[$9.4 times 10^4 " V/cm"$],
  [2001],[$1.2 " V"/0.1 " μm"$],[$1.2 times 10^5 " V/cm"$],
)

近表面垂直场可由 $E_x approx V_("DD")/t_("ox")$ 粗估：

#table(columns:(1fr,1.4fr,2.2fr),
  table.header([*年份*],[*供电/氧化层厚度*],[*垂直场*]),
  [1980],[$5 " V"/1000 " Å"$],[$5.0 times 10^5 " V/cm"$],
  [1995],[$3.3 " V"/75 " Å"$],[$4.4 times 10^6 " V/cm"$],
  [2001],[$1.2 " V"/22 " Å"$],[$5.5 times 10^6 " V/cm"$],
)

横向场增强使漂移速度不再线性依赖场强；垂直场增强影响表面迁移率。上述三个年份及取值是教材历史技术比较，并不代表当前工艺。

_原图2.11的测量点没有逐点数字化，示意曲线不可视为定量结果。_
