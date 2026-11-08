// SOURCE PDF PAGE 425; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第425页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("406        数字集成电路分析与设计一一深亚微米工艺 ( 第三版 )")

#text("Mn 2 3 0 0 nmos 1=2 w=4 as=20 ad=20 ps=4 pd=4\n向系统管理员询问模型库的文件路径和名称")

#text("元件特定的参数")

#text("诸如 MOSFET 的元件有额外的参数，比如长度和宽度等，为了说明这些值. 要提供需要说明\n的参数,随后是等号“= ”以及作为参数值的一个实数、参数的句法与前面对值的说明部分相同\n随后的例于说明了一个连接在节点 2 和节点 3 之间，名为“Mn”的 NMOS 器件，该器件使用模\n型“nmos”. 长度为2A，宽度为4A，源和漏的面积通常说明为用5A ( 源/漏扩展 ) 乘以宽度的值\n在深亚微米工艺里源测的周长应该说明为器件的宽度")

#text("Mn 2 3 0 © mmos 1=2 w=4 as=20 ad=20 ps=4 pd=4")

#text("有时，一行的室间可能不够说明所有的参数，额外的参数可以放在随后以“十”号开头的行\n中，并输入其余的参数下面的例子说明了同样的 NMOS 器件，但是参数尺寸在不同的行中")

#text("Mn 2   3    0    0 nmos\n+ 1=2 wed as-20 ad-20 ps=4 pd=4")

#text("元件句法")

#text("元件的句法是:")

#text("电压和电流源")

#text("Vaxx ont nm voltageval")

#text("Dox ont on carrentval")

#text("vse           电压源名称")

#text("Tox           电流源名称")

#text("ne            正节点")

#text("负节点")

#text("voltageval        电压源的值 可以是一个数值，或是在前而用 param fr >A\ncurrentval        Se ROSE OTLB. RSE CELT param 命令声明的常量")

#text("疼 AS 给出了一个名为“Vsupply”的电压源，连接于节点 5 和地之间。其电压值为 15 V;\n以及一个名为“Isupply”的电流源，连接于节点 2 和节点 3 之间，其电流值为用.param 指令声明\n过 ( 没有显示 ) 的'lee'安培值")

#text("Vsupply 5 0 15\nIsupply 2 3 ‘Ice’")

#text("5              2\nVou        ev\nIv             RA")

#text("0              3")

#text("FAAS 电压源和电流源")
