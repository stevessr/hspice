// SOURCE PDF PAGE 024 / printed p.5 / Table 1.1 and Fig 1.3.
// Reconstructed source text, table, gate symbols and truth tables in editable Typst.
// Semantic table replaces HTML-invisible grid; all 1:1 page geometry still unverified.
#import "../figures/gate-symbols.typ": gate-symbol
#set document(title:"第1章 · DSM器件互连对照表与基本逻辑门 · PDF024")
#set text(lang:"zh",size:7.5pt)
#set par(justify:true,leading:2.2pt,spacing:3.2pt)
#align(center)[#text(size:8pt,weight:"bold")[第 1 章　深亚微米数字集成电路设计　　　　　　　　　5]]
#line(length:100%,stroke:.55pt)

#align(center)[*表1.1　主要的 DSM 器件问题和互连问题的简要列表*]
#table(
  columns:(1fr,1fr),
  stroke:(top:.5pt,bottom:.5pt),
  inset:(x:5pt,y:2.4pt),
  table.header([*DSM 器件*],[*DSM 互连*]),
  [短沟道效应对 $V_T$ 的影响],[RC 延迟],
  [速度饱和],[IR 降低],
  [薄氧化层（隧道/穿通）],[$L dif i / dif t$],
  [亚阈值电流],[电容耦合],
  [DIBL],[电感耦合],
  [热载流子效应],[电迁移],
  [],[天线效应],
)

本书主要讨论 0.18 μm 和 0.13 μm 工艺中的数字集成电路设计。130 nm 工艺的特点是采用低 k 介质的铜互连线，器件采用双阱工艺和浅沟槽隔离（STI，shallow trench isolation）。由于材料的变化，这种工艺与以前的各代工艺是不同的，但与后面的两代工艺（90 nm 和 65 nm）是相似的。在研究基本原理时，0.13 μm 工艺与 0.18 μm 工艺也有许多相似之处。在 0.18 μm 工艺中，采用的材料是铝连线和钨通孔。在 0.18 μm 及其后面的各代工艺中使用的也是浅沟槽隔离工艺。除了这些区别之外，本书中描述的设计和分析方法对它们都是适用的。在写这本书的时候，0.18 μm 是主导工艺，因此这种工艺的覆盖面是相当大的。此外，对 0.18 μm 工艺文件的访问可以通过许多网站获得。同时，本书中包括了许多 0.18 μm 的例子。

== 1.3　数字逻辑门设计的回顾

=== 1.3.1　基本的逻辑函数

在我们开始数字集成电路的设计的时候，首先复习设计过程中将会用到的基本逻辑原理，并详细描述本书中将要用到的某些逻辑符号。数字逻辑门实现的是布尔函数，例如反相器（INV，inverter）、与非门（NAND）和或非门（NOR）等。任何逻辑功能都可以由这些基本的逻辑门构成。这些组合门及其相应的真值表如图1.3 所示。

// Typst grids are ignored on HTML export. A semantic three-column table
// retains all gates and truth tables in the actual VitePress HTML version.
#table(
  columns:(1fr,1fr,1fr),stroke:none,inset:(x:2pt,y:3pt),
  [
    #align(center)[*反相器（INV）*]
    #gate-symbol(kind: "inverter")
    #table(columns:(1fr,1fr),inset:2pt,
      table.header([A],[F]),
      [0],[1],
      [1],[0],
    )
  ],
  [
    #align(center)[*NAND*]
    #gate-symbol(kind: "nand")
    #table(columns:(1fr,1fr,1fr),inset:2pt,
      table.header([A],[B],[F]),
      [0],[0],[1],
      [0],[1],[1],
      [1],[0],[1],
      [1],[1],[0],
    )
  ],
  [
    #align(center)[*NOR*]
    #gate-symbol(kind: "nor")
    #table(columns:(1fr,1fr,1fr),inset:2pt,
      table.header([A],[B],[F]),
      [0],[0],[1],
      [0],[1],[0],
      [1],[0],[0],
      [1],[1],[0],
    )
  ]
)
#align(center)[*图 1.3　基本的逻辑门*]

#text(size:6.2pt)[¹ 这部分内容比较简单，熟悉这部分内容的读者可以跳过本节。]
