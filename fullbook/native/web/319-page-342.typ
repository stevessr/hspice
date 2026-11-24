// SOURCE PDF PAGE 342. Scan-guided original Typst excerpt and editable schematics.
// Not full-page 1:1 accepted; transistor topology and page geometry provisional.
#import "../figures/ch9-nonvolatile-ch10-interconnect-native.typ": figure9late
#set document(title:"第9章·非易失存储器·PDF342")
#align(center)[#text(size:8pt,weight:"bold")[323　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 9.6　EPROM和EEPROM

只读存储器制造完成后无法简单改变掩膜设置。可擦除可编程ROM（EPROM）使用具有浮栅（floating gate）的MOS晶体管，利用保存在绝缘浮栅上的电荷改变晶体管有效阈值，从而写入并长期保持数据。

图9.22(a)是浮栅晶体管的示意截面：普通栅与导电沟道之间增加一个由氧化层隔离的浮置多晶硅电极。外部控制栅称为栅2，浮栅称为栅1，分别对应耦合电容 $C_2$ 和氧化层电容 $C_1$。

#figure9late(22)
#align(center)[*图9.22　EPROM单元的浮栅结构与等效电容（可编辑重绘）*]

忽略其他寄生电容时，栅1通过两个串联电容耦合到控制栅与沟道。浮栅上的净电荷改变等效阈值电压。编程时把电子注入浮栅，浮栅电位下降，导致晶体管的外部阈值增高，正常读取电压下不再导通。

擦除EPROM传统上使用紫外光，紫外光使被困电子有机会从浮栅释放；EEPROM则可以通过电压驱动的隧穿机制在电路中擦写。这是两者在系统可编程能力方面的主要区别。
