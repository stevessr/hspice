// SOURCE PDF PAGE 026 | Native Typst transcription and vector redraw.
// Source: printed page 7 of Chapter 1; figure 1.4, exercise 1.1, figure 1.5.
// STATUS: key text and figure semantics transcribed; pixel-layout still to compare.
#import "../figures/gate-symbols.typ": gate-symbol, dff-symbol, mux-symbol

#set document(title: "原书第26页：基本逻辑门与上升沿 D 触发器")
#set text(lang: "zh")

#align(center)[*第 1 章　深亚微米数字集成电路设计*　　7]
#align(center)[
  #grid(
    columns: (1fr, 1fr), column-gutter: 9pt, row-gutter: 3pt,
    [#align(center)[#gate-symbol(kind: "buffer")]],
    [#align(center)[#gate-symbol(kind: "inverter") #gate-symbol(kind: "inverter")]],
    [#align(center)[#gate-symbol(kind: "nor", inputs: 3)]],
    [#align(center)[#gate-symbol(kind: "and", inputs: 3, inverted-inputs: true)]],
    [#align(center)[#gate-symbol(kind: "nand", inputs: 3)]],
    [#align(center)[#gate-symbol(kind: "or", inputs: 3, inverted-inputs: true)]],
  )
]
#align(center)[*图 1.4　缓冲器、或非门和与非门的两种不同的表示法*]

*练习 1.1*　仅用图 1.3 和图 1.4 中的门，画出下面各个门的详细逻辑电路：AND、OR、XOR、XNOR 和 2 输入的多路选择器。

#align(center)[
  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 5pt,
    [#align(center)[#gate-symbol(kind: "and") *AND*]],
    [#align(center)[#gate-symbol(kind: "xor") *XOR*]],
    [#align(center)[#mux-symbol() *2 输入多路选择器*]],
    [#align(center)[#gate-symbol(kind: "or") *OR*]],
    [#align(center)[#gate-symbol(kind: "xnor") *XNOR*]],
    []
  )
]

时序逻辑元件，如触发器和锁存器，都可以通过上面描述的基本逻辑单元并利用反馈来构造。存在各种各样的触发器：D 触发器、JK 触发器、T 触发器、SR 触发器，等等。这些元件通常用来存储逻辑值，直到输入发生变化并且有一个时钟信号驱使它们读取新的数据为止。

图 1.5 给出了一个简单的 D 型触发器（DFF，D-type flip-flop）及其相应的激励表。当时钟从低到高发生转换时，数据输入端的值读入到 DFF，然后经过传输，在输出端得到这个值。在所有其他条件下，输出端的值都保持为它的前一个值。这就是所谓的上升沿触发的触发器，意味着输入仅在时钟的上升沿才被采样。表中的 X 状态表示“不确定”状态，标志此时的输出并不取决于相应的输入值。

#align(center)[
  #grid(columns: (1fr, 1.5fr), column-gutter: 12pt,
    [#align(center)[#dff-symbol() \ DFF 示意图]],
    [#align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        inset: (x: 5pt, y: 2pt),
        table.header([*Clk*], [*D*], [*Q（旧）*], [*Q（新）*]),
        [0], [X], [0], [0],
        [0], [X], [1], [1],
        [0→1], [0], [X], [0],
        [0→1], [1], [X], [1],
        [1], [X], [0], [0],
        [1], [X], [1], [1],
        [1→0], [X], [0], [0],
        [1→0], [X], [1], [1],
      )
      激励表
    ]],
  )
]
#align(center)[*图 1.5　上升沿触发的 D 型触发器*]

#text(size: 8pt, fill: rgb("7d492a"))[
  校对状态：本页图形全部采用可编辑的 Typst 曲线、圆、矩形和文字表格，不再是整页截图。
  图 1.4 的替代图符、图 1.5 的边沿记号与坐标位置仍需与原页高分辨率图进行逐项几何比对；
  因此此页暂不标记为完整 1:1 验收通过。
]
