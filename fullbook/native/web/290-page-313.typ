// SOURCE PDF 313 / printed 294. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第8章·半导体存储器设计·PDF313")
#align(center)[#text(size:8pt,weight:"bold")[294　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

#figure8(21)
#align(center)[*图8.21　差分灵敏放大器检测0与1的两种工作状态*]

教材说明，差分电压放大器典型可在约100～200 mV的位线差分电压下工作。输出转换速度与偏置电流成正相关，而静态功耗也随该电流增加。因此感测延迟、功耗和可检测输入摆幅相互约束。

对驱动负载电容 $C_("out")$ 的近似恒定输出电流 $I_("SS")$，输出斜率及延迟可写成：

#align(center)[$abs((dif V_("out"))/(dif t)) approx I_("SS")/C_("out")$]
#align(center)[$t_("sense") approx C_("out") Delta V_("out")/I_("SS")$]
#align(center)[$P_("static") approx V_("DD") I_("SS")$]

输入差分对的尺寸影响过驱动电压与需要的位线摆幅；其他晶体管尺寸则由稳态偏置需求共同决定。

另一种感测方案是基于交叉耦合锁存器的再生式感测放大器，如图8.22所示。它只在感测使能期间工作，可以减少静态耗电，但使能过早或存在噪声时可能发生错误翻转。
