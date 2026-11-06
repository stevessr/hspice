// Source PDF page 087 / printed 68. Third chapter title, original section sequence.
// This page is a source-based editable selection; wording spacing unverified.
#set document(title:"第3章 制造、版图和模拟 · 扫描第87页")
#set text(lang:"zh")

= 第3章　制造、版图和模拟

== 本章提要

#table(columns:(0.65fr,3fr),inset:(x:4pt,y:2pt),
  [3.1],[绪论],
  [3.2],[IC 制造工艺],
  [3.3],[版图基础],
  [3.4],[电路模拟中 MOS 晶体管的模型构造],
  [3.5],[SPICE MOS LEVEL 1 器件模型],
  [*3.6],[BSIM3 模型],
  [*3.7],[MOS 晶体管中的附加效应],
  [*3.8],[绝缘体上的硅工艺],
  [*3.9],[SPICE 模型小结],
  [3.10],[参考文献],
  [3.11],[习题],
)

带星号的各节遵循原书章首目录标记。

== 3.1　绪论

本章把集成电路的制造工艺、版图与电路模拟联系起来。首先用一种普通 CMOS 工艺说明制造的主要工序，然后介绍数字 CMOS 的晶体管版图、互连结构和相应设计规则。

版图是对器件和连线的几何描述。电路中每个晶体管以及连接线都需要几何参数，其中制造设备精度决定版图设计规则的边界。

接着介绍 SPICE 电路模拟，重点讨论 MOS LEVEL 1 与 BSIM3v3 器件模型所需的关键参数。仿真器既需要版图给出的晶体管宽度、长度、面积和周边尺寸，也需要制造工艺提供的器件模型参数。

原书指出，几何信息与模型参数这两种输入共同决定电路仿真结果，并在本章末尾简要介绍 SOI（silicon-on-insulator）工艺。

_本页标题、目录节号与 3.1 节主题对照原扫描；目前正文为可编辑的校对选段，并未逐字通过全页验收。_
