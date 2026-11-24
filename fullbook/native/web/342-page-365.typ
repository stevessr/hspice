// SOURCE PDF PAGE 365. Scan-guided editable Typst selection; NOT full 1:1 acceptance.
// Original source scan: printed page 346; images/figures are editable abstractions.
#set document(title:"第10章·连线设计·源扫描PDF365")
#set text(size:7.2pt)
#show par: set par(leading:2.3pt,spacing:3.4pt)
#align(center)[#text(size:7.5pt,weight:"bold")[346　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

本文沿用第10.3节的缓冲器插入模型，对长度为 $L$ 的互连线分成 $N$ 段，并使用相对于最小尺寸放大 $M$ 倍的反相器。

图 10.10(c) 的单段 π 模型中，一侧电容包括驱动器自身寄生电容和半段线电容；另一侧还包括后级缓冲器输入电容。将这两部分电容分别乘以它们到驱动端公共路径上的电阻，可以逐项求出单段艾蒙延迟：

$ t_"segment" = (R_"eqn"/M) (C_J M (1+beta) + (C_"int" L)/(2N)) $

$ + (R_"eqn"/M + (R_"int" L)/N)((C_"int" L)/(2N) + C_G M(1+beta)) $

总的延迟是每段延迟的 $N$ 倍。重新整理之后，我们发现它是一个与 $N$ 成二次方关系的公式。原书给出总延迟式（10.8）：

#align(center)[$ t_"total" = N (C_G + C_J) R_"eqn" (1 + beta) +
  (C_G (1 + beta) R_"int" M + (C_"int" R_"eqn")/M) L
  + (C_"int" R_"int")/(2 N) L^2 quad (10.8) $]

检查每个延迟项时，第一项仅与缓冲器有关，最后一项仅与连线有关；中间项有两部分：一项由驱动下一级缓冲器输入电容的导线电阻产生，另一项 RC 由驱动导线电容的缓冲器产生。

对分段数 $N$ 求导并令其为零，可以得到：

#align(center)[$ (dif t_"total")/(dif N) = R_"eqn" (C_J + C_G) (1+beta) - (R_"int" C_"int" L^2)/(2 N^2) = 0 $]
#align(center)[$ N = sqrt((R_"int" C_"int" L^2)/(2 R_"eqn" (C_J+C_G) (1+beta))) = sqrt(t_"wire"/"FO1") quad (10.9) $]

假设各级缓冲器相同，对缓冲器尺寸 $M$ 求导：

#align(center)[$ (dif t_"total")/(dif M) = R_"int" L C_G (1+beta) - (R_"eqn" C_"int" L)/(M^2) = 0 $]
#align(center)[$ M = sqrt((R_"eqn" C_"int")/(C_G (1+beta) R_"int")) quad (10.10) $]

因此最优分段数随线长增大而增大，而最优等尺寸缓冲器的尺度主要由工艺的器件与互连参数决定，与这条线的长度无关。

式（10.8）中的中间项取决于 $M$，当中间项的两项表达式相等时，可求得最佳 $M$。与 $N$ 不同，$M$ 不取决于导线长度，而只取决于晶体管和导线的物理特性。这意味着一旦工艺参数确定，可以算出最佳缓冲器尺寸。

将缓冲器插入问题和第 6 章描述的逻辑努力（LE）比较很有用。对于缓冲器插入，考虑驱动一个长导线，所以把导线分段，并且在导线段之间插入非常大的等尺寸缓冲器。对于逻辑功效，目标是从一个小的输入电容驱动一个非常大的输出电容，解决方法是决定缓冲器的数目，并且用给定因子逐级放大缓冲器，比例因子的典型值为 4X。在 LE 里，优化的解决方案中，经过每级缓冲器的延迟是相同的；在缓冲器插入情况下，最优化总是缓冲器和导线产生的延迟相同。
