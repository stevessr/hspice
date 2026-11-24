// SOURCE PDF PAGE 430 / printed page 411
// Source-checked two-dimensional DC sweeps and analysis output statements.
#import "../figures/appendix-a-native.typ": *
#set document(title:"附录A 双重DC扫描与绘图打印 · PDF430")
= 附录 A · 印刷第411页
== A.3.4　直流扫描（续）

*图 A.11* 以 NMOS 为例：漏极电压 $V_("drain")$ 从0到1.8 V，栅极电压 $V_("gate")$ 取多组值。按网表第二重扫描的 `Supply/4` 步长，应取 0、0.45、0.90、1.35、1.80 V 五档栅压。原书图中能清楚辨认的三条导通曲线对应 $V_("GS")=0.9 " V",1.35 " V",1.8 " V"$；前两档接近截止区，不应绘制为两条高电流曲线。图 A.11 左侧的 Vgate、Vdrain 独立电压源及 NMOS 接地也已按原图重绘。

图 A.10 的电阻分压器可使用：

#raw(".dc V1 0 10 1", block: true)

针对图 A.11 的嵌套 DC 扫描，原书使用：

#raw(".dc Vdrain 0 'Supply' 'Supply/20' Vgate 0 'Supply' 'Supply/4'", block: true)

第一组从0到 `Supply`，步长为 `Supply/20`；第二组从0到 `Supply`，步长为 `Supply/4`。每个栅压值对应一条 $I_("DS")$–$V_("DS")$ 曲线。

#align(center)[#a11-nmos-curves()]

=== 绘图与打印声明

`.plot` 以图形形式输出结果，`.print` 以表格形式列出值。两者都接受分析类型和输出变量，后面的输出变量是可选的：

#raw(".plot analysis_type ov1 <ov2 ... ov32>\n.print analysis_type ov1 <ov2 ... ov32>", block: true)

#table(columns:(1fr,3fr),inset:3pt,
table.header([*字段*],[*含义*]),
[`analysis_type`],[`dc` 或 `tran` 等分析类型],
[`ov1`],[输出的节点电压或元件电流],
)

原书给出节点5的电压和电感 `Lself` 的电流作为输出：

#raw(".plot dc V(5) I(Lself)\n.print tran V(5) I(Lself)", block: true)

=== 注释

注释帮助解释每条指令的用途。在教材示例中，整行以星号 `*` 开始表示注释；原书随后还继续解释同一行的注释写法。
