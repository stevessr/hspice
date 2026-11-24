// SOURCE PDF PAGE 334 / printed 315; scan-assisted editorial draft.
// Figures editable, original circuit-level wiring and geometry not strictly verified.
#import "../figures/ch9-dram-rom-native.typ": figure9later
#set document(title:"第9章·动态RAM与ROM·PDF334")
#align(center)[#text(size:8pt,weight:"bold")[315　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

三晶体管（3T）DRAM的读、写选择字线必须分别控制，否则读取过程中可能丢失存储电容上的电荷。尽管图9.13分别画出输入和输出位线，实际实现也可通过更复杂的列I/O电路共享线路。

#figure9later(13)
#align(center)[*图9.13　三管（3T）DRAM单元（可编辑结构草图）*]

每一个读写周期的第一阶段预充列线。写入“1”时，列输入为高，再打开写存取管把高电平传递到存储节点；写入“0”时，则打开写管并利用列下拉设备将存储节点放电。

读操作开始时，读列线已经预充。如果节点存“1”，对应下拉器件导通，读列线通过串联管放电；存“0”则没有有效放电路径，读列线维持高电平。故单元本身的读出信号与写入数据的极性相反，需在读或写路径增加反相恢复极性。

这个结构可以重复读取而不直接把节点电荷与读列线分享，不过晶体管漏结与亚阈值泄漏仍然要求刷新。读取与回写流程可沿整行并行完成。

=== 9.4.2　单管动态单元

单管（1T）DRAM由一个访问晶体管与一个存储电容构成，图9.14。其密度高于3T结构，但读取时内部电荷必须与位线电容共享，因此属于破坏性读取。
