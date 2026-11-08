// SOURCE PDF PAGE 365; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第365页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("346        数字集成电路分析与设计一“深亚微米工艺 ( 第三版 )")

#text("R,         Ca\nte 2(cma +B)+ Sat)\nRem, Rink) ( Ca\n+ (Gp A )(Gre come +9)\n总的延迟是每段延迟的N倍- 重新整理之后我们发现它是一个与/成二次方关系的公式,")

#text("tm = NX teemo = N(Cc+ C)Rege(1 + B)\nCia eqn        CanRi \\ 13\n« (cara Se) « (Sane\nM            2N                 (108)")

#text("检查每个延迟项时，我们发现第一项仅与缓冲器有关，最后一项仅与连线有关中间项有两\n部分: 一项由驱动下一级缓冲器输入电容的导线电阻产生，另一 RC 项由驱动导线电容的缓冲器\n产生")

#text("为了找到 N 和 M 的最优值，我们对每个变量求导，如下所示。导线段的数目是:")

#text("RiggCil?\n2N?")

#text("[RC _ [hee\nReg (C; + Ca)(1 + B)    FOI               (109)")

#text("假设所有的缓冲器相同，则缓冲器的尺寸是:")

#text("jh                RegeCinl\nSot -0 = RylCo(l +B) —  Tm")

#text("At on")

#text("aN")

#text("Reg(Cy + Co)(1 + B) ~")

#text("j_Ren Ca\nColl + B) Rie                         (10.10)")

#text("使用上述 N 和 M 的值，能得到连线的优化延迟值。通过检查式 ( 10.8 ) 提供的总延迟我们\n能深入理解这些值。变量 N 存在于teu第一项和最后一项。这些项分别由缓冲器和连线产生，每\n一项与另一项完全独立,仿佛另一项不存在- 如果设这两项相等, 我们获得可以得到 N 的最优值\n的公式，式 ( 10.9 ) 中平方根符号下面的表达式中可以看做是连线延迟 ( 依照艾蒙延迟是tue )\n除以驱动一个相同反相器的反相器延迟 ( 1 A HEE )")

#text("式 ( 10.8 ) 中总延迟表达式的中间项取决于 M。 如果设中间项中的两项表达式相等，可以得\n到 M 的最优值。 这个值不取决于导线的长度，而是取决于晶体管和导线的物理特性。 事实上, 这\n个值仅取决于导线和最小尺寸反相器的工艺参数。 所以，一旦工艺参数确定就可以算出这个值\n应当注意，要想产生准确的结果需要表达式中各项的精确值")

#text("将缓冲器插人问题和第 6 章描述的逻辑 ( LE ) 功效问题进行比较和对照很有用。对于缓冲器\n插入,我们考虑驱动一个长导线, 所以把导线分段并且在导线段之间插入非常大的等尺寸缓冲器，\n对于逻辑功效，目标是从一个小的输入电容驱动一个非常大的输出电容。解决方法是决定缓冲器\n的数目并且用给定因子逐级放大缓冲跨，比例因子的典型值是 4X。在 LE 里. 优化的解决方案中\n经过每级缓冲器的延迟是相同的在缓冲器插人情况下，最优化点是缓冲因和导线产生的延迟\n相同")
