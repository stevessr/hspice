// SOURCE PDF PAGE 233 / printed 214. Fig6.23-6.24 and Ex6.9 first half.
#import "../figures/ch6-path-sizing-native.typ": fig623, fig624
#set document(title:"第6章 · 不同γ的最优扇出与例6.9 · PDF233")
#align(center)[#text(size:8pt,weight:"bold")[214　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.5pt)

#fig623()
#align(center)[*图6.23　不同γ值的延迟与扇出 $f$ 的关系*]

在式（6.23）中，这个值是当 $gamma=0$ 时得到的，这意味着结电容被忽略了。在图6.23中 $gamma=0$ 的曲线上，也可以得到最优值为 $e$。这种确定尺寸的方式如图6.24所示。如今，结电容和连线电容可以使反相器所需的驱动能力增加：在0.13 μm工艺中，$gamma=0.5$。因此，选择 $f=3$ 或者 $f=4$ 更为合适。通常，使用 $f=4$ 的值并给与之相应的延迟一个特殊的名字：扇出为4的延迟（FO4延迟）。按照FO4规则三级反相器链的尺寸如图6.24所示，其中每一个后级反相器的尺寸是前一级反相器尺寸的4倍。

#fig624()
#align(center)[*图6.24　延迟最优化时的反相器尺寸*]

#line(length:100%,stroke:.5pt)

*例6.9　确定反相器链的最佳尺寸*

*问题：* 计算一个三级反相器链的最佳反相器扇出比率 $f$，设 $C_("load")=200 " fF"$，$C_("in")=1 " fF"$。采用最佳级数值重新计算 $f$ 的值。然后，计算这两种情况下通过该反相器链的延迟，假设 $tau_("inv")=7.5 " ps"$，$gamma=0.5$。

*解答：*

利用如下事实：

#align(center)[$N ln f = ln(C_("load")/C_("in"))$]

因此：

#align(center)[$ln f = (1/3) ln(200)$]

#align(center)[$therefore f=200^(1/3) approx 5.84$]