// SOURCE PDF PAGE 409; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第409页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("390      数字集成电路分析与设计一一深亚微米工艺 ( 第三版 )")

#text("ASH TAS PLL 可以用于将芯片的内部时钟与外部时钟和数据进行同步, 以及生成比外部时钟\n输入的操作速率商的内部时钟信号”考虑图 11.35 Ca) 所示的时序网“PCB 的外部系统时钟是芯\n片外时钟 ”这个时钟馈入蔡片用做内部时钟、如疼 1135 fb ) 上部所天这个芯片上的时钟通过\n缓冲来驱动巡辑块的触发器和锁存器”然而经过时钟缓冲器和连线的延迟 { 也就是时钟等待时\nTa) 在内部时钟和外部时钟之间产生了差别，如图 11.35 Ca) 的 clk1 所显示的更样”这导致在必\n片输入/输出管脚产生宙外的建立时间和保持时间要求 ”理想情况下, 我们希望两个时钟边沿能排\n列对齐、 这样内部时钟就可以与外部时钟同步，就像狗 11.35 (a) 中 clk2 的波形陡样”为了做到\n这点，可以用…个镇延迟环或锁相环，如图 1.35 Cb) 中的 clk2 那样")

#text("fl                  pea) teFIC\neee")

#text("eo")

#text("eH")

#text("eu")

#text("疼 0135 用于时钟同步的尾片上 PLL")

#text("“的电路紧密相关“二者都使用反馈控制将输出时钟锁定到输入时钟上。PLL 必\n定参考时钟的频率和相位，而 DLL 只需要锁定到参考时钟的一个财定相位”所以，PLL 的\nSEALE 【由于 PLL 必须首先锁定频率然后是相位 ) 比 DLL ( 由于 DLL 只须锁定相位 ) 需要更\n多时间 “如果只是想同步. 可以用 DLL 然而. 如果需要内部时钟以数倍于外部时钟的频率运行、，\n则必须用 PLL")

#text("PLL 和 DLL 的反馈控制系统有非常类似的结构、这很快就要介绍“主要的不同是 PLL 中使\nJUNE RF (VCO, voltage-controlled oscillator )，而 DLL 中使用压挖延迟线 ( VCDL， voltage-\ncontrolled delay line ) 这两种类型的环路在稳定性和是否有能力进行频率综合上也有不同 “出于\n在其他应用中得到广泛使用，许多关于模拟设计的书籍详细介绍了这些类型的电路及其特性")

#text("作为数字设计者，由于 PLUDLL 的模拟性质，似乎对它们的讨论超出了本书的范围”这从\n本质上说是对的”然而，了解 PLL 和 DLL 电路的基本工作原理很重要，因为会越来越多地将其\n用于偏铬管理 .时钟综合以及数据和时钟恢复等方面 所以 我们用一个基本的 PLL 结构图作为\n基础.从数字设计者的角度说明使用 PLL 的操作和设计方面的考虑 鼓励读者查阅本章最后的参\n考文献以获得更多的信息")

#text("11.4.1 PLL 设计考虑")

#text("图 036 纵出了一个用于时钟同步和时钟综合的电荷和泵 PLL 的结构图， 由相位/频计检测器\n(PFD. phase/frequency detector )、 电荷泵 (CP, charge pump )、环路过滤器 (LPF、 loop filter )\nAUER ERR (VCO) 组成”相位检测器检测参考时钟和 VCO 输出之间的相位差并月给电荷泵\n秀加充电脉冲和放电脉冲 这些脉冲是用于开关电压或电流源的. 用来对|  出端进行充电或放电\n脉冲被环路过滤器过滤并昌用做 VCO 的控制电压”VCO 依照控制电压改变其振荡频率”如果")

#text("PRR PLL 和 DLL 的名字电畏示着这 “前是相关的 电就是说. TE Bj eo MT HO")
