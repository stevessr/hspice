// SOURCE PDF PAGE 337 / printed 318; scan-assisted editorial draft.
// Figures editable, original circuit-level wiring and geometry not strictly verified.
#import "../figures/ch9-dram-rom-native.typ": figure9later
#set document(title:"第9章·动态RAM与ROM·PDF337")
#align(center)[#text(size:8pt,weight:"bold")[318　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

*例9.3（续）：电荷共享的定量解答*

存储“1”时，位线起初为 $V_("DD")/2$，单元电容起初为 $V_("DD")$。忽略其他损失，根据电荷守恒：

#align(center)[$(V_("DD")/2) C_("column") + V_("DD") C_("cell") = V^"*" (C_("column")+C_("cell"))$]

因此：

#align(center)[$V^"*" = ((V_("DD")/2) 10 C + V_("DD") C)/(10 C+C) = 0.55 V_("DD")$]

存储“0”时，单元电容初始电压为0：

#align(center)[$(V_("DD")/2) C_("column") + 0 times C_("cell") = V^"*" (C_("column")+C_("cell"))$]

对应位线电压：

#align(center)[$V^"*" = ((V_("DD")/2) 10 C)/(10 C+C) = 0.45 V_("DD")$]

理想比较电平是 $0.5V_("DD")$，两个结果分别高出与低于参考电平 $0.05V_("DD")$。当 $V_("DD")=1.8 "V"$ 时，差值约为90 mV，教材记为约90～100 mV。

图9.17展示触发器式检测/刷新电路：预充均衡器件先使两边相等，字线选通形成差分，之后开启上拉与下拉感测使能器件，依靠交叉耦合反相器的再生性使差分转换为全摆幅信号，并把该信号写回DRAM单元。

#figure9later(17)
#align(center)[*图9.17　触发器类型检测—刷新电路（原生可编辑框图）*]
