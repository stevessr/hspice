// SOURCE PDF PAGE 421 / printed page 402
// Scanned SPICE deck breakdown transcribed from source (2026-11-08).
// All seven original items, deck samples and A.3.1/A.3.2 retained as editable Typst.
#set document(title:"附录A · SPICE文件组成、标题和全局参数 · PDF421")
= 附录 A · 印刷第402页

== A.3　一个基本 SPICE 文件的组成（续）

*2.* 对各种全局参数例如 $lambda$、$V_("DD")$ 等的设置，以及使用的 MOS 器件模型。使用的模型通过包含一个库文件来指定。

#raw(".param Supply=1.8   * Set value of Vdd\n.lib 'bsim3v3.cmos.18um'   * Set 0.18um library\n.opt scale=0.1u   * Set lambda (here lambda=0.10)",block:true)

*3.* 电路里的源、主动元件和被动元件的列表：

#raw("Vdd 1 0 'Supply'\nMp 3 2 1 1 pmos L=2 W=8 as=40 ps=4 ad=40 pd=8\nMn 3 2 0 0 nmos L=2 W=4 as=20 ps=4 ad=20 pd=4\nCload 3 0 10fF",block:true)

*4.* 分析声明（直流、瞬态）：

#raw(".tran 50ps 5ns",block:true)

*5.* 绘图和打印声明：

#raw(".plot tran v(3)",block:true)

*6.* 注释：

#raw("* Transient analysis",block:true)

*7.* 一个 .end 声明：

#raw(".end",block:true)

== A.3.1　标题

所有 SPICE 文件的第一行都被编译器当做卡片组的标题，无论这一行中包括什么。在这里最好使用描述性的标题，其中包括日期、版本、名称等。

== A.3.2　各种全局参数的设置

可以设置的 3 种主要的全局参数是：

+ 参数，它们是浮点类型的变量。

  #raw(".param Supply=1.8  * Set value of Vdd",block:true)

+ 库，其中包含用于各种 MOSFET 模型的参数。

  #raw(".lib 'bsim3v3.cmos.18um'  * Set 0.18um library",block:true)

+ lambda，$lambda$ 单位的长度。由于使用的是 0.18 μm 工艺，所以 $lambda$ 设置为 100 nm（为了方便）。

  #raw(".opt scale=0.1u  * Set lambda (here lambda=0.10)",block:true)

=== 参数

SPICE 中的参数是全局变量的声明，可以用于赋值，例如电压源的电压、电阻器的电阻，或用于 .dc 和 .tran 命令中。参数声明的句法是：

#raw(".param           paramname=realnumber",block:true)
