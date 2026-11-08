// SOURCE PDF PAGE 390; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第390页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("第11章 电源网格和时钟设计                371")

#text("时, 对馈来说 EM 问题的可能性将增加。 转向使用钢的原因之一是对电迁移来说铀有较高的性能。\n对 EM 问题钢大约比钻好 10 倍。但是，铀通过氧化物的扩散速度很快，由于这个问题过去在集\n成电路中没有使用铜。然而，加工工艺的进步解决了这个问题，使得最后由馈转而用铜。铀最初\n的电迁移结果显示比馈好一点，而随着工艺的成熟希望有大的改进。遗钴的是，目前与用于馈的\n钨通孔相比，铀通孔有更大程度的 EM 失效。")

#text("4k RG")

#text("s      wl wo\ntad\n图 11.5 电源线上的电迁移失效\n电源网格里的电迁移是流经金属线和通孔的平均电流的函数。在每条电源线中电流基本是沿\n一个方向流动的，因为对Vpp来说，电源线要将电流从电源乓点传递到门(参见图 11.1)。因此，\n认为这是一种直流现象。为了评估一片金属耐受 EM 的能力，可以考察其平均直流电流密度 J,\n并与当 EM 失效发生时的某个允许的电流水平 fas相比较。由于设计中不同层的金属线厚度和材\n料性质不一样，所以每层金属可能有不同的失效标准-\n通过一个称为平均失效时间 CMTE, mean time to failure ) 的量度来描述由于长期可靠性决\n定的芯片寿命是很有用的。如果 MTT 值比嵌入芯片的产品的期望寿命大 S~10 倍，则可以安全\n地把这个设计交给用户。然而，如果芯片寿命小于产品寿命，则必须进行设计改善。布来克定律\n(Black's law ) 使用平均电流密度 / 和失效的激活能量7AH来估计金属连线的 MTTF:\nA\nMITE = 4 exp(AH/k\nporary,                 (13)\n其中，MTTF 是在总体样本中失效的中值时间，4 是一个经验拟合系数。MTTE 与三成反比,并\n对温度非常敏感。对一个目标 MTTF，jmu的值可以从上述公式得出，其单位是安培/平方厘米\n(Alem?)。 一个典型的 je值大约是 105 Alcm2，或 10 mAJnmz。对每段连线将这个值与实际电流\n密度进行对比来评估发生电迁移的可能性，")

#text("CD 电计移作为一个在给定能量水平下的热激活扩散过程建立模型。激活能重取决于扩贱机制，可以通过部格\n(CAH = 14 ev), HRTEM AME (AH = 06 eV ):")
