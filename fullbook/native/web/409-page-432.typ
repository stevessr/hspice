// SOURCE PDF PAGE 432 / printed page 413
// Graphs and circuit figures are described but not yet pixel-matched to source.
#import "../figures/appendix-a-native.typ": *
#set document(title:"附录A 图A.12/A.13 NMOS IV和反相器响应 · PDF432")
= 附录 A · 印刷第413页
== A.4　完整 SPICE 示例（续）

前一页的反相器瞬态网表以如下指令结束：

#raw("* Plotting requests\n.plot tran V(3)\n.end",block:true)

=== 图 A.12　NMOS 的 IV 特性

原书电路包含一只 NMOS，源极和体端接地，漏极接 `Vdrain`，栅极接 `Vgate`。双重 DC 扫描取 $V_("GS")=0,0.45,0.90,1.35,1.80 " V"$ 共五个栅压，其中扫描图只清晰显示三条非零的输出特性（0.90、1.35、1.80 V）。低于器件阈值的两档电流接近0；将五个扫描值全部画成高电流曲线会造成误读。

#table(columns:(1fr,2fr),inset:3pt,
table.header([*观察量*],[*原图设定*]),
[横轴],[漏极电压，0—1.8 V],
[纵轴],[漏极电流，μA],
[主扫描],[`Vdrain 0 'Supply' 'Supply/20'`],
[次扫描],[`Vgate 0 'Supply' 'Supply/4'`],
)

#align(center)[#a11-nmos-curves()]

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

#align(center)[#a13-transient()]

_本页的 NMOS 偏置测试电路、三条导通曲线，以及带10 fF负载的 CMOS 反相器和约1–3 ns低电平脉冲响应，均为可编辑 Typst 示意。曲线没有从原扫描数字化采样；实际 HSPICE 结果和原图的精确位置尚需逐页验证。_
