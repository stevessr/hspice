// SOURCE PDF PAGE 209 / printed 190; teaching excerpts and figure 6.1.
#import "../figures/ch6-delay-capacitance-native.typ": propagation
#set document(title:"第6章 · 传播延迟定义 · PDF209")
#set text(lang:"zh")
= 第6章 · 印刷第190页

== 图6.1　传播延迟的各种定义

#propagation()

图6.1包括门链的传播以及不同电平参考点：10%—90%用于定义上升转换时间，90%—10%用于定义下降转换时间。两个波形的50%交点则常用来测输入至输出的传播延迟。

当信号处于逻辑低、高稳定电平时，实际电压的短暂偏移未必直接改变逻辑值；选择50%参考点的目的，是在不同门级之间建立一致的计时标准。

若采用一阶RC模型，可用指数充放电曲线近似输出电压随时间的变化，等效时间常数为 $R C_L$。不同输入波形及输出负载的定时参数必须分别测量。

_图6.1(a)—(d)有多个波形交点；当前绘图是原生简化示意，未逐曲线还原教材原图。_