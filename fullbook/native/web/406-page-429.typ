// SOURCE PDF PAGE 429; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第429页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("410        数字集成电路分析与设计一 深亚微米工艺 ( 第三版 )")

#text("tran   BARAT RULE HS IE\nMIL AeARDLAY SPICE 计算增生”如果这个仁是 | 秒，那么 SPICE 将从1= 0 开始每秒一\n次计算电路的变相值 ( 电压，电注\n如果增单们特别大或特别小、可以使用前织 { 例如、1 训秒基 1ms、200 纳秒直 200 ns )\ntstop 这个佳表示朋态分析停止的时间 “如果 step = 并且 stop = 10, 那么 SPICE 将从1= 0 9F8\n到4= 10 每秒一次计算电路的变硬值 ! 电化、电流 )\n如果增量单位特别大或特别小，可以使用前名 ( 例如，1 毫秒是 L ms. 200 纳秒是 200 ns")

#text("对于上面 RC 电路的例子，命令的句法如下:")

#text(".Eran Im 10m")

#text("直流")

#text("直流分析用于观察当另一个变量变化或从一个值扫描到另一个值时某一个变量的值，生成一\n个反相器的电压传输特性曲线, 或绘制 MOS 晶体管的 /LVY特性曲线时这是非常有用的“在这种类\n型的分析里，使用者说明要绘制的输出变量和扫描变量的开始值和结束值,以及一个给定的步长\n大小，SPICE 内部在开始值和结束值之间的每个中间点完成直流分析并且显示结果")

#text("例如，在疼 A.10 的电压除法器电路中，当电压源 Wowe从 0 V 扫到 10 V 时，可以观察到 RL")

#text("tstep")

#text("和 R2 Ziad LEV,\nke                             IONE\nin         \\,\n5\n‘4\nzs\n2\n1\na a\nmer")

#text("PE A1O %% Venue OV 扫到10V时V:的曲线")

#text("在SPICE 里, 可以在对两个其他值进行扫描时观察一个值. 这将在同一幅图中产生多条曲线。\n在图 A.11 中, 是当漏极电压 Vani从 0 扫到 1.8 V 并且栅电压Vare从0 扫到 1.8 V 时观察漏极电流\n的情况， 直流分析声明的句法是:")

#text(".dc varl start stop step <var2 start2 stop2 step2>")

#text("BE, <> HLA FE LA AN BE BAB Ye,")

#text("Lac         所有直流声明必须以此开头")

#text("vari         要扫撒的变量名 ( 例如，Vsource )")

#text("start      扫撒的起始值 (例如，0 )")

#text("stop         TROP LICL COHN 10)")

#text("step       es CO CT\nvara (可选) 要扣撒的第二个变量名称 { 例如，R2 )")

#text("start2 (可选) ”第二个扫描的起始值 (例如，1 )\nsrop2 (可选) 。 第二个扫描的终止值( 例如，3 )\nStep2 (uli) 。 用于扫描第二个变贡的增量大小{ 例如，1 ) ，值起小，分析起精确但越大费时间")
