// SOURCE PDF PAGE 357 / printed 338 / chapter 10.2.2.
// Scan-guided editable reconstruction: original equation numbers, numeric units,
// 0.18/0.13 μm metal stacks and figure 10.4. Full-page 1:1 NOT accepted.
#import "../figures/ch10-rc-elmore-native.typ": figure10more
#set document(title:"第10章 · 连线方块电阻及艾蒙延迟引入 · PDF357")
#set text(size:7.1pt)
#set par(justify:true,leading:2.5pt,spacing:3.8pt)
#align(center)[#text(size:8pt,weight:"bold")[338　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

两种最普遍的连线材料是铝和铜。铝的电阻率为 $rho = 2.7 "µΩ·cm"$，铜的电阻率为 $rho = 1.7 "µΩ·cm"$。0.18 μm 铝工艺和 0.13 μm 铜工艺的金属层次如图 10.1 所示。

对于 0.18 μm 的五层铝工艺，假设 1～4 层导线厚度为 0.5 μm、第 5 层厚度为 1.0 μm，则薄层电阻近似为：

$ R_("sq") = rho/T = (2.7 " µΩ·cm")/(0.5 " µm") = 54 " mΩ/□" quad "Al 金属层 1—4" quad "(10.3)" $

$ R_("sq") = rho/T = (2.7 " µΩ·cm")/(1.0 " µm") = 27 " mΩ/□" quad "Al 金属层 5" $

对于 0.13 μm 的八层铜工艺，假设 1～6 层导线厚度为 0.4 μm，7～8 层厚度为 0.8 μm，薄层电阻近似为：

$ R_("sq") = rho/T = (1.7 " µΩ·cm")/(0.4 " µm") = 42 " mΩ/□" quad "Cu 金属层 1—6" $

$ R_("sq") = rho/T = (1.7 " µΩ·cm")/(0.8 " µm") = 21 " mΩ/□" quad "Cu 金属层 7—8" quad "(10.4)" $

给定这些参数，一段导线的实际电阻是：

$ R = R_("sq") (L/W) quad "(10.5)" $

其中 $L/W$ 是按照导线方块数计算的长宽比。对于给定工艺，$R_("sq")$ 为常数，因此只需计算方块数就可以得到导线的相对电阻。随着工艺发展，芯片上最长的导线的长度 $L$ 持续增加，而宽度 $W$ 往往减小，从而产生严重的 $"RC"$ 延迟问题。

== 10.2.2　艾蒙延迟的计算

在长导线中，增加的电阻对驱动门表现为一个分布的 $"RC"$ 负载，如图 10.4 所示。为简单起见，驱动器使用理想电压源表示。分布的 $"RC"$ 线路可转变为由 $n$ 段 $"RC"$ 阶梯构成的网络。总电阻是各独立电阻之和 $R_("wire") = n R_W$；总电容同理 $C_("wire") = n C_W$。

#figure10more(4)
#align(center)[#text(size:6.6pt)[图 10.4　以集总 RC 阶梯表示的分布式 RC 连线]]

计算延迟时使用连线每单位长度的电容 $C_("int")$。多层金属的 $C_("int")$ 不完全相同，而且电容本质上是分布的。为了便于手工计算，教材在这里假定各层有相同的平均 $C_("int")$，并考虑密集/宽松布线间距对它的影响。

#text(size:6.2pt)[注：作为比较，钨具有较高的电阻率，约 5.5 µΩ·cm。]
