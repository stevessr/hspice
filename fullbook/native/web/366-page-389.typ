// SOURCE PDF PAGE 389; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第389页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("370       数字集成电路分析与设计一一深亚徽米工艺 ( 第三版 )")

#text("EIN 11.3 所示的选择 BGA 封装时的 Laildr 的例子. 这里，供电电源驱动几个大反相器，\n并假设连线的电阴是零”所关注的电感是由于焊块和连接焊块与封装管壳 ( 提供干净的电源 ) 的\n连线所引起的”Vpp提供一个 25 mA 的电流，经过 100 ps 的时间间隔流人电路、同时，某些缓冲\n器在同样的时间周期内以大致相同的电流水平通过Vss 放电 假如焊块和通孔产生 0.2 nH 的电感\n那么在两条线上由电感导致的总电压降是:")

#text("考虑到电源电压只是 1.2 V、这是一个很显著的压降，此外.这只是要考虑的压降之一如果包\n括了电涛系统的电感，除了通孔本身的电感之外,我们将看到电源网格自己产生的 Leif 效应-\n我们还忽略了电源网格的电阻，以及其他很多缓冲器可能会同时转变的情况.")

#text("SH ReReAR Ante")

#text("Wo\nOD nH\nMs\n2\n图113 ”芯片外电感的影响")

#text("IR Fi Ldidr 都是动态现象, 由其共同引起的总压降需要采用图 11.4 所示的建模方法- 封装电\n感. 电源网格电感和电源网格电阻都必须用一个 RLC 连线模型共同考虑. 需要特别关注的是引起\n同步变化噪声 (SSN. simultaneous switching noise ) 的情形，这时有很多缓冲器一起变化而产生\nEAC TR 压降和地线反跳")

#text("Yoo")

#text("图 11.4 电源/地系统的电阻与电感组合效应")

#text("11.2.2 BEB")

#text("HCE AY ACH SPL EAS (EM, electromigration ) 效应，这是在芯片工作期间金")

#text("属线开始迁移并且最后断裂的情况这个过程所涉及的是由大电流密度引起的金属分子的迁移，")

#text("以及导致金属线短路或开路的较窗线宽。一旦发生这种现象，芯片可能无法完成预期的功能，或")

#text("不再满足时序规范，金属线上存在的裂纹或其他更疯特别容易引起这一问题，因为在电源系统里")

#text("的连接已经很不牢固了。由 EM 导致的失效可以是灾难性的，因为会发生在芯片已经在系统里并\n时在客户手上的时候")

#text("-个电迁移失效的例子如图 11.5 所示- 过去，往往电流密度较低，金属线路较宽.结合特别")

#text("的工艺，并且减少了 EM 的可能性。当超过 100 MHz 的速度，并且到达 0.8 pm 以下的几何尺寸")
