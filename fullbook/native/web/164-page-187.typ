// SOURCE PDF PAGE 187 / printed 168. Editorial reconstruction, not accepted 1:1.
#import "../figures/ch5-jk-native.typ": jk-feedback, jk-symbol, jk-truth, master-slave
#set document(title:"第5章 · JK和主从JK触发器 · 扫描187页")
#set text(lang:"zh")
= 第5章 · 静态 MOS 门电路 · 印刷第168页

== 图5.19　JK触发器
JK触发器通过输入 $J$、$K$ 和反馈将 SR 锁存器扩展为保持、清零、置位和翻转四种工作状态，图(a)使用门控 NAND 与交叉耦合 NAND 锁存器。图(b)是逻辑符号，图(c)为功能真值表。

#jk-feedback()

#grid(columns:(1fr,1fr),column-gutter:8pt,[
  #jk-symbol()
],[
  #jk-truth()
])

*图5.19*　(a) 门控结构；(b) JK符号；(c) $Q_(n+1)$ 与 $J_n$、$K_n$ 的关系。图中的反馈线走向待与扫描图逐线对照。

== 5.6.4　主从 JK 触发器
在图5.20所示的逻辑图中，主从JK触发器由两个JK触发器简单级联构成，其中主触发器驱动从触发器。主触发器由 CK 驱动，而从触发器由其反相信号驱动。

CK上升时，主触发器受输入信号控制，而从触发器保持状态；在CK下降到足够低时，来自主触发器的状态由从触发器传送至输出。由此，主从结构将输入信号的采样与输出更新分离。

#master-slave()

*图5.20*　由JK触发器构成的主从触发器。原图的全部NAND门以及互补时钟连线仍须进一步几何校对。

主从结构存在一次锁存效应：当CK为高时，若主锁存器响应短脉冲，可能保存短暂的 $J$ 输入变化，而在CK下降时由从锁存器输出。此处提醒的是电平敏感主锁存器的竞争风险，不应将其直接等同于理想边沿触发器。

_校对状态：本页标题、图号、JK真值表及主要动作顺序已对照源扫描；两幅结构图为编辑用原生图元，尚未通过原图逐线验收。_
