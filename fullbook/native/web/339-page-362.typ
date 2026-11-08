// SOURCE PDF PAGE 362 / printed 343. Example 10.2 conclusion and 10.3 source equations.
// Source numerical assumptions retained: 20mm M5, 0.5μm, 0.1 fF/μm, 100X.
// Original π-network wire/source topology is redraw, not pixel-perfect.
#import "../figures/ch10-rc-elmore-native.typ": figure10more
#set document(title:"第10章 · 例10.2的92.6ps与例10.3的1.3ns · PDF362")
#set text(size:7.2pt)
#set par(justify:true,leading:2.5pt,spacing:4pt)
#align(center)[#text(size:8pt,weight:"bold")[第 10 章　连线设计　　　　　　　　　343]]
#line(length:100%,stroke:.55pt)

用艾蒙延迟进行计算得到：

$ tau_("driver") = (6.25 " kΩ")(3.2 " fF") + (6.25 " kΩ"+5.4 " Ω")(11.6 " fF") $

$ = 92.6 " ps" $

*结论：* 导线电阻的引入对结果没有产生明显变化。

上面的例子说明短导线可以（并且应该）用集总电容处理，其计算几乎或根本没有错误。短导线的定义取决于工艺，但是典型的几 μm 长或长到 20 μm 这样的导线应该用集总电容处理。芯片上超过 90% 的导线是短导线，所以也可以用这种方法处理。

当连线的长度相对较短时，以上的分析是合适的，但当连线很长时并不合适。对后面这种情况，导线应该按分布式 RC 连线处理，而不应该作为一个简单的集总电容。可以考虑下面的例子来说明长导线的影响。

== 例 10.3　驱动长导线的反相器延迟

*问题：* 考虑一条独立的第 5 层铝导线，长 20 mm 并且由一个 100X（也就是比最小反相器尺寸大 100 倍）的反相器驱动。由于导线是独立的，其电容是 0.1 fF/μm。假设导线的宽度是 0.5 μm，估计总的线电阻和总的线电容。用艾蒙 π 模型计算从输入反相器到导线终点的传输延迟是多少？

*解答：*

导线电阻是：

$ R_("wire") = R_("int") L = (0.027 " Ω/□") / (0.5 " µm") times (20 000 " µm") = 1080 " Ω" $

导线电容是：

$ C_("wire") = C_("int") L = (0.1 " fF/µm")(20 000 " µm") = 2 " pF" $

反相器导通电阻是：

$ R_("eff") = R_("eqn")/100 = (12.5 " kΩ")/100 = 125 " Ω" $

反相器输出电容是：

$ C_("self") = C_("eff") (2W+W) 100 = (1 " fF/µm")(0.6 " µm")100 = 60 " fF" $

结电容可以忽略，因为它很小。使用 π 模型，该模型中导线电容分为两半，但是使用完整的导线电阻；因此网络由 125 Ω 驱动电阻、1080 Ω 连线电阻和两个 1 pF 对地电容组成。

$ tau_("Elmore") = (125 " Ω")(1 " pF") + (125 " Ω"+1080 " Ω")(1 " pF") approx 1.3 " ns" $

为了分析长导线的大延迟，我们在图 10.9 中绘制了 4 扇出门延迟和几个在不同工艺尺寸下不同导线长度的导线延迟。
