// SOURCE PDF PAGE 332; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第332页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("ROE ”存储器设计中的其他课题            313")

#text("Of Sab 2S i a A PB Zhe HE. SRAM 位存储“1” 的那\n些帆体管是使能的，而那些存储“0”的不被使能 (ATURE RRP BEAT) 连接区晶体管\n的作用是控制源 PLB 到布线轨迹的信号，交换区晶体管把信号从垂直轨迹上传递到水平轨迹上\n或者相反“它们也可以将一个输入的水平轨迹连接到一个输出的水平轨迹上，或者将一个输入的\n垂直轨迹连接到一个输出的垂直轨迹上 - 最终, 多路器选择出需要的信号并将其送到目标 PLB 的\n输入")

#text("FPGA 芯片的 VO 也是可配置的，如图 9.11 所示。 一般来说，输出是双向的，但是可以通过\n多路器中一个可编程的位 { 图中未显示 ) 将其编程为只输入或者只输出的形式.如果在发送数据，\n大的输出缓冲器被激活，目其 Out 的值传送给引脚”可以通过关闭这个缓冲器把输出设置成高阻\n态，OP 使能信号使输出缓冲器的状态可以被片上丈辑控制如果芯片正在从引脚上接收数据，\n则这个数据可以寄存在 D 触发器中或直接送进芯片,这取决于多路器的编程方式目前，可以对\nFPGA VO 块进行配置来支持许多不同的 VO 标准")

#text("-了or")

#text("N")

#text("Lp pa")

#text("vocLK")

#text("图9.11 FPGA 9 YO 缓冲")

#text("在将来，对于系统实现来说 FPGA ATER — EFA. PRT.     的器件有\n-些局限- 首先，其性能一般比定制的 IC 和 ASIC 设计低，功耗也大得多.在正常的操作和编程\n中这是事实”因为编程位是 SRAM 单元，所以要考虑到当内部电容值由于缩小尺寸而减小时由\n粒子的效应引起的单粒子翻转 (SEU. single-event upset )。然而， 这些问题将随着时间的推移得\n到解决")

#text("另一种局限是与 FPGA 上可以实现的系统尺寸相关的- 一般一个 RTL 级描述自 动转换为一个\n门级描述，然后由 CAD 软件在目标 FPGA 上进行布局和布线  根据要实现的系统类型，LUT 可\n能不会被完全利用，或者需要的逻辑不能置于一个 LUT 内而必须放在几个 LUT 中。 于是，由于\n可用轨迹数日的限制带来了信和号布线和拥塞问题.虽然这些 FPGA 器件报告的门数为 5 M或更多，\n但有效的利用率可能只有 10%-~20% 此外，高容量的 FPGA 单个芯片也会更贵，所以不适合大\n批量使用。然而，预期 FPGA 的市场份额在将来的儿年中仍将继续增长.")

#text("在不远的将来与 FPGA 相关的可编程结构将出现在 ASICISOC 的设计中,这样可以在制造\n后提供可编程能力，这些情况包括，工业标准正在发展中， 或者将根据终端用户的需要对设计进")
