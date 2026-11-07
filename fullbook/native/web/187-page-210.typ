// SOURCE PDF PAGE 210 · 印刷第191页。
// 第三轮正文逐段转写 + 图6.2/6.3原生可编辑轮廓，非1:1验收。
#import "../figures/ch6-propagation-faithful.typ": figure-6-2, figure-6-3
#set document(title:"第6章 · 图6.2/6.3转换时间与CMOS反相器电流模型 · 扫描210页")
#set text(lang:"zh")
#align(center)[#text(size:8.2pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　191]]
#line(length:100%,stroke:.55pt)
#v(8pt)

#figure-6-2()

#align(center)[#text(size:8.8pt,weight:"bold")[图6.2　上升和下降时间的定义]]

== 6.2　转变时间分析

有了这些适当的定义，现在讨论图6.3（a）中 CMOS 反相器的转变特性。当输入有一个从 $V_("OH")$ 到 $V_("OL")$ 的阶跃变化时，下拉晶体管关闭而上拉晶体管打开。这种情形如图6.3（b）所示。通过假设集总负载电容是由通过上拉器件的电流充电的，可以计算 $V_("out")$ 从 $V_("OL")$ 充电到50%点所需要的时间。

#figure-6-3()

#align(center)[#text(size:8.8pt,weight:"bold")[图6.3　CMOS反相器的延迟计算]]

类似地，当输入产生一个从 $V_("OL")$ 到 $V_("OH")$ 的阶跃变化时，下拉晶体管打开而上拉晶体管关闭，这种情形如图6.3（c）所示。通过假设集总负载电容是通过下拉器件的电流放电的，可以计算 $V_("out")$ 从 $V_("OH")$ 放电到50%点所需要的时间。在这两种情况下，都可以用下面的公式进行计算：

#align(center)[$I = C_L (dif V)/(dif t) arrow Delta t approx (C_L Delta V)/I_("DS")$]

其中，$C_L$ 是负载电容，$Delta V$ 是电压改变量，$I_("DS")$ 是充电或者放电电流。如果平均充电电流是 $I_("LH")$，而且 $Delta V=V_("DD")/2$，则低电平到高电平的传播延迟时间可用下式计算：

_校对说明：正文按源页重录；图6.2/6.3在源扫描中有两个时间曲线及三组MOS电路，当前为原生简化示意，物理节点和布图位置待严格复核。_