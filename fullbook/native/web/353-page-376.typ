// SOURCE PDF PAGE 376; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第376页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("第10章 连线设计              357")

#text("同时，工艺工程师们和设计者们努力减少导线电阻首先, 通过引人铜替代铅来减少金属线电阻\n其次，对特定信号使用非常宽的导线使电阻显著降低、电阻的减少伴随着工作频率的增加使电抗\n项村特定信号不可忽略有趣的是，虽然电感值近年来没有增加，但频率的增加和电阻的降低结\n合在一起使我们需要加强对电感的考虑")

#text("下        L     te")

#text("图1023 REC 连线的集总模型")

#text("以上分析在某种程度上是局限于连线本身的。考虑电感的重要性时，同时考虑导线电阻和驱\n动导线的缓冲器的导通电阻是非常重要的，在大多数情况下，缓串器电阻非常大 ( 在千罗钱数量\n级) 并月起主导作用，即，\nRoster + Run > jo\nDUA, RR ARG HAR BRE LR GR RIE PORE, BRITT\n得出:\nRouter + Ree < jo                        (10.22)")

#text("电感值得关注，这在时钟线路上最显著。所以，应该用RLC延迟公式来计算延迟\n其次，我们在分析中包含电容。图 10.24 中的无损传输线中有电感和电容但是没有电阻。它\n被一个源电阳为R的电压源K驱动由于连线没有电阻，所以能用特征阻抗 2表示， 其值如下:")

#text("给连线施加一个阶路输入时，其响应取决于Rs和轧的相对值  当电阻比特征阻抗大很多时，也就\n是当Rs >> 入时、RC 效应将主导瞬态响应”我们预期的指数响应给出如下:\nWo =~ 1m")

#text("如图 10.23 BRAS. FEM RES tL FHM Tale ABH")

#text("然而、如果Rs < Za, HARRIES A HEE, RAMA — et 该响应的\n善记形式给出如下:")

#text("Vou(t) = 1 = re “cos (bt + c)")

#text("其中,~ a, 6 Ac BORE RUC 值.这幅图说明了响应的本质  注意在这种情况下二和#很短，但\n换来的是波形相当大的过冲和下冲，以及较长的沉降时间 ( settling time ) t,. 这些延迟值可以从\n上述响应公式中计算得出")

#text("最后,我们分析一个考虑了分布效应的有损耗传输线路 对于这种情况,分布式 RLC 线路的\n长度 / 在是青显示电感效应中起作用特别是信和号沿着导线传输时 ， 由于导线电阴导致某种程度\n的豆减，当信号抵达导线的末端时、 会反射离开负载阳抗并且向源反向传输- 这个反射信号沿导\n线返回时也会训碱”向前和向后传输的信号的交互现象导致转 10.24 中可以观察到的激振现象。")

#text("如果导线非常长 则电感现象由于信号误减将无法观察到，以 下的标准椎导可以用来找到发生电\n感效应的长度最大值:")
