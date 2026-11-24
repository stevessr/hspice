// SOURCE PDF PAGE 347. Scan-guided original Typst excerpt and editable schematics.
// Not full-page 1:1 accepted; transistor topology and page geometry provisional.
#import "../figures/ch9-nonvolatile-ch10-interconnect-native.typ": figure9late
#set document(title:"第9章·非易失存储器·PDF347")
#align(center)[#text(size:8pt,weight:"bold")[328　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 9.7　Flash存储器

Flash通过浮栅电荷保存信息，也属于非易失性存储器。与传统EEPROM常按字节或更小单位进行擦除不同，Flash通常按存储块组织擦除，以降低单元面积和周边电路复杂度。

不同Flash结构包括并行NOR和串行NAND组织。NOR Flash单元通常具有可独立连接到位线的访问路径，读出较直接；NAND Flash通过若干浮栅单元串联形成单元串，有利于高密度存储，但读取和编程所需控制更加复杂。

#figure9late(29)
#align(center)[*图9.29　Flash单元结构：浮栅与隧穿氧化层（可编辑框图）*]

图9.30以多个浮栅管与字线/位线连接的阵列说明两类Flash的区别。编程和擦除可以利用高电压下的FN隧穿或热载流子机制，具体与工艺及器件结构有关。

#figure9late(30)
#align(center)[*图9.30　Flash阵列结构（可编辑概念图）*]
