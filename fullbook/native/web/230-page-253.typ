// SOURCE PDF PAGE 253 · PRINTED 234. Final chapter 6 problems.
#import "../figures/ch6-final-exercises-native.typ": figure-p612, figure-p613
#set document(title:"第6章 习题P6.12—P6.16 · PDF253")
#align(center)[#text(size:8pt,weight:"bold")[234　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#align(center)[*图P6.12　包含反相器、与非门和四个并联或非门的复杂路径*]
#figure-p612()

#v(12pt)

#align(center)[*图P6.13　在路径中增加扇出和旁路电容的电路*]
#figure-p613()

*P6.14*　从例6.2中可以看出，低电平转换到高电平时的 $C_g$ 平均值要比高电平转换到低电平时的大。解释为什么这种情况总是正确的。

*P6.15*　对反相器施加一个斜波输入时，$C_g$ 的平均值比施加阶跃输入时大。解释为什么这种情况总是正确的。

*P6.16*　导出一个可以计算FO4延迟的简单公式。应该采用如下的形式：

#align(center)[$"FO4延迟" = "常数" times L$]

其中，这个常数的单位为 ps/μm，$L$ 是最小沟道长度。基于0.18 μm工艺和0.13 μm工艺计算这个常数。设 $L=90 " nm"$、$45 " nm"$ 和 $22 " nm"$，分别用这个公式估计FO4的延迟。

_图P6.12与图P6.13为仅有门级顺序和已知负载的编辑草图，原书四支路具体接线和扇出尚未逐线验收。_