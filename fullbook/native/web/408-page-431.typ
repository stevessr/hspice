// SOURCE PDF PAGE 431 / printed page 412
// Scan-checked code examples; original graphs continue on PDF 432.
#set document(title:"附录A .ic、.end 与完整SPICE网表 · PDF431")
= 附录 A · 印刷第412页
== A.3　注释与初始条件

注释可以单独占一行，也可以跟在器件行后，用星号解释作者意图。原书示例：

#raw("* This is a comment **\nR5 2 0 10k  * This is also a comment.",block:true)

=== `.ic` 声明

初始条件可以明确指定某些节点在 $t=0$ 时的电压。若要在瞬态计算中强制使用这些初始条件，教材使用 `uic` 标志：

#raw(".ic V(5)=1.8 V(7)=0\n.tran 50ps 5ns uic",block:true)

=== `.end` 声明

`.end` 指定网表结束，SPICE 忽略其后的输入行。

== A.4　完整的 SPICE 示例

原书图 A.12 对 NMOS 器件的 $I$–$V$ 曲线进行 DC 双重扫描：

#raw("IV Characteristic of NMOS\n.param Supply=1.8\n.lib 'bsim3v3.cmos.18um'\n.opt scale=0.1u\n* Voltage sources\nVdrain 2 0 'Supply'\nVgate 1 0 'Supply'\n* A minimum width NMOS transistor\nMn 2 1 0 0 nmos L=2 W=4 as=20 ps=4 ad=20 pd=4\n* DC analysis request by sweeping the drain and gate voltage.\n.dc Vdrain 0 'Supply' 'Supply/20' Vgate 0 'Supply' 'Supply/4'\n* Plotting requests\n.plot dc I(Mn)\n.end",block:true)

图 A.13 使用脉冲输入观察 CMOS 反相器瞬态：

#raw("Transient Response of an Inverter\n.param Supply=1.8\n.lib 'bsim3v3.cmos.18um'\n.opt scale=0.1u\nVdd 1 0 'Supply'\nVin 2 0 pulse 0 'Supply' 1n 0n 0n 2n 4n\nMp 3 2 1 1 pmos L=2 W=8 as=40 ps=4 ad=40 pd=8\nMn 3 2 0 0 nmos L=2 W=4 as=20 ps=4 ad=20 pd=4\nCload 3 0 10fF\n* Transient analysis\n.tran 50ps 5ns",block:true)

该网表的绘图和结束行在 PDF 第432页继续，尚不可省略。
