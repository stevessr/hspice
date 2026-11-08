// SOURCE PDF PAGE 412; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第412页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("第11 章 电源网格和时钟设计             393")

#text("我们现在可以确定两个重要的系统传输函数: 开环增益和闭环增益，开环增益可以通过检查\n从输入到输出的直接路径来获得:")

#text("FEO = Kt) B= cg\n闭环增益通过环绕环路一次获得，并且能根据开环增益给出:\nKral) ~ Boa(3))F(S)*! = Oyu)")

#text("G(s)")

#text("Kohls)\n“TF a9)")

#text("fe       1+ Kyo)")

#text("(19)")

#text("对于这种系统的稳定性的经典研究方式是用分析该开环系统的频率响应来进行的。这可以通过分\n析上面的式 (1.9 ) 来理解. 如果分母中的 C(3)等于-1，闭环增益趋向无穷大. 条件 Gls) = 一1发\n生在当G(9) 的数值是 1 并且相位是-180*时。从实际角度看，在这种条件下可以认为系统是不稳\n定的。通过检查式 ( 11.9 )，可以知道决定系统稳定性的项是环路滤波器 R)")

#text("在图 11.40 里，给出了环路滤波器的 3 种选择。我们曾经假设环路滤波器可以用一个接地电\n容实现，这是一个一阶滤波器 ( 有一个极点 ) 产生了一个二阶 PLL ( 因为 PLL 由于积分器的原\n央已经有一个极点 然而，将一个简单的电容作为环路滤波器使用导致了 PLL 的不稳定，因为\nTES = 0时引入了两个极点，这将立即使相位设置为-180*.")

#text("G0) = Ky Ae                  te   Rae")

#text("Ging!) Me")

#text("Gin kp.")

#text("bale qyc;\nHERG                     + =")

#text("图 11.40 PLL 低通滤波器的几种选择")

#text("如果把一个电阻与电容串联，如图 11.40 中第二幅图所示，, 将在传输函数中插入一个零点，\n这使得整个 PLL 的频率响应稳定。 这也是一个二阶 PLL, 因为滤波器是一阶的。对这个滤波器进")
