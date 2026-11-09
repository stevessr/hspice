// SOURCE PDF PAGE 181 / printed 162. Source figure 5.14 reconstructed
// as editable complementary MOS transistor branches (not text-only boxes).
// Original redundant pMOS cross-connections and per-wire scale unverified.
#import "../figures/ch5-complex-sequential-native.typ": xor-xnor, pseudo-nmos-aoi22
#set document(title:"第5章 · 图5.14 XOR/XNOR晶体管导通网络 · PDF181")
#set text(lang:"zh",size:7.35pt)
#set par(justify:true,leading:2.1pt,spacing:4pt)
#align(center)[#text(size:8pt,weight:"bold")[162　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

// 续原书第180页例5.3：伪 NMOS 门电路，上拉 PMOS 栅极接地。
#pseudo-nmos-aoi22()

== 5.4　异或门和同或门

数字集成电路中两种重要的逻辑功能是“异或”（XOR）和“同或”（XNOR）功能：

$ f_("XOR") = bar(a) b + a bar(b) = "(XOR)" $

$ f_("XNOR") = bar(a) bar(b) + a b = "(XNOR)" $

这些功能可以通过多种方法实现。这里将介绍这些门的多种静态实现，而基于 CMOS 传输门的实现在随后的各章中进行介绍。

一种简单的实现是假设已经有 $a$、$bar(a)$、$b$ 和 $bar(b)$。在这种情况下，功能的实现简单地基于上一节的材料。相应的电路如图 5.14 所示。对于异或门，首先将 $f_("XOR")$ 功能取反，并用来建立下拉功能。因此需要两条支路，一条用于实现 $a b$，另一条用于实现 $bar(a) bar(b)$。晶体管的配置可以解释如下：如果 $a$ 和 $b$ 都为高，或者 $bar(a)$ 和 $bar(b)$ 都为低，则输出就为低；否则，输出为高。

#xor-xnor()
#align(center)[*图5.14　(a) 异或门和 (b) 同或门的静态实现（可编辑 MOS 器件串并联网络）*]

上拉支路直接实现 $f_("XOR")$ 的功能，但是每一项都用其反码代替，结果如图 5.14(a) 所示。需
