// SOURCE PDF PAGE 210 / printed 191; figures 6.2 and 6.3.
#import "../figures/ch6-delay-capacitance-native.typ": equivalent
#set document(title:"第6章 · 转换时间分析 · PDF210")
#set text(lang:"zh")
= 第6章 · 印刷第191页

== 图6.2　上升和下降时间的定义

上升时间从输出电压幅度的10%到90%计，下降时间反向从90%到10%计。这是同一条输出波形的两个时刻之差，不能混为输入输出之间的传播延迟。

== 6.2　转换时间分析

分析CMOS反相器由低电平转为高电平或高电平转为低电平的过程。输出节点可以抽象为受MOS器件电流充放电的负载电容。

#equivalent()

*图6.3*　CMOS反相器的延迟计算：放电由NMOS驱动，充电由PMOS驱动；可分别用器件在该转换中的平均电流近似。

由电容关系得：

$I = C_L (dif V)/(dif t)$

当输出跨越 $V_("DD")/2$，若使用平均电流 $I_("avg")$，延迟可写成 $t approx C_L V_("DD")/(2 I_("avg"))$。

_本页图6.2的完整10%/90%曲线与图6.3的三幅电路图尚缺原图逐元素几何验收。_