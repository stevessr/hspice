// SOURCE PDF PAGE 432 / printed page 413
// Graphs and circuit figures are described but not yet pixel-matched to source.
#set document(title:"附录A 图A.12/A.13 NMOS IV和反相器响应 · PDF432")
= 附录 A · 印刷第413页
== A.4　完整 SPICE 示例（续）

前一页的反相器瞬态网表以如下指令结束：

#raw("* Plotting requests\n.plot tran V(3)\n.end",block:true)

=== 图 A.12　NMOS 的 IV 特性

原书电路包含一只 NMOS，源极和体端接地，漏极接 `Vdrain`，栅极接 `Vgate`。通过嵌套 DC 扫描生成五组栅压下的漏极电流—漏极电压曲线。曲线随栅压增加而增高，随漏极电压升高逐步进入饱和。

#table(columns:(1fr,2fr),inset:3pt,
table.header([*观察量*],[*原图设定*]),
[横轴],[漏极电压，0—1.8 V],
[纵轴],[漏极电流，μA],
[主扫描],[`Vdrain 0 'Supply' 'Supply/20'`],
[次扫描],[`Vgate 0 'Supply' 'Supply/4'`],
)

=== 图 A.13　一个反相器的脉冲响应

图 A.13 由 CMOS 反相器、10 fF 输出负载和 `PULSE` 输入产生。输出波形在输入为低电平时约为1.8 V，在输入为高电平时接近0 V。

#table(columns:(1fr,2fr),inset:3pt,
table.header([*观察量*],[*原图设定*]),
[横轴],[时间，0—5 ns],
[纵轴],[反相器输出电压，V],
[输入激励],[`PULSE 0 'Supply' 1n 0n 0n 2n 4n`],
[负载电容],[`Cload 3 0 10fF`],
[瞬态分析],[`.tran 50ps 5ns`],
)

_本页是对原扫描图 A.12 / A.13 的可编辑技术说明与数据结构重排；图中曲线形状与实验采样值仍待数值模拟和图形几何复核。_
