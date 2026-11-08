// SOURCE PDF PAGE 365. Scan-guided editable Typst selection; NOT full 1:1 acceptance.
// Original source scan: printed page 346; images/figures are editable abstractions.
#set document(title:"第10章·连线设计·源扫描PDF365")
#set text(size:7.2pt)
#show par: set par(leading:2.3pt,spacing:3.4pt)
#align(center)[#text(size:7.5pt,weight:"bold")[346　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

本文沿用第10.3节的缓冲器插入模型，对长度为 $L$ 的互连线分成 $N$ 段，并使用相对于最小尺寸放大 $M$ 倍的反相器。

原书在式（10.8）前先给出每段线网的艾蒙延迟：

#align(center)[$t_"segment" = R_"eqn"/M (C_J M(1 + beta) + C_"int" L/(2N))$]
#align(center)[$+ (R_"eqn"/M + R_"int" L/N) (C_"int" L/(2N) + C_G M(1 + beta))$]

每一段的延迟同时包含缓冲器等效电阻、缓冲器输入与输出电容、导线电阻和单位长度导线电容。乘以段数 $N$ 并整理后，原书给出总延迟式（10.8）：

#align(center)[$ t_"total" = N (C_G + C_J) R_"eqn" (1 + beta) +
  (C_G (1 + beta) R_"int" M + (C_"int" R_"eqn")/M) L
  + (C_"int" R_"int")/(2 N) L^2 quad (10.8) $]

第一项只由缓冲器自身产生，最后一项只由互连线产生。中间两项分别对应导线电阻驱动后级栅电容、以及缓冲器电阻驱动导线电容。

对分段数 $N$ 求导并令其为零，可以得到：

#align(center)[$ (dif t_"total")/(dif N) = R_"eqn" (C_J + C_G) (1+beta) - (R_"int" C_"int" L^2)/(2 N^2) = 0 $]
#align(center)[$ N = sqrt((R_"int" C_"int" L^2)/(2 R_"eqn" (C_J+C_G) (1+beta))) = sqrt(t_"wire"/"FO1") quad (10.9) $]

假设各级缓冲器相同，对缓冲器尺寸 $M$ 求导：

#align(center)[$ (dif t_"total")/(dif M) = R_"int" L C_G (1+beta) - (R_"eqn" C_"int" L)/(M^2) = 0 $]
#align(center)[$ M = sqrt((R_"eqn" C_"int")/(C_G (1+beta) R_"int")) quad (10.10) $]

因此最优分段数随线长增大而增大，而最优等尺寸缓冲器的尺度主要由工艺的器件与互连参数决定，与这条线的长度无关。

教材还把缓冲器插入与第6章的逻辑努力（LE）作对照：后者通常采用逐级放大（典型级比约4倍）的缓冲链；长线插入则在各段之间使用相同尺寸的缓冲器，平衡缓冲器和导线产生的延迟。
