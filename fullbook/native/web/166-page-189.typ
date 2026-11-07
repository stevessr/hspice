// SOURCE PDF PAGE 189 / printed 170. Second-pass source-landmark proofread; partial transcription.
#import "../figures/ch5-dff-power-native.typ": d-symbol
#set document(title:"第5章 · D触发器与D锁存器 · 扫描189页")
#set text(lang:"zh")
= 第5章 · 印刷第170页

== 5.7　D触发器和D锁存器

JK 触发器既有主从结构也有边沿触发结构。图5.22进入D型存储元件：$D$ 为数据输入，正常动作时 $Q_(n+1)=D$，另一输出为互补的 $overline(Q)$。

#table(columns:(1fr,1fr),inset:4pt,align:center,table.header([*D*],[*$Q_(n+1)$*]),[0],[0],[1],[1])

*图5.22(a)*：D元件数据表。

#grid(columns:(1fr,1fr),column-gutter:6pt,[
  #d-symbol()
  *图5.22(b)*　透明高有效D锁存器。
],[
  #d-symbol(edge:true)
  *图5.22(c)*　上升沿触发D触发器。
])

当CK为高电平时，透明D锁存器的Q随D变化；CK回落时保持最后状态。边沿触发D触发器则只在有效的上升沿采样D。两者均存储数据，但触发条件不同。

== 图5.23　D锁存器工作原理

对给定相同的输入和时钟波形，锁存器在CLK高电平窗内透传输入、CLK低时保持。一个落在关闭期间的短暂负向脉冲不会反映到输出。

*二次扫描校对：*原页图5.22的三个子图、图5.23、D真值表和高电平透明/上升沿触发的区分已经核对；图5.23完整波形及文字段落未作逐元素1:1验收。
