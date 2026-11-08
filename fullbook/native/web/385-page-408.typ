// SOURCE PDF PAGE 408; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第408页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("第11章 电源网格和时钟设计                 389")

#text("85")

#text("图 11.34 时钟树中信号的 EM 失效")

#text("*#11.4 PREV SARE IRR")

#text("本节中我们讨论用芯片内部时钟对外部提供的原始时钟进行同步的问题。在一块印刷电路板\n(PCB, printed circuit board ) 上有多个芯片的数字 VLSI 系统或系统芯片 (SOC，system-on-chip )\n的应用中,由于主参考时钟 ( Ref Clik ) 和局部产生的从时钟之间的等待时间可能引起几个问题。\n芯片上时钟等待时间的值在各个芯片之间或各个模块之间都可能不同。由于数据传输是用从时钟\n进行同步的，所以可能发生时序冒险和/或产生数据错误 ( 数据可能在一个错误的时间采样 ) 这\n些问题可以用锁相环 (PLL, phase-locked loop ) 和锁延迟环 (DLL, delay-locked loop ) 电路矫正")
