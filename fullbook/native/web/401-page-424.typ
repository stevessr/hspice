// SOURCE PDF PAGE 424 / printed page 405
// Scan-guided reconstruction of table A.2; physical figures are editorial placeholders.
#import "../figures/appendix-a-native.typ": *
#set document(title:"附录A SPICE元件值、工程前缀与模型 · PDF424")
= 附录 A · 印刷第405页
== A.3.3　源和器件列表（续）

*图 A.3* 以电阻 `R5` 连接节点5与地，电阻值为 $10 " kΩ"$：

#raw("R5 5 0 10k", block: true)

#align(center)[#a3-resistor()]

=== 值与工程前缀

原书表 A.2 的指数与前缀重排如下。尤其注意 SPICE 的 `M` 表示毫（milli），而百万需要用 `Meg`。

#table(columns:(.65fr,1fr,1fr,.7fr,1.25fr),inset:(x:2pt,y:2pt),
table.header([*数量级*],[*公制前缀*],[*SPICE后缀*],[*指数*],[*示例*]),
[$10^9$],[Giga],[`G`、`g`],[`E9`],[`4.2G` = `4.2E9`],
[$10^6$],[Mega],[`Meg`、`meg`],[`E6`],[`.2Meg` = `.2E6`],
[$10^3$],[Kilo],[`K`、`k`],[`E3`],[`27k` = `27E3`],
[$10^(-3)$],[Milli],[`M`、`m`],[`E-3`],[`273m` = `273E-3`],
[$10^(-6)$],[Micro],[`U`、`u`],[`E-6`],[`.02u` = `.02E-6`],
[$10^(-9)$],[Nano],[`N`、`n`],[`E-9`],[`4n` = `4E-9`],
[$10^(-12)$],[Pico],[`P`、`p`],[`E-12`],[`95p` = `95E-12`],
[$10^(-15)$],[Femto],[`F`、`f`],[`E-15`],[`3f` = `3E-15`],
)

SPICE 可由器件类型判断基本单位；原书强调为改善可读性可以说明单位，但不能把工程前缀和指数形式任意混合，例如 `2E-16P`。

=== 模型

对于二极管、晶体管等主动器件，端口后面一般需要指定模型名称，并可跟随几何参数。#align(center)[#a4-mos()]

*图 A.4* 展示一个引用 `nmos` 模型的 MOSFET，具体参数在下一扫描页继续。
