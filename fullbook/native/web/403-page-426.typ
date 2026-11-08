// SOURCE PDF PAGE 426; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第426页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("附录 A_ SPICE 的简要介绍               407")

#text("有时，观察梯形波激励的元件行为是很有用的，在这种情况下可以用 PULSE 选项来说明\n波形参数 ”电帮或电流脉冲的句法是:")

#text("vxxx one nm PULSE <vl v2 td tr tf pw per>\nbo one     PULSE <vl v2 td tr tf pw per>\nvee          电讨源的用宇\nxx          电流源的名字\nhe           正节点\n            负节点\nPULSE:       PHP ICHEF-AHI voltageval” AREAL. Aen RINNE — NORE\nvw                            2 oe Ft\n以伏特或安培为单位的电压或电流的最终值\ntd         以种为单位的延迟时间，这是从 vt 到 v2 之间第一次变化的开始时间\nu             er FEAT. Roby, JIA v1 变到 v2 花费的时间\n四             屿囊的下降时间、换句话说，是从 v2 变到vi 花费的时间\npw            波形的脉冲宽度，定义为波形保持在 v2 的时间\nper          SHEA")

#text("下面的例子描述了一个名为“Vpulse”的电压源，连接在节点 3 和节点 0之间，电平在-1V\n和 1 V 之间变化 在 2 ns 延迟之后开始上升, 上升时间是 4 ns, 下降时间是 3 ns, 脉冲宽度是 20 ns，\n周期是 50 ns，其波形如图 A.6 所示")

#text("Vpulse 3 0 PULSE -1 1 2ns 4ns 3ns 20ns 50ns")

#text("ak\nIs\n1\n5 os\nz 0|\n2\nos\n+\n15 1     rn\na a a a )\n时间 ns)\n图A6 脉冲波形")

#text("另一种有用的源是分段线性源 ( PWL，piecewise linear source ) 其波形用 ( 时间, 值 ) 对说\n明，对于与图 A.5 同样的图，PWL 将说明如下:")

#text("Vpulse 3 0 PWL 0 -1 2ns -1 6ns 1 26ns 129ns -1\n+ 52ns -1 56ns 1")
