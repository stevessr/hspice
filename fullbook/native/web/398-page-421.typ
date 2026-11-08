// SOURCE PDF PAGE 421; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第421页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("402       数字集成电路分析与设计一深亚微米工艺 ( 第三版 )")

#text("2. 对各种全局参数例如入，YVYpp等的设置，以及使用的 MOS 器件模型使用的模型通过包\n含一个库文件来指定")

#text("-param Supply=1.8 * Set value of vdd\nlib ‘bsim3v3.cmos.18um’ * Set 0.18um library\n:opt scale=0.1u * Set lambda (here lambda=0.10)")

#text("3. 电路里的省、主动元件和被动元件的列表")

#text("Vad 1 0 ‘supply’\nMp 3 2 1 1 pmos L=2 W=8 as=40 ps=4 ad=40 pd=8\nMn 3 2 0 0 nmos L=2 W=4 as=20 ps=4 ad=20 pd=4\nCload 3 0 10€F")

#text("4分析声明 ( 直流，瞬态 )\n.tran 50ps Sns\n5绘图和打印声明")

#text(".plot tran v(3)\n6. TER.\n* Transient analysis\n7. 一个end 声明\nend\nA.3.1 标题\n所有 SPICE 文件的第一行都被编译器当做卡片组的标题 无论这一行中包括什么. 在这里最\n好使用撒述性的标题，其中包括日期、版本、名称等\nA.3.2 各种全局参数的设置\n可以设置的 3 种主要的全局参数是:\n1参数，它们是浮点类型的变量\n.param Supply=1.8 * Set value of vad\n2，库，其中包含用于各种 MOSFET 模型的参数\n.1ib ‘bsim3v3.cmos.1um’ * Set 0.18um library\n3. lambda，A单位的长度-: 由于使用的是 0.18 pum 工艺,所以A设置为 100 nm ( 为了方便)\n-opt scale=0.1u * Set lambda (here lambda=0.10)\n参数")

#text("SPICE 中的参数是全局变量的声明，可以用于峰信，例如电压源的电压 、 电阻器的电阻,或\n用于.de 和tran 命令中。参数声明的句法是:")

#text("param                                  paramnane=realnumber")
