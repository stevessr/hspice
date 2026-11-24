// SOURCE PDF PAGE 408 / printed 389. Scan-guided EM and PLL/DLL introduction.
// Industrial failure layout in Fig 11.34 is a vector concept sketch, not 1:1.
#import "../figures/ch11-em-pll-native.typ": fig1133,fig1134
#set document(title:"第11章 · 电迁移与锁相环/锁延迟环 · PDF408")
#set text(lang:"zh",size:7.35pt)
#show par: set par(leading:2pt,spacing:3pt)
#align(center)[#text(size:7.6pt,weight:"bold")[第11章　电源网格和时钟设计　　　　　　　　　　　　389]]
#line(length:100%,stroke:.55pt)

#fig1133()
#align(center)[#text(size:7.1pt)[图 11.33　在信号线中由于交流和直流电流产生的电迁移现象]]

图 11.33 中短的单向金属段使用平均电流密度判据，而较长的信号金属段使用 RMS 电流密度判据。原书图中分别标有 $J_("avg") < 10$ mA/μm² 和 $J_("rms") < 20$ mA/μm²。

#fig1134()
#align(center)[#text(size:7.1pt)[图 11.34　时钟树中信号的 EM 失效（原生结构示意）]]

== 11.4　锁相环／锁延迟环

本节中我们讨论用芯片内部时钟对外部提供的原始时钟进行同步的问题。在一块印刷电路板（PCB, printed circuit board）上有多个芯片的数字 VLSI 系统或系统芯片（SOC, system-on-chip）的应用中，由于主参考时钟（Ref Clk）和局部产生的从时钟之间的等待时间可能引起几个问题。

芯片上时钟等待时间的值在各个芯片之间或各个模块之间都可能不同。由于数据传输是用从时钟进行同步的，所以可能发生时序冒险和／或产生数据错误（数据可能在一个错误的时间采样）。这些问题可以用锁相环（PLL, phase-locked loop）和锁延迟环（DLL, delay-locked loop）电路矫正。

_原书 11.4 节标题前标有星号；插图位置、几何和全部线路需要继续按扫描严格校准。_
