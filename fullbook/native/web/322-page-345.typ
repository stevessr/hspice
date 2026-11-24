// SOURCE PDF PAGE 345. Scan-guided original Typst excerpt and editable schematics.
// Not full-page 1:1 accepted; transistor topology and page geometry provisional.
#import "../figures/ch9-nonvolatile-ch10-interconnect-native.typ": figure9late
#set document(title:"第9章·非易失存储器·PDF345")
#align(center)[#text(size:8pt,weight:"bold")[326　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

*例9.4（续）：阈值变化计算*

两电容相等使耦合系数为1/2。编程前栅1阈值为1 V，则对栅2的外部阈值为2 V。把栅2升高到10 V时，浮栅电压升至5 V；热载流子注入后其电压降到2 V。

当外部栅2电压恢复0时，浮栅被耦合降低5 V，成为-3 V；正常栅2加5 V，浮栅回升到-0.5 V，仍低于1 V的导通阈值。为了使浮栅达到1 V，外部栅2至少需要8 V，所以编程后的外部阈值电压提高到8 V。

== EEPROM与FLOTOX

电可擦除可编程ROM（EEPROM或E²PROM）采用略有不同的单元结构。图9.25中，每位数据使用两个晶体管：一个浮栅存储管和一个选择管。浮栅绝缘层包含局部薄氧化层（约10 nm），便于电子通过Fowler–Nordheim（FN）隧穿。

#figure9late(25)
#align(center)[*图9.25　E²PROM的双管FLOTOX单元（可编辑剖面草图）*]

在约 $10^7 "V/cm"$ 的高电场下，薄氧化层能够产生FN隧穿电流。施加的电压极性决定浮栅电子是注入还是移出，因而既可编程也可擦除。

#figure9late(26)
#align(center)[*图9.26　10 nm氧化层的Fowler–Nordheim隧穿曲线（定性示意）*]
