// SOURCE PDF PAGE 363. Source scan-assisted Typst native editorial draft.
// All circuit diagrams, text positions and equations still require strict 1:1 acceptance.
#import "../figures/ch10-rc-elmore-native.typ": figure10more,fig-example102,fig-example101
#set document(title:"第10章·连线RC与艾蒙延迟·PDF363")
#align(center)[#text(size:8pt,weight:"bold")[344　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

长导线电阻与电容产生的传播延迟显著影响较大规模的芯片。图10.9按不同工艺线宽，给出在多个工艺代际下，连线长度与延迟之间的变化趋势。

#figure10more(9)
#align(center)[*图10.9　不同工艺尺寸下的连线长度与RC延迟趋势（可编辑定性曲线）*]

随着工艺尺寸减小，高层金属之间的线宽、间距和截面积也发生变化。若长线电阻偏大，即使晶体管本身更快，也可能无法改善整个路径的传播延迟。

== 10.3　超长导线的缓冲器插入

对于过长的信号线，仅提高驱动反相器尺寸可能带来较大的输入电容，不能无限制地缩短延迟。一种有效的方法是在信号路径中插入一组缓冲器，将原来的长线分成较短的几段。

缓冲器增加逻辑级数及门自身寄生延迟，却可以减少每一段的RC延迟。最佳缓冲器数量和尺寸需要联合优化，不能仅通过“缓冲器越多越快”判断。
