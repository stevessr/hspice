// SOURCE PDF PAGE 421 / printed page 402
// Reconstructed native SPICE statements; examples retain the historical book convention.
#set document(title:"附录A SPICE标题、参数、模型与缩放 · PDF421")
= 附录 A · 印刷第402页
== A.3　一个基本 SPICE 文件的组成

+ *标题：* 第一行说明该网表的用途，如 `Inverter Circuit`。
+ *全局参数与模型库：* 用参数定义电源电压，载入 MOS 模型，并设置用于尺寸输入的尺度。
+ *元件列表：* 声明电压源、MOSFET、负载电容及其节点。
+ *分析声明：* 选择瞬态或直流分析。
+ *绘图/打印声明：* 输出指定节点电压或支路电流。
+ *注释：* 以 `*` 开头的注释行说明意图。
+ *结束：* `.end` 终止网表。

#raw(".param Supply=1.8\n.lib 'bsim3v3.cmos.18um'\n.opt scale=0.1u\n\nVdd 1 0 'Supply'\nMp 3 2 1 1 pmos L=2 W=8 as=40 ps=4 ad=40 pd=8\nMn 3 2 0 0 nmos L=2 W=4 as=20 ps=4 ad=20 pd=4\nCload 3 0 10fF\n\n.tran 50ps 5ns\n.plot tran v(3)\n* Transient analysis\n.end", block: true)

== A.3.1　标题

所有 SPICE 文件的第一行都被视为卡片组标题。原书建议使用具有描述性的标题，包括日期、版本或电路名称。

== A.3.2　各种全局参数的设置

原书依次讨论参数、MOS 模型库和以 λ 为单位的几何尺度：

#raw(".param Supply=1.8\n.lib 'bsim3v3.cmos.18um'\n.opt scale=0.1u", block: true)

其中，`Supply` 是可供元件数值引用的全局参数；`.lib` 调用模型库，`.opt scale` 决定网表中的尺寸数字如何缩放。

*参数声明的句法：* `.param paramname=realnumber`。具体说明及库与尺度示例在下一扫描页继续。
