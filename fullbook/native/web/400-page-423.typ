// SOURCE PDF PAGE 423 / printed page 404
// Native editable table A.1 and scan-checked source syntax; editorial, not accepted full fidelity.
#set document(title:"附录A A.3.3 器件名及节点 · PDF423")
= 附录 A · 印刷第404页

按上一页的 `.opt scale=0.1um`，直接用物理尺寸描述同一个 NMOS：

#raw("Mn 3 2 0 0 nmos L=0.2u W=0.4u as=0.2p ps=0.4u ad=0.2p pd=0.4u", block: true)

== A.3.3　源、主动元件和被动元件的列表

原书给出的元件说明包括五项：唯一的实体名、连接节点、器件数值、必要的模型，以及长度和宽度等器件参数。

=== 实体名

传统 SPICE 网表通过器件名称的首字母识别元件种类。原书表 A.1 重排如下：

#table(columns:(1fr,1fr,2fr),inset:(x:3pt,y:2pt),
table.header([*元件类型*],[*命名约定*],[*原书示例*]),
[电压源],[`Vxxx`],[V1、VDD、Vsource],
[电流源],[`Ixxx`],[I2、Isource、ID],
[电阻],[`Rxxx`],[R5、Rin、Rout],
[电容],[`Cxxx`],[Cg、Cout、Cbig],
[电感],[`Lxxx`],[L3、Lself、L1],
[场效应管],[`Mxxx`],[M1、Mpmos23、Mpu],
[二极管],[`Dxxx`],[D1、Dpn、Dclamp],
)

原书说明的旧式实体名通常以一位器件字母后跟最多七位文字或数字构成；不要把此历史表述当作所有现代 SPICE 实现的共同长度限制。

=== 节点

多数两端器件连接两个节点，BJT 与 FET 则需要更多节点；可以采用整数或易读的字母数字节点名。节点 `0` 保留为地。电压源、二极管与晶体管的端口顺序具有意义，电阻、电容、电感的两端通常可交换。

_本页表 A.1 的器件类别和示例按 PDF 第423页扫描重排。_
