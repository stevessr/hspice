// SOURCE PDF PAGE 429 / printed page 410
// Scan-checked transient and DC analysis syntax with native explanation.
#import "../figures/appendix-a-native.typ": *
#set document(title:"附录A .tran .dc仿真命令 · PDF429")
= 附录 A · 印刷第410页
== A.3.4　分析声明（续）
=== 瞬态分析的参数

#table(columns:(1fr,3fr),inset:3pt,
table.header([*字段*],[*定义*]),
[`.tran`],[瞬态分析命令],
[`tstep`],[建议的时间增量（原书以此说明输出观察尺度）],
[`tstop`],[停止分析的时间],
)

*图 A.9* 的 RC 阶跃响应示例对应原书命令：

#raw(".tran 1m 10m", block: true)

=== 直流分析

直流分析通过扫描一个独立源的值观察其他变量，如反相器电压传输特性或 MOS 的 $I$–$V$ 曲线。*图 A.10* 中的电路由1 kΩ + 1 kΩ 电阻分压，电压源从0 V扫到10 V时，中点电压从0 V线性升至5 V。

#align(center)[#a10-divider()]

可选第二组扫描参数用于产生多条曲线。教材列出的形式：

#raw(".dc var1 start stop step <var2 start2 stop2 step2>", block: true)

#table(columns:(.95fr,3fr),inset:(x:3pt,y:2pt),
table.header([*字段*],[*说明*]),
[`var1`],[第一个扫描变量，例如 Vsource],
[`start`],[扫描起点],
[`stop`],[扫描终点],
[`step`],[步长],
[`var2`],[可选的第二扫描变量],
[`start2` / `stop2`],[第二扫描范围],
[`step2`],[第二扫描步长，决定输出曲线的组数],
)

扫描第2变量不是瞬态随时间的变化；每一个扫描点都求解静态工作点。具体的 `.dc` 网表及图 A.11 见下一扫描页。
