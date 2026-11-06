// SOURCE PDF PAGE 118 / printed 99, section3.8 figure3.16.
#import "../figures/ch3-end-native.typ": soi-section
#set document(title:"第3章 · SOI工艺与图3.16 · PDF118")
#set text(lang:"zh")
= 第3章 · 印刷第99页

== 3.8　绝缘体上的硅工艺

传统体硅CMOS中，NMOS与PMOS制造在衬底或不同阱区内。SOI（silicon-on-insulator，绝缘体上的硅）工艺在有源器件和衬底之间引入埋入绝缘层，以减小器件与衬底之间的耦合。

#soi-section()

*图3.16　CMOS-SOI工艺结构。* 有源硅薄膜位于埋入氧化物（BOX）之上，器件的源漏和沟道与主体硅衬底被绝缘层隔开。

教材区分：

#table(columns:(1.4fr,2.5fr),
 table.header([*SOI类型*],[*基本特征*]),
 [部分耗尽SOI（PD-SOI）],[有源硅层较厚，沟道下方仍有中性体区],
 [全耗尽SOI（FD-SOI）],[有源硅层足够薄，器件导通时体区可全部耗尽],
)

SOI优点包括减小源漏到衬底的结电容、提高隔离能力，以及降低对传统闩锁问题的敏感性。体区的浮置（floating body）效应也可能改变阈值与瞬态特性，需要相应器件模型。

原书指出，全耗尽SOI需要更薄的有源硅层和适当的沟道掺杂，对制造均匀性提出更高要求。教材以90 nm及65 nm节点为历史示例讨论SOI的选择。

_本页两种SOI定义及图3.16截面关系对照扫描，薄膜厚度没有按比例数字化。_
