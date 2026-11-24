// SOURCE PDF PAGE 350. Editable source-guided editorial selection, strict page 1:1 not accepted.
#import "../figures/ch9-nonvolatile-ch10-interconnect-native.typ": figure9late,figure10,fig-summary
#set document(title:"数字集成电路第9章·PDF350")
#align(center)[#text(size:8pt,weight:"bold")[331　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

图9.33给出FRAM的存储单元和铁电材料的电滞回线。电滞回线上的两种剩余极化状态在去除外电场后仍不同，这是非易失性的物理基础。

#figure9late(33)
#align(center)[*图9.33　FRAM单元和铁电滞回特性（可编辑示意）*]

== 9.9　小结

本章把第8章的静态SRAM扩展到CAM、FPGA、DRAM、掩膜ROM、EPROM、EEPROM、Flash及FRAM。CAM将数据匹配转化为并行比较；FPGA使用配置位控制逻辑函数和布线；DRAM以电容电荷换取高密度，需要刷新；ROM和浮栅器件提供非易失性；FRAM以铁电材料的极化状态保存信息。

#figure9late(34)
#align(center)[*图9.9节　半导体存储器类别汇总（编辑结构图）*]

*表9.1　存储器技术比较*

#table(
  columns: (1.1fr,1.2fr,1.0fr,1.1fr,1.2fr),
  inset:4pt,
  [类型],[信息保存],[易失性],[改写手段],[主要代价],
  [SRAM],[双稳态],[易失],[电写入],[单元面积],
  [DRAM],[电容电荷],[易失],[电写/刷新],[刷新与感测],
  [EPROM],[浮栅电荷],[非易失],[电编程/UV擦除],[擦除方式],
  [EEPROM],[浮栅电荷],[非易失],[电擦写],[单元与耐久],
  [Flash],[浮栅电荷],[非易失],[块擦除],[编程控制],
  [FRAM],[剩余极化],[非易失],[极化翻转],[材料集成]
)
#text(size:8pt)[此表为可编辑的技术概念重排，原书表9.1的定量栏位尚未完成逐格核对，暂不伪造精确数据。]

== 9.10　参考文献

本页原书列有关于半导体存储器与VLSI设计的参考文献，包括 B. Prince《Emerging Memories》，K. Itoh《VLSI Memory Chip Design》等；完整出版项仍待逐条复核。
