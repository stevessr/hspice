// SOURCE PDF PAGE 335 / printed 316; scan-assisted editorial draft.
// Figures editable, original circuit-level wiring and geometry not strictly verified.
#import "../figures/ch9-dram-rom-native.typ": figure9later
#set document(title:"第9章·动态RAM与ROM·PDF335")
#align(center)[#text(size:8pt,weight:"bold")[316　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#figure9later(14)
#align(center)[*图9.14　1T DRAM 单元及存储电容（原生图元）*]

单个存储电容 $C_("cell")$ 存放高电平或低电平。为增加存储电荷，实际存储器经常提高字线电压，使访问晶体管导通时单元能够写入接近 $V_("DD")$ 的高电平，而不是受阈值电压限制的 $V_("DD")-V_("TN")$。

读取时单元电容与位线电容 $C_("column")$ 共享电荷。因为位线电容通常比单元电容大约一个数量级，读出电压变化比较小，必须用灵敏放大器检测。

电容面积与存储信号幅度相互制约。教材示意两种提高单位面积电容密度的结构：沟槽式电容与堆叠式电容。

#figure9later(15)
#align(center)[*图9.15　DRAM沟槽电容和堆叠电容（可编辑材料层结构草图）*]

传统工艺中的典型单元电容约20～30 fF，设计位线电容时必须考虑足够的读出差分摆幅。由于读操作本身改变了单元内存储的电荷，因此数据在每次读出后必须由感测电路再生写回，另外还需要周期性刷新。
