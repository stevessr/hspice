// SOURCE PDF PAGE 411 / printed 392; scan-guided editable Chapter 11.
// Original illustrations are editable abstractions; full-page 1:1 review remains open.
#import "../figures/ch11-pll-summary-native.typ": fig1135,fig1136,fig1137,fig1138,fig1139,fig1140,fig1141,fig1142,fig1143,fig1144
#set document(title:"第11章 · PLL/DLL 时钟同步 · PDF411")
#set text(lang:"zh",size:7.25pt)
#show par: set par(leading:2pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[392　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.5pt)

一旦生成了 up/down 信号，就会施加在电荷泵上，如图 11.38 所示。图中还给出了输出滤波器。暂时假设滤波器是一个电容。up 信号将打开上面的电流源 $I_p$，并抬高在 $V_c$ 的输出电压。类似地，down 信号将使输出电容放电并且降低控制电压 $V_c$。存在两个开关同时导通的情形。然而只要 $I_p = I_n$，up 和 down 信号的交叠脉冲就不会产生问题，因为两个开关都导通，电流无害地从 VDD 流到 Gnd。

#fig1138()
#align(center)[#text(size:7.2pt)[图 11.38　电荷泵和环路滤波器 F(s)]]

滤波器 $F(s)$ 决定整个 PLL 系统的工作状态和稳定性。作用是滤掉 up/down 信号中的高频变化成分并将一个缓慢变化的控制电压提供给 VCO。所以必须在整个反馈控制系统的环境里而不是孤立地进行设计。即使 PLL 是一个高度非线性系统，处于锁定或接近锁定状态时也能当做线性系统来分析。其控制系统表示如图 11.39 所示，我们现在使用线性原理对其进行分析。这种情况下相位是环路变量，相位差由 PFD 中的 $K_"PD"$ 决定和放大：

#align(center)[$v_d = K_"PD" (theta_"in" - theta_"out")$]

会通过低通滤波器传送，其传输函数为 $F(s)$。然后该信号传输经过 VCO 并产生输出相位。频率和相位的关系是：相位是频率的积分，并且频率由控制电压决定：

#align(center)[$theta = integral omega dif t = integral K_0 v_c dif t$]

所以 VCO 可以看做一个积分器，将控制电压转变为相位。其传输函数由 $K_0 / s$ 给出。这个变换的意义是，在 $s=0$ 时 VCO 引入系统传输函数的一个极点。传输函数 $F(s)$ 中任何其他的极点都可能导致整个系统不稳定，这取决于极点的准确位置。这就是为什么环路滤波器对整个 PLL 的稳定性如此重要。

#fig1139()
#align(center)[#text(size:7.2pt)[图 11.39　PLL 的线性反馈控制系统]]

_源书脚注：电源、工艺和温度改变会使两电流源的匹配变得困难，可能造成输出直流偏置；实际设计需要额外的消除措施。_