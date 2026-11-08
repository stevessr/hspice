// SOURCE PDF PAGE 410 / printed 391; scan-guided editable Chapter 11.
// Original illustrations are editable abstractions; full-page 1:1 review remains open.
#import "../figures/ch11-pll-summary-native.typ": fig1135,fig1136,fig1137,fig1138,fig1139,fig1140,fig1141,fig1142,fig1143,fig1144
#set document(title:"第11章 · PLL/DLL 时钟同步 · PDF410")
#set text(lang:"zh",size:7.25pt)
#show par: set par(leading:2pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[第11章　电源网格和时钟设计　　　　　　　　　391]]
#line(length:100%,stroke:.5pt)

VCO 振荡频率是输入频率的倍数，必须在 PFD 中完成比较之前进行分频。

#fig1136()
#align(center)[#text(size:7.2pt)[图 11.36　一个基本的 PLL 结构图]]

相位/频率检测器（PFD）是一个检测参考时钟边沿和反馈时钟（FB, feedback clock）边沿之间差别的电路。图 11.37（a）给出了一个简单的版本，由两个 D 触发器和一个与门组成，D 输入端固定为 1。这个电路的作用是按照输入时钟的边沿用增减频率的方式来控制 VCO。

PFD 的真值表如图 11.37（b）所示。如果 up 和 down 信号都是 0，则已经获得了期望的频率和相位并且 PLL 处于锁定状态。但是，如果参考时钟在反馈时钟之前变化，那么 up 信号指示应增加 VCO 的频率。类似地，如果反馈时钟在参考时钟之前变化，则产生一个 down 信号来减缓 VCO。如果 up 和 down 信号都为高，将其视为复位条件，因此与门把触发器置位为 0。

为了进一步理解，考虑图 11.37（c）的时序图。开始时参考时钟在反馈时钟之前变为高，这是两个信号之间的相位错误。参考时钟的初始上升沿将其触发器的输出置为 1，而反馈时钟的上升沿也将其触发器的输出置为 1，这两个高电平输出组合形成了一个复位信号。up 信号的脉冲宽度与两个信号的相位延迟成比例，down 信号产生一个可被下一级滤掉的短脉冲。由于 VCO 收到加速信号，下一次两个时钟沿有更小的相位差，up 脉冲变短。过程持续直到相位差改变符号，down 信号使能，最后系统达到稳定，两个时钟之间有可以忽略的差异。

#fig1137()
#align(center)[#text(size:7.2pt)[图 11.37　相位—频率检测器：电路与状态真值表]]

_图 11.37（c）原书还有四行时序波形，波形边沿及相位比例尚未逐点拟合；原生电路当前为可编辑拓扑示意。_