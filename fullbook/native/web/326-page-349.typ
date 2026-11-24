// SOURCE PDF PAGE 349. Editable source-guided editorial selection, strict page 1:1 not accepted.
#import "../figures/ch9-nonvolatile-ch10-interconnect-native.typ": figure9late,figure10,fig-summary
#set document(title:"数字集成电路第9章·PDF349")
#align(center)[#text(size:8pt,weight:"bold")[330　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

图9.32给出了典型的Flash阵列。编程/读出时，通过行译码选定一条字线，通过列选择决定相应位线；源极选择和位线选择器件使串行存储单元串与外部读取电路连接。实际单元的阈值决定读出电流，感测放大器需要将电流或电压差转换为满摆幅逻辑。

#figure9late(32)
#align(center)[*图9.32　Flash存储器内部阵列（原生可编辑逻辑草图）*]

== 9.8　FRAM

铁电存储器（FRAM，ferroelectric RAM）利用铁电材料的剩余极化保存信息。与依靠泄漏电荷维持的DRAM不同，极化状态在撤去外电场后仍能保持，因此FRAM可具有非易失性。

铁电电容的正反两种剩余极化状态对应存储“0”和“1”。读出时通过电场变化判断极化翻转是否发生；部分铁电存储器的读出属于破坏性读取，之后需要再写回。和Flash的隧穿或热载流子编程不同，FRAM的写入通常主要依赖铁电极化反转。

FRAM单元可以使用一个访问晶体管与铁电电容。字线控制访问，位线负责写入与读取；外部灵敏放大器根据极化翻转时的电荷差异判定状态。
