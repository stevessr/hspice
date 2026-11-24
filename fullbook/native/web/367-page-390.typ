// SOURCE PDF PAGE 390 / printed 371; scan-guided editable Typst excerpt only.
// Literal paragraphs, layouts, photographed micrographs and electrical nets not fully verified.
#import "../figures/ch11-power-grid-em-native.typ": fig113,fig114,fig115,fig116,fig117,fig118,fig119,fig1110,fig1111,fig1112,fig1113,fig1114,fig1115
#set document(title:"第11章·电源完整性、电迁移与去耦电容·PDF390")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[371　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 11.2.2　电迁移（续）

原书指出，随着线宽减小、电流密度增加，电迁移风险更加突出。相比铝，铜通常具有更好的抗电迁移性能；但铜通孔在某些情况下仍然是容易发生失效的位置。

#fig115()
#align(center)[*图11.5　电迁移失效的金属线/逻辑路径概念说明（非原始微照片）*]

对金属互连，原书使用 Black 方程估计平均失效时间（MTTF, mean time to failure）：

#align(center)[$"MTTF" = A / J^2 exp((Delta H)/(k T)) quad (11.3)$]

$A$ 为经验常数，$J$ 是电流密度，$Delta H$ 是活化能，$k$ 是玻尔兹曼常数，$T$ 是绝对温度。此式说明电流密度增加会大幅降低寿命，温度升高也会显著加速失效。

MTTF 表示群体中位或统计平均失效时间，并不是每一条金属线的确定寿命。工程规则常根据期望寿命和安全系数设置最大允许电流密度。

原书还指出，芯片的寿命和产品预期要求不同，在设计电源网格时应将电迁移与 IR 压降一起考虑。
