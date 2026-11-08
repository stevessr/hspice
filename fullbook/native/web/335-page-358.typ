// SOURCE PDF PAGE 358 / printed 339 / Fig 10.5 and Elmore first-moment integral.
// Arithmetic discrepancy preserved as printed: 0.054*1000/0.4 = 135 Ω,
// whereas the scanned textbook states 125 Ω; do NOT silently change the example.
// Strict full-page visual parity remains unverified.
#import "../figures/ch10-rc-elmore-native.typ": figure10more
#set document(title:"第10章 · 集总与分布RC波形、艾蒙延迟积分 · PDF358")
#set text(size:7.2pt)
#set par(justify:true,leading:2.5pt,spacing:3.7pt)
#align(center)[#text(size:8pt,weight:"bold")[第 10 章　连 线 设 计　339]]
#line(length:100%,stroke:.55pt)

对于密集排列的连线（间隔 3～4λ），$C_("int") = 0.2 " fF/µm"$；对于宽松排列的连线（间隔 30～40λ），$C_("int") = 0.1 " fF/µm"$。从保守的角度考虑，下面采用 $C_("int") = 0.2 " fF/µm"$。

为了确定 $RC$ 阶梯的延迟，考虑 0.18 μm 工艺中的铝线，设连线宽度为 $W = 0.4 " µm"$，$C_("int") = 0.2 " fF/µm"$，且 $R_("sq") = 0.054 " Ω/□"$。对 1 mm 长的连线，原书给出的总电阻与总电容为：

$ R_("wire") = 0.054 " Ω/□" times 1000/0.4 = 125 " Ω" $

$ C_("wire") = 0.2 " fF/µm" times 1000 " µm" = 200 " fF" $

于是，集总 $RC$ 延迟可算为 $0.7 R_("wire") C_("wire") = 0.7 times 125 " Ω" times 200 " fF" = 17.5 " ps"$，但实际延迟接近 10 ps。显然，必须采用更精确的方法来计算 $RC$ 阶梯的延迟。

因为 $R_("wire")$ 和 $C_("wire")$ 同时增加，我们可以假定响应时间按指数增长。实际的分布式 $RC$ 线上响应如图 10.5 所示；找到一种方便的途径来计算阶梯网络延迟，关键是检查两个图中曲线下方的面积，并建立两种响应之间的关系。

#figure10more(5)
#align(center)[#text(size:6.6pt)[图 10.5　集总 RC 与分布式 RC 的输出波形]]

图 10.5(a) 中曲线下的面积称作第一时刻脉冲响应，可以通过下式计算：

$ "面积" = integral_0^oo e^(-t/(R_("wire") C_("wire"))) dif t = R_("wire") C_("wire") $

由此得到集总 $RC$ 电路的精确时间常数。曲线下面积提供了一阶延迟信息。将同样的方法应用到图 10.5(b) 的分布式 $RC$ 波形，可以把曲线下的面积称为 $tau$：

$ "面积" = integral_0^oo v(t) dif t = tau $

这个量也是一阶时刻脉冲响应，电路设计人员通常称之为*艾蒙延迟*（Elmore delay）。它是网络的主导时间常数，也是对延迟的较好估计。通常直接计算此值较为困难，而 $RC$ 阶梯的艾蒙延迟可以通过每个节点电容与源节点到该节点相关电阻的乘积来求得。下一页给出计算方法。
