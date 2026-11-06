// SOURCE PDF PAGE 108 / printed 89. Eq3.17, Fig3.13.
#import "../figures/bsim-effects-native.typ": short-channel-threshold
#set document(title:"第3章 · BSIM3阈值模型和短沟道效应 · PDF108")
#set text(lang:"zh")
= 第3章 · 印刷第89页

在BSIM3中，两个体效应系数构成的K1和K2使阈值电压随体偏压变化：

$ V_T = "VTH0" + "K1" (sqrt("PHI" - V_("BS")) - sqrt("PHI"))
  - "K2" V_("BS") quad "(3.17)" $

原书讨论沟道长度缩小时，短沟道效应SCE和反短沟道效应RSCE如何影响阈值。

#short-channel-threshold()

*图3.13　(a) 短沟道效应SCE；(b) 反短沟道效应RSCE。*

SCE（short-channel effect）：随着有效沟道长度减小，源漏耗尽区域影响沟道电势，阈值可能下降。RSCE（reverse short-channel effect）：某些掺杂分布在沟道缩小时反而使阈值上升。

原书指出，沟道杂质剖面及源漏附近的附加注入会影响这两种效应。阈值不仅由总体衬底掺杂决定，也取决于沟道表面和一定深度内的杂质浓度。

漏感应势垒降低DIBL（drain-induced barrier lowering）是另一种重要短沟道效应。当漏端电压增加时，源端附近的势垒降低，使阈值电压随 $V_("DS")$ 增加而下降，效果在下一页图3.14中展示。

对于短沟道器件，不同的体偏、源漏偏置和W/L尺寸共同影响有效阈值。教材强调必须使用实际工艺提取的BSIM3参数，不能在所有尺寸上套用固定的传统体效应参数。

_式3.17及SCE/RSCE基本变化方向核对源扫描，图3.13曲线仅为原生趋势重画。_
