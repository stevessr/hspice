// SOURCE PDF PAGE 180 / printed 161. Fig5.13 general network and
// Example5.3 AOI22 true four-plus-four transistor-level network.
// Original source is a scan. Exact page-level 1:1 geometry remains unverified.
#import "../figures/ch5-complex-sequential-native.typ": complex-dual, example53
#set document(title:"第5章 · 图5.13对偶网络及例5.3 AOI22静态互补实现 · PDF180")
#set text(lang:"zh",size:7.3pt)
#set par(justify:true,leading:2.1pt,spacing:4pt)
#align(center)[#text(size:8pt,weight:"bold")[第 5 章　静态 MOS 门电路　　　　　　　　　161]]
#line(length:100%,stroke:.55pt)
#complex-dual()
#align(center)[*图5.13　通用复杂门的表示法*]

== 例5.3　复杂的 CMOS 门电路

*问题：* 用单级复杂 CMOS 门和伪 NMOS 门实现：

$ F = overline(A B + C D) $

*解答：* 对于 CMOS 门，为了得到 n 型器件复合结构的功能 $bar(F)=A B+C D$，首先要实现 $bar(F)$。这意味着需要将两条两两串联的 NMOS 路径再相互并联在一起。一条串联路径实现 $A B$，而另一条实现 $C D$。

接下来，取 $F$ 的反函数的对偶：

$ bar(F)_(dual) = (A+B)(C+D) $

这是 p 型器件复合结构中的功能实现。如果将摩根定律运用于 $F$，然后将每个变量取反，就可以得到相同的表达式。这意味着需要将两组两两并联的器件再串联在一起，一组是 $A$ 或 $B$，另一组是 $C$ 或 $D$。

#example53()

对于伪 NMOS 门，构造 n 型器件复合结构只需要第一部分。当然，上拉网络只有一个 PMOS 器件。很明显，在面积方面，伪 NMOS 比 CMOS 情况更有效。但伪 NMOS 在拉低输出时存在静态电流，而静态 CMOS 在理想稳态下无这种直流通路。
