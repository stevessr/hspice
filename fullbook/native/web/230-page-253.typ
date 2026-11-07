// SOURCE PDF PAGE 253 · PRINTED 234. Original exercise diagrams are native,
 // source figure connections still require independent full topology approval.
#import "../figures/ch7-pass-transistor-native.typ": fig-p612, fig-p613
#set document(title:"第6章 习题 P6.12—P6.16 · 原书第253页")
#align(center)[#text(size:8pt,weight:"bold")[234　　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)
#v(12pt)
#fig-p612()
#align(center)[*图 P6.12*]
#v(12pt)
#fig-p613()
#align(center)[*图 P6.13*]
#v(8pt)

*P6.14*　从例 6.2 中可以看出，低电平转换到高电平时的 $C_g$ 平均值要比高电平转换到低电平时的大。解释为什么这种情况总是正确的。

*P6.15*　对反相器施加一个斜波输入时，$C_g$ 的平均值比施加阶跃输入时大。解释为什么这种情况总是正确的。

*P6.16*　导出一个可以计算 FO4 延迟的简单公式，应该采用如下的形式：

#align(center)[$"FO4 延迟" = "常数" times L$]

其中，这个常数的单位为 ps/μm，$L$ 是最小沟道长度。基于 0.18 μm 工艺和 0.13 μm 工艺计算这个常数。设 $L=90 " nm"$、$45 " nm"$ 和 $22 " nm"$，分别用这个公式估计 FO4 的延迟。

_校对状态：图 P6.12、P6.13 均有原生可编辑结构；四路扇出与门级负载已建模，但元件确切形状及各支路连接仍未逐线签收。_