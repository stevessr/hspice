// SOURCE PDF PAGE 415 / printed 396; scan-guided editable Chapter 11.
// Original illustrations are editable abstractions; full-page 1:1 review remains open.
#import "../figures/ch11-pll-summary-native.typ": fig1135,fig1136,fig1137,fig1138,fig1139,fig1140,fig1141,fig1142,fig1143,fig1144
#set document(title:"第11章 · PLL/DLL 时钟同步 · PDF415")
#set text(lang:"zh",size:7.25pt)
#show par: set par(leading:2pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[396　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.5pt)

盒子时钟（box clock）分别驱动对应执行部件的大时钟网格。这些执行部件包括浮点部件、总线接口、取/存部件、整数处理部件和指令发射部件。更小的局部时钟可根据需要从任何时钟上产生。对于局部缓冲器的数量、大小或逻辑功能，以及生成时钟的占空比没有严格的限制。

#fig1143()
#align(center)[#text(size:7.2pt)[图 11.43　全局时钟（GCLK）分布网络]]

#fig1144()
#align(center)[#text(size:7.2pt)[图 11.44　600 MHz Alpha 微处理器的时钟层次]]

== 11.5　参考文献

1. M. Pedram and J. Rabaey, *Power Aware Design Methodologies*, Kluwer Academic Publishers, Boston, MA, 2002.

2. F. Gardiner, *Phaselock Techniques*, John Wiley–Interscience, 2nd ed., New York, 1979.

3. I. Young, J. Greason, and K. Wong, “A PLL Clock Generator with 5 to 110 MHz of Lock Range for Microprocessors,” *JSSC*, Vol. 27, No. 11, November 1992, pp. 1599–1607.

_原扫描本页的参考文献第 3 条在下一页续行；此处为便于全文检索合并为完整引文。_
