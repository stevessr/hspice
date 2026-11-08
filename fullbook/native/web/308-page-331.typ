// SOURCE PDF PAGE 331; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第331页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("312      数字集成电路分析与设计一一深亚微米工艺 ( 第三版 )")

#text("疼的布边是决定 PLB 是时序还是组合的元件.为多路器而设置的 SRAM 位决定了输出是直\n接从传输管树得到还是从 D 触发器的输出 Q 得到- 选择传输管树输出产生了一个组合电路,而选\n择 D 触发器输出产生了一个时序电路。触发器是边沿触发的，并且申输入到 PLB 的一个附加的\nCLK 信号近制 注意在 FPGA 中, 时钟必须对称连到所有的 PLB. 因为所有的触发器都需要时钟\n当然现代的 FPGA 有许多附加的时钟必须连接到其他类型的块中")

#text("例9.2 FPGA BMS")

#text("问题:")

#text("1679.9 中，PLB 实现的功能是什么”这个函数是组合的还是时序的?")

#text("RE:")

#text("使用卡诺图,得到Out = 8 + AC. 这是一个组合功能，由于 SRAM 位设置为\n触发器的输出没有被选通通过多路器，")

#text("，所以 D")

#text("逻辑块间的连接使用预制的布线轨迹来实现。这些布线轨迹通过传输管彼此间相互连接，并\n连接到逻辑块上，每一个传输管都被一个 SRAM 位控制。图 9.10 对此进行了说明")

#text("图9.10 可编程的连接")
