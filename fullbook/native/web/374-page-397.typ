// SOURCE PDF PAGE 397 printed 378, visually checked; native edit selection only, NOT 1:1.
#import "../figures/ch11-clock-timing-native.typ": fig1116,fig1117,fig1118,fig1119,fig1120,fig1121,fig1122,fig1123,fig1124,fig1125,fig1126,fig1127,fig1128
#set document(title:"第11章·时钟、偏斜、抖动、功耗·PDF397")
#set text(size:7.15pt)
#show par: set par(leading:2.2pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[378　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 11.2　电源分布设计（续）

降低 IR 压降有多种办法：增加供电金属宽度、增加平行供电路径、增添跨层连接、优化通孔与焊盘位置、在各电源负载附近布置去耦电容，并在布局过程中兼顾电迁移检查。前述方法均可能牺牲布局面积或信号布线资源。

原书还提出减少最大电流突变的方式：让一个相对较大的去耦电容在切换开始时向门提供电流，减小经过电源网格的瞬态电流，从而降低 IR 与 $L dif i/dif t$ 噪声。电容常分散于可用的芯片区域，设计时需兼顾效率、面积、静态漏电。

增加 $V_"DD"$ 和地的管脚数量可增加电源源点、减少单一路径电流；焊球阵列封装适于在芯片不同位置引出供电，但封装成本较高。

== 11.3　时钟和时序问题

== 11.3.1　时钟定义和量度

高速 VLSI 系统使用时钟把数据处理分成有固定节拍的操作。理想时钟网格应将时钟沿几乎同时送到各触发器，实际则会受到路径延迟、上升/下降时间和噪声影响。

*时钟偏斜（clock skew）*指两个触发器看到的同一个时钟沿在时间上的差异；*时钟等待时间（clock latency）*指时钟从源端传播到触发器的时间。
