// SOURCE PDF PAGE 424 / printed page 405
// Figure A.3 and A.4 circuit symbols and Table A.2 examples checked against original scan.
// This is an editable source reflow, not final 1:1 page-layout acceptance.
#import "../figures/appendix-a-native.typ": *
#set document(title:"附录A · SPICE元件值、表A.2工程前缀与MOS图形 · PDF424")
= 附录 A · 印刷第405页

图 A.3 显示了一个名称为 R5 的 $10 " kΩ"$ 电阻，连接在节点“5”和地之间：

#raw("R5 5 0 10k", block:true)
#align(center)[#a3-resistor()]
*图 A.3　一个电阻被动元件。*

== 值
元件值用浮点数说明。特别大或特别小的值（例如大于1000或小于0.001）可以用指数形式或用工程学前缀说明。原书表 A.2 给出了乘数因子和与其相关的10次幂后缀、公制前缀和指数形式，最后一列是实例。

*表 A.2　SPICE的前缀和指数*

#table(
 columns:(.9fr,.85fr,1.15fr,.65fr,1.75fr),
 inset:(x:2pt,y:2.1pt),
 table.header([*乘数因子*],[*公制前缀*],[*10次幂后缀*],[*指数*],[*SPICE实例*]),
 [$10^9$],[Giga],[`G`、`g`],[`E9`],[`4.2 GHz` / `4.2E9`],
 [$10^6$],[Mega],[`Meg`、`meg`],[`E6`],[`.2 Meg` / `.2 E6`],
 [$10^3$],[Kilo],[`K`、`k`],[`E3`],[`27 kohms` / `27E3`],
 [$10^(-3)$],[Milli],[`M`、`m`],[`E-3`],[`273 mA` / `273E-3`],
 [$10^(-6)$],[Micro],[`U`、`u`],[`E-6`],[`.02 us` / `.02E-6`],
 [$10^(-9)$],[Nano],[`N`、`n`],[`E-9`],[`4 ns` / `4E-9`],
 [$10^(-12)$],[Pico],[`P`、`p`],[`E-12`],[`95 pF` / `95E-12`],
 [$10^(-15)$],[Femto],[`F`、`f`],[`E-15`],[`3 fF` / `3E-15`],
)

*注意：* SPICE 基于元件类型（如电阻、电容或电压源）推断单位，因此不能把欧姆、法拉或伏特当成可任意组合的数值倍率后缀。不过，为了改善可读性应尽可能注明单位。*前缀和指数形式不能混用*（例如原书指出的 `2E-16P`）。

=== 模型
对于二极管和晶体管等主动元件，需在元件的节点说明之后给出模型名称，而不是像电阻或电容那样仅指定单个数值。随后还可以列出器件特定的参数。

#align(center)[#a4-mos()]
*图 A.4　一个使用“nmos”模型的MOS晶体管。*

图 A.4 中，MOS 管的漏极接节点2、栅极接节点3，源极和体端分别接地节点0；模型名称及尺寸参数在下一扫描页继续介绍。
