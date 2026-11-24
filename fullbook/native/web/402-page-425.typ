// SOURCE PDF PAGE 425 / printed page 406
// Editable device syntax and netlist reconstruction; diagrams still await exact fidelity proof.
#import "../figures/appendix-a-native.typ": *
#set document(title:"附录A MOSFET参数及V/I源 · PDF425")
= 附录 A · 印刷第406页
== A.3.3　器件名称与参数（续）

以下是原书的 NMOS 示例，连接顺序为*漏极、栅极、源极、衬底*：

#raw("Mn 2 3 0 0 nmos L=2 W=4 as=20 ad=20 ps=4 pd=4", block: true)

其中，`L`、`W` 分别为沟道长度和宽度；`AS`、`AD` 分别是源区与漏区扩散面积；`PS`、`PD` 分别是源区与漏区周长。依照前一页的 `.opt scale=0.1um`，示例中的 `L=2` 表示 $0.2 " μm"$、`W=4` 表示 $0.4 " μm"$，而 `AS=20` 则表示 $0.2 " μm"^2$。模型库文件路径及名称须从相应工艺模型提供方获取。

原书还说明，SPICE 元件行可用行首的 `+` 继续。下列两种描述指向相同器件：

#raw("Mn 2 3 0 0 nmos L=2 W=4 as=20 ad=20 ps=4 pd=4\n\nMn 2 3 0 0 nmos\n+ L=2 W=4 as=20 ad=20 ps=4 pd=4", block: true)

=== 元件句法：电压和电流源

#raw("Vxxx n+ n- voltageval\nIxxx n+ n- currentval", block: true)

#table(columns:(.85fr,3fr),inset:3pt,
table.header([*字段*],[*意义*]),
[`Vxxx`],[电压源名称],
[`Ixxx`],[电流源名称],
[`n+`],[源的正节点],
[`n-`],[源的负节点],
[`voltageval`],[电压数值或由 `.param` 声明的常量],
[`currentval`],[电流数值或由 `.param` 声明的常量],
)

*图 A.5 示例：* 电压源 `Vsupply` 接节点5与地，电压为15 V；电流源 `Isupply` 的两端分别接节点2与节点3，大小由参数 `Icc` 指定。原书图形旁标有12 A，但本页网表并未给出 `Icc` 的实际参数赋值，因此图中数字属于示意标注。

#raw("Vsupply 5 0 15\nIsupply 2 3 'Icc'", block: true)

#align(center)[#a5-sources()]

_图 A.5 的原生图元已补齐源极性、箭头和节点标号；符号的全部版式与原扫描尚未通过整页1:1验收。_
