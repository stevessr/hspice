// SOURCE PDF PAGE 190 / printed 171. Timing constants from source scan.
#import "../figures/ch5-dff-power-native.typ": d-master-slave, flipflop-timing
#set document(title:"第5章 · 主从D触发器与时序约束 · 扫描190页")
#set text(lang:"zh")
= 第5章 · 印刷第171页

== 图5.24　D触发器的工作原理

一个正边沿触发D触发器可以由两个使用互补时钟的透明D锁存器串接形成。时钟上升沿到来之前的最后一个有效D值被传送至输出，而中间变化不应立即透传。

#d-master-slave()

*图5.24*　主从D触发器的原生逻辑概念图。实际门级连线和原书波形尚未1:1核定。

== 图5.25　触发器的时序参数

#flipflop-timing()

#table(columns:(1fr,3fr),inset:4pt,
  table.header([参数],[含义]),
  [$t_("setup")$],[有效时钟沿之前，D必须保持稳定的最小时间],
  [$t_("hold")$],[有效时钟沿之后，D仍需保持稳定的最小时间],
  [$t_("clk-q")$],[时钟有效沿到Q建立有效输出的传播延迟],
)

数据位于建立／保持窗口内变化会使采样结果不能保证。教材在本页给出的时间消耗为 $t_("setup")+t_("clk-q")$，与数据可供前后级流水传输的时序预算相关。

*二次核对：*图号5.24/5.25、参数名称和采样沿对齐；全部时序线段暂为示意比例。
