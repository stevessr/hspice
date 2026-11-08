// SOURCE PDF PAGE 425 / printed page 406
// Editable device syntax and netlist reconstruction; diagrams still await exact fidelity proof.
#set document(title:"附录A MOSFET参数及V/I源 · PDF425")
= 附录 A · 印刷第406页
== A.3.3　器件名称与参数（续）

以下是原书的 NMOS 示例，连接顺序为*漏极、栅极、源极、衬底*：

#raw("Mn 2 3 0 0 nmos L=2 W=4 as=20 ad=20 ps=4 pd=4", block: true)

其中，`L`、`W` 分别为沟道长度和宽度，`AS`、`AD` 是源漏扩散区面积，`PS`、`PD` 是周长。它们按前面的 `.opt scale` 设置确定物理尺寸。

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

*图 A.5 示例：* 电压源 `Vsupply` 在节点5与地之间提供15 V，电流源 `Isupply` 从节点2到节点3，数值由参数 `Icc` 指定。

#raw("Vsupply 5 0 15\nIsupply 2 3 'Icc'", block: true)

_图 A.5 的图形符号尚需按照扫描件重画。_
