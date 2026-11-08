// SOURCE PDF PAGE 431; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第431页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("412        数字集成电路分析与设计一“深亚微米工艺 ( 第三版)")

#text("* This is a comment **")

#text("R52 0 10k * This is also a comment.")

#text("ic 声明")

#text("在有些情况下, 为了进行有意义的模拟, 在时间# = 0时一个电路节点的初始条件必须加以说\n明。为了达到这个日的，可以用ic 声明     须在.tran 命令行中用一个“uic”指令来标记，以\n便在模拟期间可以使用初始条件、例如，如果初始时节点 5 必须设置为 18 V，并且节点 7 要设\n车为0V，则应使用如下两行表示:")

#text(".ic V(5)=1.8  V(7)=0")

#text(".tran 50ps 5ns uic")

#text(":end 声明")

#text("为了结束卡片组，需要使用.end 声明来告诉 SPICE 这是文件的结束,任何在.end 之后输入的\n行都被忽略")

#text("A.4 完整的SPICE 示例")

#text("FS A.12 给出了对一个 NMOS 的 VY特性的直流分析, 是在 Vgate 的 5 个不同的值从0到18 V\nFi Vdrain 得到的:")

#text("IV Characteristic of NMOS")

#text("<param Supply=1.8      * Set value of vaa")

#text("-lib ‘bsim3v3.cmos.18um’ * Set 0.18um library")

#text(".opt scale=0.1u       * Set lambda (here lambda=0.10)")

#text("* Voltage sources\nvarain 2 0 ‘Supply’")

#text("vgate 1 0 ‘Supply’")

#text("* A minimum width NMOS transistor")

#text("Mn 2 1 0 0 nmos 1=2 w=4 as=20 ps=4 ad=20 pd=4")

#text("* DC analysis request by sweeping the drain and gate voltage.\nde Vdrain 0 ‘Supply’ ‘Supply/20’ vgate 0 ‘Supply’ ‘Supply/4’\n* Plotting requests")

#text(".plot dc I(Mn)")

#text("vend")

#text("图 A.13 RUT TARO TER. Att Cee A itn — 7 ee ROE\n到的\nTransient Response of an Inverter")

#text(".param Supply=1.8       * Set value of vdd")

#text("-lib ‘bsim3v3.cmos.18um’ * Set 0.18um library")

#text("-opt scale=0.1u       * Set lambda (here lambda=0.10)")

#text("Vad 1 0 ‘Supply’")

#text("Vin 2 0               ‘Supply’ in On on 2n 4n\nMp 3 2 1 1 pmos        0 ps=4 ad=40 pa=8")

#text("Mn 3 2 0 0 nmos          0 ps=4 ad=20 pd=4")

#text("Cload    3 0 10EF")

#text("* Transient analysis\n«tran 50ps 5ns")
