// SOURCE PDF PAGE 420 / printed page 401
// Source-checked SPICE netlist; circuit and workflow figures pending exact redrawing.
#set document(title:"附录A A.3 反相器SPICE网表示例 · PDF420")
= 附录 A · 印刷第401页
== A.2　设计流程（续）

模拟结果可以由 SPICE 以文本输出，也可以在图形显示程序中查看。图 A.1 的步骤是：输入 SPICE 网表、进行模拟、显示 NMOS 的 $I$–$V$ 特性。

== A.3　句法

图 A.2 的反相器网表如下。第一行是标题；后续依次是参数、模型库、尺度、独立源、MOS 器件、负载电容、分析与绘图语句。原书工艺模型路径是示例名称，实际仿真时需要提供相应模型库。

#raw("Inverter Circuit\n.param Supply=1.8  * Set value of Vdd\n.lib 'bsim3v3.cmos.18um'  * Set 0.18um library\n.opt scale=0.1u  * Set lambda (here lambda=0.10)\nVdd 1 0 'Supply'\nVin 2 0 pulse 0 'Supply' 1ns 0ns 0ns 2ns 4ns\nMp 3 2 1 1 pmos L=2 W=8 as=40 ps=4 ad=40 pd=8\nMn 3 2 0 0 nmos L=2 W=4 as=20 ps=4 ad=20 pd=4\nCload 3 0 10fF\n* Transient analysis\n.tran 50ps 5ns\n* Plotting requests\n.plot tran v(3)\n.end", block: true)

*图 A.2 的电路连接：* PMOS 漏极及 NMOS 漏极同接节点3；两个栅极同接输入节点2；PMOS源极及体端接电源节点1，NMOS源极及体端接地；负载电容从节点3接地。

== SPICE 文件的第一项
+ 文件第一行是*标题*，此处为 `Inverter Circuit`。

_本页网表根据扫描逐项纠正了 OCR 对 PULSE、模型名、MOS 的 D–G–S–B 端口、参数赋值和 Cload 的误识别。_
