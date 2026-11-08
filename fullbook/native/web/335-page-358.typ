// SOURCE PDF PAGE 358; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第358页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("第10章 连线设计         339")

#text("(间隔3-4A ) Co = 0.2 Blum; 对于宽松排列的连线 ( 间隔 30~40A ), Cy, = 0.1 人FIAm。从保守\n的角度考虑，我们将经常使用Co = 0.2 仔/um作为连线的电容。")

#text("为了确定 RC 阶梯的延迟，考虑 0.18 pm 工艺中的钻线，假设一条连线宽为W= 0.4 um,\nGo = 0.2 fEIkm ，并且Ra = 0.054 9/口。则对于 1 mm 长的连线，总的电阻是Reire   1.054 /0\nX 1000/0.4 = 125.0, MATL EEC ice = 0.2 fFIkm X 1000 km = 200 fF. 对总的 RC 延迟很容易\n算成0.7 ReieeCwice = (0.7)125 0 X200 FF = 17.5 ps，但实际的延迟接近 10 Ps。显然，我们需要一\n种精确的方法来计算这种 RC 阶梯的延迟。")

#text("由于Ruse和Cu是同时增加的, 我们可以假定响应时间实际上是按指数增长的, 如图 105(a)\n所示。实际的分布式 RC 线上的响应时间如图 10.5 ( b ) 所示。找到一条方便的途径来计算梯形网\n络延迟的关键是检查两幅图中下面部分的面积并且建立两种响应之间的关系。")

#text("Row")

#text("—w—")

#text("Te")

#text("1                            1\n09                           09\nox                           ox\n07                           07\n06                           06")

#text("> 05                          > 05\n04                           04\n03                           03\n02                           02\n加                           1")

#text("0                    0\n10-5 10 15 20 2530 35 40 45 0850 65. —0-S 10 15 20 2530 35 4S 30 SS OS 70\ntops)                   tps)")

#text("(a) M8 ROWE                     (>) Stik Re 波形\n图105 Ma RC 与分布式 RC 的输出波形\n图 105 (a) 中曲线下的面积称做第一时刻脉冲响应，可以通过下式计算:")

#text("醒积= | cear = RonCne")

#text("我们由此得到一个集总 RC 电路的精确时间常数。显然曲线下的面积提供了一阶延迟信息。\n如果将这些应用到图 10.5(b ) 的分布式 RC 波形中去, 可以发现曲线下的面积是我们称为 HEL,\n可以通过下式计算:")

#text("面积= [vow =r")

#text("这个量也是第一时刻脉冲响应，但电路设计人员通常称之为艾过延迟 ( Elmore delay ) ALAR)\n这是网络的主导时间常数并且是对延迟的一个较好估计。通常, 这个值的计算较为困难, 但对 RC\n网络来说该值的计算是相当直接的。RC 阶梯的艾蒙延迟计算要涉及到要对电路中每个节点计算\n该节点的电容与从起始节点到该节点所有电阻之和的乘积。")
