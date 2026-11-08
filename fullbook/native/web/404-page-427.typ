// SOURCE PDF PAGE 427 / printed page 408
// Source-checked passive RLC and MOSFET connection syntax.
#import "../figures/appendix-a-native.typ": *
#set document(title:"附录A RLC与MOSFET元件语法 · PDF427")
= 附录 A · 印刷第408页
== A.3.3　电阻、电容和电感

#raw("Rxxx n+ n- resistanceval\nCxxx n+ n- capacitanceval\nLxxx n+ n- inductanceval", block: true)

原书*图 A.7* 是由 $17 " MΩ"$ 电阻、$1.5 " fF"$ 电容和 $0.7 " mH"$ 电感串联组成的 RLC 电路，节点顺序为1、2、3、4。

#raw("R7   1 2 17Megohms\nCin  2 3 1.5fF\nLbig 3 4 .7mH", block: true)

#table(columns:(1fr,1fr,1fr),inset:3pt,
table.header([*器件*],[*两端节点*],[*参数*]),
[电阻 R7],[1—2],[17 MΩ],
[电容 Cin],[2—3],[1.5 fF],
[电感 Lbig],[3—4],[0.7 mH],
)

#align(center)[#a7-rlc()]

=== MOSFET

MOS 晶体管以 `M` 开头。原书所列通用语法强调四个有序节点：

#raw("Mxxx nd ng ns nb mname L=length W=width\n+ AD=drain_area PD=drain_perimeter\n+ AS=source_area PS=source_perimeter", block: true)

#table(columns:(1fr,3fr),inset:2pt,
table.header([*字段*],[*说明*]),
[`nd`],[漏极节点（Drain）],
[`ng`],[栅极节点（Gate）],
[`ns`],[源极节点（Source）],
[`nb`],[衬底/体节点（Body）],
[`mname`],[模型名称，用于区分 NMOS 与 PMOS],
[`L`、`W`],[沟道长度和宽度],
[`AD`、`AS`],[漏/源扩散区面积],
[`PD`、`PS`],[漏/源扩散区周长],
)

这些长度/面积参数必须与 `.opt scale` 或绝对物理单位的写法一致。本页随后引出*图 A.8*：由 PMOS 与 NMOS 共同构成的传输门，相关连接和参数续至下一页。
