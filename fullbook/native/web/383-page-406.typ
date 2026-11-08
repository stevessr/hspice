// SOURCE PDF PAGE 406; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第406页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("HUF 电源网格和时钟设计             387")

#text("和元件")

#text("YYY9YYYYYYYY")

#text("msi                          ere\nett\nseve OLLI               Feetat aime\n图 11.31 时钟树举例")

#text("图 01.31 给出了两个有烙外特性的时钟网络。在上面的图中，时钟树除了标准时钟信号外还\n产生了一个反相时钟，在下面的图中时钟树产生了一个门控时钟信叶和一个标准时钟信号，当\n我们想要阻止时钟触发一个触发器来降低功耗时门控时钟是很有用的")

#text("11.3.7 时钟分布网络举例")

#text("Pel 11.32 给出了一个从工业芯片中提取的时钟网络- 这与用于 11.2.5 节中的例子相同，与整\n个时钟相关的连线如图中所示- 时钟树从根节点开始并且分型成几条主干线，局部时钟从它们发\n出”两个空的区域是存储器和数据路径区域. 时钟驱动存储器电路中的译码器 ( 就在主干线标注\n的下面 ) 右边的时钟主干线驱动数据路径、其余的块从穿    们的内部干线中获得其局部时钟")

#text("在这棵时钟树上的缓冲器采用的是图 11.30 ( b ) 所示的有统一尺寸的形式。转变时这些缓冲\n器汲取数量显著的电流”事实上，标注着局部时钟分布的部分有数量很大的缓冲器，当它们同时\n变化时,在电源网格里产生了显著的 IR TEBE “问忆图 11.14, 会发现在这个区域 只 压降是最显著\n的，并且违反了 10%的蝶声预算，这个 人R 压降转变为额外的延迟，导致玫外的时钟偏斜。具有\n讽刺意味的是, 时钟本身导致了 /R 压降问题. 这就是为什么时钟和电源分布系统经常在一起设计\n的原因")

#text("近来，在时钟信号线上由于有来回流动的大电流，产生了电迁移 ( EM ) 问题。因此信号线\n路上的 EM 是交流现象“其结果是我们必须计算均方根 (RMS. root-mean-square ) 值而不是平均电\n流{ 对交流情况趋向于接近零 ) 将 RMS 电流密度jw与另一个 EM 极限 cm进行比较，Ncmsu")
