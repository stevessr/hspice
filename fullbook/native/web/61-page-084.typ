// Source PDF 084 / printed 65; P2.1–P2.5 and two native circuit drawings.
#import "../figures/mos-ch2-end-native.typ": four-bias-cases, mos-charge-cases
#set document(title:"第2章 · 习题P2.1—P2.5 · PDF084")
#set text(lang:"zh")
= 第2章 · 印刷第65页

== P2.1（续）

(b) NMOS 通常使用 $n^+$ 多晶硅栅，PMOS 通常使用 $p^+$ 多晶硅栅。若 PMOS 改用施主掺杂多晶硅栅，分析 $V_("T0")$ 的变化，并计算新的 $V_("T0")$。

(c) 希望通过调节 NMOS 与 PMOS 阈值得到 $V_("TON")=+0.4 " V"$、$V_("TOP")=-0.4 " V"$，求(a)、(b)两种情况下所需的阈值注入量。

(d) 为什么现代工艺中常用 NMOS 的 $n^+$ 多晶硅栅和 PMOS 的 $p^+$ 多晶硅栅？

== P2.2　高垂直电场中的PMOS迁移率

在 $t_("ox")=22 " Å"$、$abs(V_("GS")-V_T)=0.8 " V"$ 情形下，求 PMOS 的有效迁移率 $mu_e$；题设 $theta=4 times 10^6 " V/cm"$、$eta=1.85$，低场 $mu_0=130 " cm"^2/("V" dot "s")$。

== P2.3　0.13 μm MOS I—V 特性

为 NMOS、PMOS 建立宽长比均为 $W/L=1$、$W=L=100 " nm"$、供电1.2 V的 I—V 曲线。

(a) 栅源电压分别取0、0.4、0.8、1.2 V，绘制 $I_("DS")$—$V_("DS")$。

(b) 在 $V_("DS")=1.2 " V"$ 下研究随 $V_("GS")$ 改变的漏电流，并判断深亚微米器件的二次律是否仍成立。

== P2.4　四组NMOS的工作区

设 $V_("T0")=0.4 " V"$，判定各电路的截止、线性或饱和状态。图中每组按“漏极／栅极／源极”电压列出：

#four-bias-cases()

*图P2.4*　(a) 1.2/0.2/0 V；(b) 1.2/1.2/1.1 V；(c) 0.2/1.2/0 V；(d) 1.2/1.0/0.2 V。

== P2.5　NMOS传输电容充电

设电容起始放电，$V_x=0$、$V_("T0")=0.4 " V"$。两组电路栅压均为1.2 V，漏端分别固定1.0 V和0.6 V，求稳定时 $V_x$。

#mos-charge-cases()

*图P2.5*　(a) 漏1.0 V；(b) 漏0.6 V。电容位于源端至地之间，MOS体端接地。

_图P2.4/P2.5原生示意保留四个偏置值和节点关系，但器件符号尺寸未与原扫描逐像素核验。_
