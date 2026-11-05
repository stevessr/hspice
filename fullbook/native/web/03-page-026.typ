// PDF 026 / printed page 7; source-based native Typst editing draft.
// HTML export is structural: avoid layout-only align/grid wrappers around diagrams.
// Native geometry lives in ../figures/gate-symbols.typ and is always editable.
#import "../figures/gate-symbols.typ": gate-symbol, dff-symbol, mux-symbol
#set document(title: "原书第26页：逻辑门、D触发器及激励表")
#set text(lang: "zh")

= 第1章　深亚微米数字集成电路设计 · 第7页

== 图1.4：缓冲器、或非门与与非门

#gate-symbol(kind: "buffer")
#gate-symbol(kind: "inverter")
#gate-symbol(kind: "inverter")

缓冲器

#gate-symbol(kind: "nor", inputs: 3)
#gate-symbol(kind: "and", inputs: 3, inverted-inputs: true)

3 输入 NOR

#gate-symbol(kind: "nand", inputs: 3)
#gate-symbol(kind: "or", inputs: 3, inverted-inputs: true)

3 输入 NAND

*图1.4　缓冲器、或非门和与非门的两种不同表示法。*

*练习1.1*　仅用图1.3和图1.4中的门，画出下面各个门的详细逻辑电路：AND、OR、XOR、XNOR和2输入的多路选择器。

#gate-symbol(kind: "and")
#gate-symbol(kind: "xor")
#mux-symbol()
#gate-symbol(kind: "or")
#gate-symbol(kind: "xnor")

== D型触发器与图1.5

时序逻辑元件，如触发器和锁存器，都可以通过上面描述的基本逻辑单元并利用反馈来构造。

存在各种各样的触发器：D触发器、JK触发器、T触发器、SR触发器，等等。这些元件通常用来存储逻辑值，直到输入发生变化并且有一个时钟信号驱使它们读取新的数据为止。

图1.5给出了一个简单的D型触发器（DFF，D-type flip-flop）及其相应的激励表。当时钟从低到高发生转换时，数据输入端的值读入到DFF，然后经过传输，在输出端得到这个值。在所有其他条件下，输出端的值都保持为它的前一个值。这就是所谓的上升沿触发的触发器，意味着输入仅在时钟的上升沿才被采样。表中的X状态表示“不确定”状态，标志此时的输出并不取决于相应的输入值。

#dff-symbol()

DFF示意图

#table(
  columns: (auto, auto, auto, auto),
  inset: (x: 7pt, y: 3pt),
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

*图1.5　上升沿触发的D型触发器。*

_校对边界：_ 图1.4、1.5的器件图符和DFF激励表已采用Typst原生曲线、图元和表格；还未完成与源扫描第26页的全部字体、图形几何、行距和页脚位置的逐项对比，不能标记整页1:1验收通过。
