// SOURCE PDF PAGE 179 / printed 160. Scan-verified formula5.5, source
// CMOS dual-network explanation, and native transistor-level AOI21 (not boxes).
// Device strokes editable. Exact glyph geometry and page-level 1:1 unverified.
#import "../figures/ch5-complex-sequential-native.typ": aoi21
#set document(title:"第5章 · 德摩根定律与AOI21晶体管结构 · PDF179")
#set text(lang:"zh",size:7.4pt)
#set par(justify:true,leading:2.2pt,spacing:4pt)
#align(center)[#text(size:8pt,weight:"bold")[160　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

在本章的前文中，谈到了摩根定律的特殊情况。通常，摩根定律规定，将每个变量或元素用其反码代替，然后将与和或的函数互换，可以得到互补的函数。这是布尔代数中最有价值的规则之一，并且在复杂 CMOS 门的 PMOS 和 NMOS 结构的构造中也非常有用。

对于式（5.4）中所给的函数，可以像下面这样运用摩根定律：

$ F = overline((A+B) dot C) = overline(A+B) + bar(C) = bar(A) dot bar(B) + bar(C) quad "(5.5)" $

式（5.4）和式（5.5）中 $F$ 的逻辑表达式表明如何在一级逻辑中实现 CMOS 电路。首先研究式（5.4），指定了 NMOS 器件应当如何配置。因为 NMOS 晶体管产生的效果是将输出下拉到低，所以应当将 $F$ 取反以获得其功能实现。NMOS 实现的功能是 $bar(F)=(A+B) dot C$。NMOS 的实现需要两个输入为 $A$ 和 $B$ 的并联晶体管，再与输入为 $C$ 的第三个晶体管串联。

式（5.5）揭示了如何实现 PMOS 的功能。因为 PMOS 的功能是使输出上拉到高，并且器件有效地实现了每一项的互补，所以应该在逐项取反后实现这种功能。也就是说，应该利用 PMOS 器件实现 $F=bar(A)bar(B)+bar(C)$ 的功能。这就需要两个串联的 PMOS 器件实现 $bar(A)bar(B)$，然后再和输入为 $C$ 的晶体管并联。结果所得就是或与非的功能，如图 5.12 所示。

#aoi21()
#align(center)[*图5.12　$overline((A+B)C)$ 的复杂 CMOS 门实现（原生晶体管拓扑）*]

为了推广上面给出的例子，需要结合对偶原理和摩根定律，以便在单级电路中产生希望得到的功能。实际上，要在 CMOS 中实现一种功能，需要构造两个转换网络：一个下拉网络（n 型器件的复合结构）和一个上拉网络（p 型器件的复合结构），如图 5.13 所示。由于存在到地的活动通路，输出置为 0，n 型器件的复合结构定义成这种功能的反变量。通过创造一条到 $V_("DD")$ 的通路，输出置为 1，p 型器件的复合结构定义成这种功能的正变量。这两种功能应当互为对偶（与各个变量的互补一致）。

按规定，为了得到 n 型器件复合结构中实现的功能，应该得到给定的函数 $F$，并产生互补函数。对偶网络应该用于 p 型器件的复合结构，这可以通过互换“与”和“或”操作实现。对这两个网络对偶性的具体研究，可以通过在最后一步检查其正确性来实现。晶体管尺寸的确定采用了同基本的与非门和或非门描述相同的步骤。
