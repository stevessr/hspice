// SOURCE PDF PAGE 363. Source scan-assisted Typst native editorial draft.
// All circuit diagrams, text positions and equations still require strict 1:1 acceptance.
#import "../figures/ch10-rc-elmore-native.typ": figure10more,fig-example102,fig-example101
#set document(title:"第10章·连线RC与艾蒙延迟·PDF363")
#align(center)[#text(size:8pt,weight:"bold")[344　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

长导线电阻与电容产生的传播延迟显著影响较大规模的芯片。图10.9按不同工艺线宽，给出在多个工艺代际下，连线长度与延迟之间的变化趋势。

#figure10more(9)
#align(center)[*图10.9　不同工艺尺寸下的连线长度与RC延迟趋势（可编辑定性曲线）*]

教材图 10.9 以四输入与门延迟 *FO4* 对照不同工艺下的互连 RC 延迟；源书正文的数据为：

#table(columns:(1fr,1fr,1fr,1fr),inset:(x:3pt,y:2pt),
table.header([*连线长度*],[*350 nm*],[*130 nm*],[*65 nm*]),
[1 mm],[3 ps],[27 ps],[116 ps],
[2 mm],[12 ps],[110 ps],[460 ps],
[3 mm],[30 ps],[240 ps],[1035 ps],
)
*注意*：上表的数据取自原书段落；它们是当时工艺模型的历史计算，不是现代制程预测值。原书同时给出 350 nm 工艺 FO4 约 150 ps、130 nm 约 40 ps、65 nm 约 25 ps。

对各种工艺，令 FO4 与连续导线延迟相等，源书定义临界长度：

$ "FO4" = 0.38 R_("int") C_("int") L_("crit")^2 $
$ L_("crit") = sqrt("FO4" / (0.38 R_("int") C_("int"))) $

原书在 0.18 μm 工艺下示例临界长度约 $2.5 "mm"$；当导线超过临界长度，应优先考虑缓冲器与长线分段。

随着工艺尺寸减小，高层金属之间的线宽、间距和截面积也发生变化。若长线电阻偏大，即使晶体管本身更快，也可能无法改善整个路径的传播延迟。

== 10.3　超长导线的缓冲器插入

对于过长的信号线，仅提高驱动反相器尺寸可能带来较大的输入电容，不能无限制地缩短延迟。一种有效的方法是在信号路径中插入一组缓冲器，将原来的长线分成较短的几段。

缓冲器增加逻辑级数及门自身寄生延迟，却可以减少每一段的RC延迟。最佳缓冲器数量和尺寸需要联合优化，不能仅通过“缓冲器越多越快”判断。
