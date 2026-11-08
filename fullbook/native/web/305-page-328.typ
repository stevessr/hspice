// SOURCE PDF PAGE 328; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第328页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("第9章 ”存储器设计中的其他课题                   309")

#text("归一化的延迟为:\nD = 4(35) + 4(05) = 16\n160.18 pm 工艺下rm的值可以这样计算:\nTime = 3C Regan = 3(2 f/m) (12.5 kD)(02 um) = 15 ps")

#text("实际的延迟为:")

#text("Tug = Faw X = (15ps)(16) = 240 ps")

#text("匹配线在最坏情况下被下拉到低电平的延迟可以通过对 CAM 单元和匹配线分别使用RC 延\n迟模型来计算 输出电容为 200 人F-CAM 单元在下拉管堆栈中有一个常通的晶体管,连接到SRAM\n单元内部的节点，因此，堆栈上层晶体管的尺寸决定了输出电容可以看到的电阻CAM 单元的\n导通电阻近似为:")

#text("Rey = 125kD/8 = 1.6 kN\nBit.\nTmatchine = RC = (1.6 kfD)(200 fF) = 320 ps\n总延迟为;\nTrott = Tag + Tmaxchine = 240 ps + 320 ps = 560 ps")

#text("*9.3 ”现场可编程门阵列")

#text("芯片中一个重要的类别叫做现场可编程门阵列 PGA). FPGA 是一个独立的可编程的远辑\n器件，可以迅速实现一个复杂的逻辑系统。FPGA 可以大致分成两组:SRAM 编程的和反熔丝编\n程的。这一节中我们的重点放在 SRAM 编程的 FPGA. 这种阵列使用 SRAM 的位来配置芯片从\n而执行需要的功能。FPGA 客户根据目标应用的尺寸、速度和功耗要求购买独立的芯片。通过把\nFPGA 中可编程的 SRAM 位设置为需要的值，来实现芯片的定制-")

#text("传统上，FPGA 广泛用于在 ASIC 芯片设计好之前作为其原型。目前，FPGA 的密度和速度都\n有了提高，所以这些器件也常用在成型的产品中。还有许多应用的例子，比如自动测试设备的接\n口芯片”该芯片是半导体市场中一个快速增长的部分和 ASIC 以及 SOC 设计类型相竞争，最近，\n提出了片上或嵌人式可编程结构的使用，在这个领域中还有许多正在进行的研究工作")

#text("一个独立的 FPGA 的基本结构如图 9.6 所示。这种结构是很规则的，通过可编程膛辑块")

#text("(PLB. programmable logic blook )在水平和垂直方向上的复制组成, 沿着外围放置着 VO 压焊点\nSBMA VO 都是可编程的- 在 FPGA 上面对逮辑的安排和走线的任务是一个高度自动化的过程。\n整个过程从系统的 RTL 描述开始，这通常用 Verilog 或 VHDL 表示，通过综合和优化步骤来产生\n相应的逻生级表示， 然后通过 FPGA CAD 工具把这些逻辑在目标 FPGA 芯片上进行布局和布线\n这个过程最终产生一组必须写人 FPGA 中 SRAM 的编程码，从而实现最终的系统")

#text("运辑块和布线结构如图 97 所示。该图说明逻辑输出是怎样连接到相邻的布线通道的。这些\n块的输出在连接区与水平或垂直轨迹相交。连接区通过可编程的连接提供垂直和水平的轨迹， 信\n号沿着这些轨迹在一个方向上传递到交换区 ( switch block )，或交换矩阵(switch matrix ), 在这\n可以转向其他三个方向走线这一层次 上的设计决策包括连接区和交换区中垂直和水平轨")
