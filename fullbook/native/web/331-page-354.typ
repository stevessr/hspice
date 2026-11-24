// SOURCE PDF PAGE 354. Editable source-guided editorial selection, strict page 1:1 not accepted.
#import "../figures/ch9-nonvolatile-ch10-interconnect-native.typ": figure9late,figure10,fig-summary
#set document(title:"数字集成电路第10章·PDF354")
#align(center)[#text(size:8pt,weight:"bold")[335　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#set document(title:"第10章　连线设计")
#align(center)[#text(font:"Noto Sans CJK SC",size:18pt,weight:"bold")[第10章　连线设计]]

#block(fill:luma(239),inset:10pt)[
  *本章提要*

  10.1　绪论

  10.2　连线的RC延迟

  10.3　基本电阻和电容模型

  10.4　最优的缓冲器尺寸及插入

  10.5　连线的电感和耦合

  10.6　连线的串扰

  10.7　天线效应

  10.8　小结

  10.9　参考文献

  10.10　习题
]

== 10.1　绪论

随着工艺尺寸降低，芯片中连接不同逻辑器件的互连线不再能够视为理想导线。互连电阻、电容、耦合与自感成为决定延迟、噪声、能耗和可靠性的关键因素。

器件工艺微缩通常可以提高晶体管速度与集成密度，但导线宽度和间距也同时缩小，单位长度电阻、电容及相邻导线耦合可能使长连线成为主要性能限制。

本章把连线视为有分布电阻和电容的物理对象，并通过导体电阻、寄生电容和等效RC网络分析互连延迟。
