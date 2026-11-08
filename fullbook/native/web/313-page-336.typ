// SOURCE PDF PAGE 336 / printed 317; scan-assisted editorial draft.
// Figures editable, original circuit-level wiring and geometry not strictly verified.
#import "../figures/ch9-dram-rom-native.typ": figure9later
#set document(title:"第9章·动态RAM与ROM·PDF336")
#align(center)[#text(size:8pt,weight:"bold")[317　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

检测小幅单端位线电压变化并不容易。图9.16采用位线折半结构（split bitline）：把位线拆成两段，电容尽量相等，每侧连接灵敏放大器的一端。使用与普通单元类似的虚拟单元，令另一侧生成合适的比较参考。

#figure9later(16)
#align(center)[*图9.16　1T DRAM阵列与位线折半、灵敏放大器及虚拟单元*]

预充阶段把两侧位线置于 $V_("DD")/2$，同时把虚拟单元也置于相同的电平。读选中正常字线时，灵敏放大器的另一边激活对应虚拟单元，消除或减少时钟馈通和共模噪声引起的误差。

若单元保存“1”，则选中侧位线的电压将略高于预充电平；保存“0”则略低于预充电平。这一微小差分决定再生型灵敏放大器最终稳定到哪一种逻辑值。感测完成后，原单元的内部节点电压也恢复到正确的存储电平。

*例9.3　DRAM中“1”和“0”的位线电压*

题设：位线预充 $V_("DD")/2$，虚拟单元参考电平同为 $V_("DD")/2$；写入“1”时单元电容电压为 $V_("DD")$；位线电容是单元电容的10倍，即 $C_("column")=10C$、$C_("cell")=C$。求分别读取“1”与“0”时的位线电压，并说明参考电平的作用。
