// SOURCE PDF PAGE 426 / printed page 407
// Source-checked PULSE/PWL syntax, parameter order and example values.
#import "../figures/appendix-a-native.typ": *
#set document(title:"附录A PULSE与PWL电源 · PDF426")
= 附录 A · 印刷第407页
== A.3.3　脉冲源及分段线性源

用 `PULSE` 描述周期性梯形电压/电流，用 `PWL` 按时间—数值对给出分段线性波形：

#raw("Vxxx n+ n- PULSE <v1 v2 td tr tf pw per>\nIxxx n+ n- PULSE <v1 v2 td tr tf pw per>", block: true)

#table(columns:(.8fr,3.2fr),inset:(x:3pt,y:2pt),
table.header([*字段*],[*含义*]),
[`v1`],[初始电压或电流],
[`v2`],[脉冲顶值],
[`td`],[第一次跳变开始前的延迟时间],
[`tr`],[上升时间：从 v1 到 v2],
[`tf`],[下降时间：从 v2 到 v1],
[`pw`],[维持 v2 的脉冲宽度],
[`per`],[波形周期],
)

原书*图 A.6* 将节点3相对地的电压在 −1 V 与 +1 V 之间切换：延迟 2 ns，上升 4 ns，下降 3 ns，脉宽 20 ns，周期 50 ns。

#raw("Vpulse 3 0 PULSE -1 1 2ns 4ns 3ns 20ns 50ns", block: true)

可编辑波形时间点为：
#table(columns:(1fr,1fr,3fr),inset:3pt,
table.header([*时间（ns）*],[*电压（V）*],[*区段*]),
[0],[−1],[初始保持],
[2],[−1],[开始上升],
[6],[+1],[上升结束],
[26],[+1],[顶值保持结束],
[29],[−1],[下降结束],
[52],[−1],[下一周期上升开始],
[56],[+1],[下一周期上升结束],
)

#align(center)[#a6-pulse()]

相同的第一周期波形可以用 `PWL` 指定原书给出的采样节点：

#raw("Vpulse 3 0 PWL 0 -1 2ns -1 6ns 1 26ns 1 29ns -1\n+ 52ns -1 56ns 1", block: true)

_注意：PWL 是按列出的时间点插值，并不自动代表 PULSE 的无限周期重复。_
