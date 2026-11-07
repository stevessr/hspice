// SOURCE PDF PAGE 232 / printed 213. Formula 6.21–6.23, geometric gate sizing.
#import "../figures/ch6-path-sizing-native.typ": fig622
#set document(title:"第6章 · 反相器链最佳几何比和总延迟 · PDF232")
#align(center)[#text(size:8pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　　213]]
#line(length:100%,stroke:.5pt)

#align(center)[$(partial D_j)/(partial W_j) = tau_("inv") (1/(W_(j-1)) - (W_(j+1))/(W_j^2)) = 0$]
#align(center)[$therefore (W_j)/(W_(j-1)) = (W_(j+1))/(W_j)$]
#align(center)[$therefore W_j = sqrt(W_(j-1) W_(j+1))$]

由此产生了一个重要的结果：为了获得最小延迟，中间反相器的尺寸应该是前一级反相器和下一级反相器尺寸的几何平均值。在这种情况下，几何平均值就是平方根，因为我们只考虑两级。一般而言，如果一次优化整个 $N$ 级的反相器链，那么它是 $N$ 次方根。

一种获得几何尺寸的方式是使用一个扇出因子 $f$ 来增加每一级反相器的尺寸，该扇出因子可以用输入电容、输出电容和级数之间的关系决定。一般的情况如图6.22所示。每一级驱动一个是其自身尺寸 $f$ 倍的反相器。按照最优化的要求，每一个反相器的尺寸是其前级和后级反相器尺寸的几何平均值。注意一个有趣的现象，由于每一个反相器驱动一个是自身 $f$ 倍的反相器，所以通过每一个门的延迟必定相同。总延迟就是一个反相器延迟的 $N$ 倍。

#fig622()
#align(center)[*图6.22　与非门的串联链*]

由于 $f$ 和 $N$ 都是未知的，所以可以使用它们之间的关系来确定最佳值。参考图6.22，可以得到：

#align(center)[$f^N C_("in") = C_("load")$]

#align(center)[$therefore N = (ln (C_("load")/C_("in")))/(ln f) quad "(6.21)"$]

根据式（6.19），门延迟和总延迟可以写成：

#align(center)[$"门延迟" = tau_("inv") ((C_j)/(C_(j-1))+gamma_("inv"))$]
#align(center)[$"总延迟" = N times tau_("inv") ((C_j)/(C_(j-1))+gamma_("inv")) quad "(6.22)"$]

将式（6.21）代入，并设 $f=C_(j+1)/C_j$，得到：

#align(center)[$"总延迟" = (ln (C_("load")/C_("in")))/(ln f) times tau_("inv") (f+gamma_("inv")) quad "(6.23)"$]

图6.23给出了总延迟作为 $f$ 和 $gamma$ 的函数的曲线。该曲线指出 $f$ 的最优值在2.5到4之间。曲线非常平缓，所以在这一范围内的任何值都是合适的，并且由 $gamma$ 决定。在以前的教材中，$f$ 的最优值视做指数值 $e$。