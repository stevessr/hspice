// SOURCE PDF PAGE 420; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第420页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("MRA SPICE 的简要介绍                   401")

#text("3一旦卡片组进行了成功的模拟，则可以用图形显示程序分析结果。SPICE 能以文本格式\n打印结果，但是用图形方式观察波形更好，这种形式也可以快速测量传输延迟，允许在\n一幅图中重登多个波形等\n图A.1 说明了这个设计流程。\nNMOS 的IV特性")

#text("SPICE Deck\n‘SPICE Code**")

#text("mL")

#text("图A.1 典型的 SPICE 设计流程\nA.3 句法")

#text("一个反相器电路的 SPICE 卡片组的例子如图 A.2 所示- 下面将简单描述每一行,在后面各节\n中再详细说明")

#text("Inverter Circuit")

#text("param Supply=1.8 * Set value of Vad")

#text("1ib ‘bsimv3.cmos.18um’ * Set 0.18um library\n-opt scale=0.1u * Set lambda (here lambda=0.10)")

#text("vad 10 ‘Supply’\nVin 2 0 pulse 0 “Supply” lns ons Ons 2ns dns\nMp 3.21.1 pnos L=2 We a       ad=40 pa=8\nMn 3 2 0 0 nmos L=2 We4 a        aa-20 pasa\nClea 20 LOE\n+ ‘Transient analysis\n-tran 50ps 5ns\n+ Ploteing requests\nplot tran v(3)\nend\n1\nMp\n2              3\nVie        Me     Croat\n四            10%\n上\n图A2 一个反相器电路的例子\n一个基本的 SPICE 文件包括如下内容:\n1一个标是")

#text("Inverter Circuit")
