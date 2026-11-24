// SOURCE PDF PAGE 409 / printed 390; scan-guided editable Chapter 11.
// Original illustrations are editable abstractions; full-page 1:1 review remains open.
#import "../figures/ch11-pll-summary-native.typ": fig1135,fig1136,fig1137,fig1138,fig1139,fig1140,fig1141,fig1142,fig1143,fig1144
#set document(title:"第11章 · PLL/DLL 时钟同步 · PDF409")
#set text(lang:"zh",size:7.25pt)
#show par: set par(leading:2pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[390　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.5pt)

芯片上的 PLL 可以用于将芯片的内部时钟与外部时钟和数据进行同步，以及生成比外部时钟输入的操作速率高的内部时钟信号。考虑图 11.35（a）所示的时序图，PCB 的外部系统时钟是芯片外时钟。这个时钟馈入芯片用做内部时钟，如图 11.35（b）上部所示，这个芯片上的时钟通过缓冲来驱动逻辑块的触发器和锁存器。然而，经过时钟缓冲器和连线的延迟（也就是时钟等待时间）在内部时钟和外部时钟之间产生了差别，如图 11.35（a）的 clk1 所显示的那样。

这导致在芯片输入/输出管脚产生额外的建立时间和保持时间要求。理想情况下，我们希望两个时钟边沿能排列对齐，这样内部时钟就可以与外部时钟同步，就像图 11.35（a）中 clk2 的波形那样。为了做到这一点，可以用一个锁延迟环或锁相环，如图 11.35（b）中的 clk2 那样。

#fig1135()
#align(center)[#text(size:7.2pt)[图 11.35　用于时钟同步的芯片上 PLL]]

PLL 和 DLL 的电路紧密相关，二者都使用反馈控制将输出时钟锁定到输入时钟上。PLL 必须锁定参考时钟的频率和相位，而 DLL 只需要锁定到参考时钟的一个固定相位。所以，PLL 的锁定过程（先锁定频率再锁定相位）比 DLL（只须锁定相位）需要更多时间。如果只是想同步，可以用 DLL；然而如果需要内部时钟以数倍于外部时钟的频率运行，则必须用 PLL。

PLL 和 DLL 的反馈控制系统有非常类似的结构，主要不同是 PLL 中使用压控振荡器（VCO, voltage-controlled oscillator），而 DLL 中使用压控延迟线（VCDL, voltage-controlled delay line）。这两类环路在稳定性和是否具有频率综合能力上也有不同。由于在其他应用中得到广泛使用，许多模拟设计书籍详细介绍了这些电路及特性。

作为数字设计者，由于 PLL/DLL 的模拟性质，似乎对它们的讨论超出了本书的范围。然而了解 PLL 和 DLL 电路的基本工作原理很重要，因为会越来越多地将其用于偏斜管理、时钟综合以及数据和时钟恢复等方面。所以我们用一个基本的 PLL 结构图作为基础，从数字设计者的角度说明使用 PLL 的操作和设计方面的考虑。

== 11.4.1　PLL 设计考虑

图 11.36 给出了一个用于时钟同步和时钟综合的电荷泵 PLL 的结构图，由相位/频率检测器（PFD, phase/frequency detector）、电荷泵（CP, charge pump）、环路滤波器（LPF, loop filter）和压控振荡器（VCO）组成。相位检测器检测参考时钟和 VCO 输出之间的相位差，并给电荷泵施加充电脉冲和放电脉冲。这些脉冲用于开关电压或电流源，对输出端进行充电或放电。