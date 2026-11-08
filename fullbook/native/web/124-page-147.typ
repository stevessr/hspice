// SOURCE PDF PAGE 147 / printed 128
// 4.12: four panels (circuit, load line, VTC, through-current); scan proofread 2026-11-08.
// Source check: PMOS current convention is POSITIVE (flows out of drain); use voltage magnitudes.
#import "../figures/ch4-figure-4-12-native.typ": fig412-circuit, fig412-loadline, fig412-vtc, fig412-current
#set document(title:"第4章 · 图4.12 CMOS反相器四子图及五工作区 · PDF147")
= 第4章 · 印刷第128页

== 图4.12　CMOS反相器的特性
#grid(columns:(1fr,1fr),gutter:4pt,
  fig412-circuit(),
  fig412-loadline(),
  fig412-vtc(),
  fig412-current(),
)
*图4.12*　(a) CMOS反相器，(b) 负载线，(c) 电压传输特性和电流转移特性。四个子图以可编辑的 Typst 线条重绘；曲线形状属于定性近似，并非扫描像素或 SPICE 采样数据。

观察图4.12(a)的各节点连接，可以计算出 n 沟道器件的漏电流。当 n 沟道器件正常工作时，其 $V_("GS")$、$V_("DS")$ 和 $V_("TN")$ 都为正值。PMOS 晶体管的漏电流 $I_("DS")$ 定义为流出漏端的电流，因此有一个正值。在分析PMOS晶体管的过程中，另一种简单处理符号变化的方法是，在漏电流计算公式中将各电压取绝对值。使用这种方法时，必须仔细检查 PMOS 器件是否处于正常工作偏置；有电流流过时，其栅极电位应比源极电位至少低一个阈值电压的绝对值。

图4.12(c) 的电压传输特性及噪声容限可由五个区域分析。按输入 $V_("in")$ 从 $0$ 逐渐增加到 $V_("DD")$ 的顺序，分别为区域 I 到区域 V。

*区域 I：n-off, p-lin。* NMOS处于截止区，PMOS处于线性工作区（尽管其 $V_("DS")=0$）。在 $V_("in")=V_("TN")$ 之前，输出保持在 $V_("OH")=V_("DD")$。

*区域 II：n-sat, p-lin。* NMOS导通并处于饱和区；PMOS晶体管由于漏源电压较小，仍处于线性区。其电流关系为：
$ I_("DN")("sat") = I_("DP")("lin") $

由上述条件代入两种MOS工作区的电流表达式，可求得该区的电压传输特性。完整电流平衡方程在原书下一页继续展开。
