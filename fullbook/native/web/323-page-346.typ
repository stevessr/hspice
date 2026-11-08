// SOURCE PDF PAGE 346. Scan-guided original Typst excerpt and editable schematics.
// Not full-page 1:1 accepted; transistor topology and page geometry provisional.
#import "../figures/ch9-nonvolatile-ch10-interconnect-native.typ": figure9late
#set document(title:"第9章·非易失存储器·PDF346")
#align(center)[#text(size:8pt,weight:"bold")[327　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

E²PROM可以通过FN隧穿实现电擦除，但薄氧化层与额外选择器件使其位面积大于单管EPROM。尽管FLOTOX单元可以承受多次擦写，仍要考虑氧化层应力、寿命和擦写时间。

图9.27给出了典型FLOTOX EEPROM阵列的编程与擦除偏置方案。写入时，在选中控制栅与源漏之间建立足够的电场；未选中的字线与位线应使用适当偏压，避免产生意外隧穿。

#figure9late(27)
#align(center)[*图9.27　E²PROM存储阵列及编程/擦除偏置（编辑示意）*]

图9.28给出EPROM阵列结构。由于EPROM各浮栅存储晶体管必须在行列交叉点被寻址，可将普通的行译码器、列多路器及读出器与浮栅单元组成阵列。和SRAM相比，浮栅上不需要持续供电才能保存状态。

#figure9late(28)
#align(center)[*图9.28　EPROM阵列（原生可编辑拓扑草图）*]

在器件编程期间，未选择器件可能承受非期望的部分电压；可靠性设计需要检查阈值分布、漏电、隧穿电场和误编程风险。
