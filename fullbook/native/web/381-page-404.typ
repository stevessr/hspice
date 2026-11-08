// SOURCE PDF PAGE 404; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第404页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("第 11 章 电源网格和时钟设计               385")

#text("图 11.26 “有传输门延迟的时钟发生器\n另一种简单的方法是用一个 SR 锁存器来产生两相时钟信号 ( 参见图 11.27 ) 这个电路有两")

#text("个缺点，应该进行检查和正确设计。 首先，输入的 CLK 信号在产生多时要经过一个额外的反相\n器进行传输，第二个问题是与第一个问题相关的- 其中的或非门不应该设计成尺寸相同的，而应\n当使输出信号有相同的响应，设计时还应该考虑取决于版图拓扑结构的连线总电容")

#text("i")

#text("图 11.27 基于镇存器的时钟发生器")

#text("11.3.6 ”高性能设计中的时钟分布")

#text("旦生成了时钟信号，需要将其分发到芯片各处- 由于偏斜、品声和功耗等问题，这成为一\n项复杂的任务，由于时钟信号需要在芯片上的所有区域基本一致,所以希望所有分布的时钟信号有\n一个一致的延迟，理想的分布网络是 H 树和 X 树结构，如图 11.28 所示。 在 H 树结构里，从中心\n到所有分支点的距离相同,因此信号延迟期望相同。 这种结构的局限性是由于布线限制和不一致的\nSH BOR FORRES. 另一种产生等长连线的格局是 X 时钟树。 与 H树相比,X 树有以下问题:")

#text("1\nae          xe\nta)               to)")

#text("图 11.28 ”对称时钟树")
