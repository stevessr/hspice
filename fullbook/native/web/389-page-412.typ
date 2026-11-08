// SOURCE PDF PAGE 412 / printed 393; scan-guided editable Chapter 11.
// Original illustrations are editable abstractions; full-page 1:1 review remains open.
#import "../figures/ch11-pll-summary-native.typ": fig1135,fig1136,fig1137,fig1138,fig1139,fig1140,fig1141,fig1142,fig1143,fig1144
#set document(title:"第11章 · PLL/DLL 时钟同步 · PDF412")
#set text(lang:"zh",size:7.25pt)
#show par: set par(leading:2pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[第11章　电源网格和时钟设计　　　　　　　　　393]]
#line(length:100%,stroke:.5pt)

我们现在可以确定两个重要的系统传输函数：开环增益和闭环增益。开环增益可以通过检查从输入到输出的直接路径来获得：

#align(center)[$theta_"out"/theta_"in"(s) = K_"PD" F(s) K_0/s = G(s)$]

闭环增益通过环绕环路一次获得，并且能根据开环增益给出：

#align(center)[$K_"PD" (theta_"in"(s) - theta_"out"(s)) F(s) K_0/s = theta_"out"(s)$]

因此：

#align(center)[$theta_"out"/theta_"in"(s) = (K_"PD" F(s) K_0/s)/(1+K_"PD" F(s) K_0/s) = G(s)/(1+G(s)) quad (11.9)$]

对于这种系统的稳定性的经典研究方式是用分析该开环系统的频率响应来进行的。这可以通过分析上面的式（11.9）来理解。如果分母中的 $G(s)$ 等于 -1，闭环增益趋向无穷大。条件 $G(s)=-1$ 发生在 $G(s)$ 的数值是 1 且相位是 -180° 时，从实际角度看，这种条件下可以认为系统不稳定。通过检查式（11.9），可以知道决定系统稳定性的项是环路滤波器 $F(s)$。

在图 11.40 里，给出了环路滤波器的三种选择。我们曾经假设环路滤波器可以用一个接地电容实现，这是一个一阶滤波器（有一个极点），产生了一个二阶 PLL（因为 PLL 由于积分器的原因已经有一个极点）。然而，将简单电容用做环路滤波器会导致 PLL 不稳定，因为在 $s=0$ 时引入了两个极点，这将立即使相位设为 -180°。

#fig1140()
#align(center)[#text(size:7.2pt)[图 11.40　PLL 低通滤波器的几种选择]]

如果把一个电阻与电容串联，如图 11.40 中第二幅图所示，将在传输函数中插入一个零点，这使得整个 PLL 的频率响应稳定。这也是一个二阶 PLL，因为滤波器是一阶的。对这个滤波器进行时域仿真时将发现，当控制电压变化，电荷泵会在其值上引入细小的不连续阶跃。