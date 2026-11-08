// SOURCE PDF PAGE 411; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第411页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("392         数字集成电路分析与设计一一深亚微米工艺 ( 第三版 )")

#text("一旦生成了 up/down 信号，就会施加在电荷泵上，如图 11.38 所示，图中还给出了输出滤波\n器，暂时假设滤波器是一个电容。up 信号将打开上面的电流源刀并且抬高在Vc的输出电压\n类似地，down 信和号将使输出电容放电并且降低控制电压 Vc- 存在两个开关同时导通的情形，然\n而. BE Ip = In, up 和 down 信号的交生脉冲就不会产生问题，因为两个开关都导通，电流无害\n地从Vpp流到 Gnd!")

#text("图 11.38 电荷泵和环路滤波器 Fls)")

#text("滤波器 Fs) RENE PLL 系统的工作状态和稳定性- 作用是滤掉 up/down 信号中的高频变化\n成分并将一个缓慢变化的控制电压提供给 VCO。 所以, 必须在整个反馈控制系统的环境里而不是\n孤立地进行设计。 即使 PLL 是一个高度非线性系统,处于锁定或接近锁定状态时也能当做线性系\n统来分析。其控制系统表示如图 11.39 所示，我们现在使用线性原理对其进行分析。这种情况下\n相位是环路变量，相位差由 PFD 中的Kpp决定和放大:")

#text("Ya = Keo(gn ~ Sox)\n会通过低通滤波器传送，其传输函数为 MS). 然后，该信号传输经过 VCO 并产生输出相位。频\n率和相位的关系是: 相位是频率的积分，并且频率由控制电压决定:")

#text("0 =f 如=JKowdr")

#text("所以，VCO 可以看做一个积分器, 将控制电压转变为相位。其传输函数由 Ko/:给出，这个变换的\n意义是，在*= 08 VCO 引入系统传输函数的一个极点。传输函数 PLS) 中任何其他的极点都可能\n导致整个系统不稳定, 这取决于极点的准确位置- 这就是为什么在整个 PLL 系统的稳定性中环路\n滤波器起到如此重要作用的原因")

#text("Koo")

#text("Oe +                                       a\nFo)         Kye")

#text("图 11.39 PLL 的线性反馈控制系统")

#text("1 实际上，在电源和上艺变化以及温度改变时使这两个电流匹配是很困难的这时致了输出端的直流偏置，必须\n以某种方式消除 ( 典型的情况是使用单位增益放大器和一些额外的开关 )")
