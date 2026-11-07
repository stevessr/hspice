// ORIGINAL PDF215 / PRINTED196 · all displayed equations checked against image
#import "../figures/ch6-pass4-native.typ": fig67
#set document(title:"第6章·门的负载电容与扇出电容·PDF215")
#align(center)[#text(size:8pt,weight:"bold")[196　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

个独立的量加到一起得出一个集总电容：

#align(center)[$C_("load") = C_("self") + C_("wire") + C_("fanout") quad "(6.7)"$]

虽然这些组成部分中的每一部分都有一定的复杂性，但我们的目标实际上是用简化的公式快速计算负载电容。

#fig67()
#align(center)[*图6.7　门负载电容的组成部分*]

== 6.3.1　门扇出电容

要考虑的第一种负载电容是由于后级门的输入而引起的本级门的扇出电容 $C_G$。这个电容取决于该逻辑门驱动的扇出个数，并且可以是比较大的。总扇出电容是每一个门电容的总和，如图6.7所示。

#align(center)[$C_("fanout") = sum C_G$]

假设每一个扇出全部是反相器，其电容如图6.8所示。因为要驱动 $V_("in")$ 这个输入，所以我们对于和 $V_("in")$ 相关的特定参数项感兴趣。每一个晶体管都有一个由薄氧化层引起的参数项，以及由交叠电容引起的另外两个参数项。必须考虑的电容是 $C_("Gn")$、$C_("Gp")$ 和 $C_("OL")$。

第2章介绍过薄氧化层电容依赖于电压，但因为是从栅节点驱动晶体管的，所以可以用 $C_("ox")WL$ 来计算在最坏情况下的值。反相器总共的输入电容是图6.8中所有部分的和：

#align(center)[$C_G = C_("Gn") + 2C_("OL") + C_("Gp") + 2C_("OL")$]

#align(center)[$= C_("ox") L W_n + 2C_("ol")W_n + C_("ox")L W_p + 2C_("ol")W_p$]

#align(center)[$= (C_("ox")L + 2C_("ol"))(W_n + W_p) quad "(6.8)"$]

这个表达式中最重要的参数项是由工艺决定的，所以可以预先计算出来。对于0.13 μm工艺，$C_("ox")L$ 的值为 $1.6 times 10^(-6)" F/cm"^2 times 0.1 " μm" = 1.6 " fF/μm"$。在第2章中，把交叠电容近似为 $C_("ol")=0.25 " fF/μm"$。因此，现在重新定义 $C_g$ 为：

#align(center)[$C_g = C_("ox")L + 2C_("ol") = 1.6 " fF/μm" + 2(0.25 " fF/μm") approx 2 " fF/μm" quad "(6.9)"$]

薄氧化层和交叠电容引起的全部电容总和大约为 $2 " fF/μm"$。在过去20多年中这个值几乎一直保持为常数。我们将使用 $2 " fF/μm"$ 用于栅电容并将其乘以器件的宽度来获得总共的电容。