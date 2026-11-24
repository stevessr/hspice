// SOURCE PDF PAGE 356. Editable source-guided editorial selection, strict page 1:1 not accepted.
#import "../figures/ch9-nonvolatile-ch10-interconnect-native.typ": figure9late,figure10,fig-summary
#set document(title:"数字集成电路第10章·PDF356")
#align(center)[#text(size:8pt,weight:"bold")[337　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

10.1　绪论（续）

随着导线尺寸降低，单纯依据晶体管负载电容估计延迟常常不准确。电阻主导的长连线需要采用分布RC网络，而高速时钟和长总线还需考虑耦合、电感与串扰。金属互连可靠性还受电迁移和工艺缺陷影响。

== 10.2　连线的RC延迟

=== 10.2.1　导线电阻

导线的体电阻由电阻率 $rho$、导线长度 $L$ 和横截面积 $A$ 决定。厚度为 $T$、宽度为 $W$ 时：

#align(center)[$R = (rho L)/A = (rho L)/(T W) quad (10.1)$]

其中 $rho$ 的单位为欧姆·厘米，几何尺寸必须使用一致单位。工程上常使用方块电阻（sheet resistance）表示金属薄膜：

#align(center)[$R_("sq") = rho / T quad (10.2)$]

于是具有长度 $L$、宽度 $W$ 的均匀矩形导线，其电阻也可以写为：

#align(center)[$R = R_("sq") (L/W)$]

电阻随长度增加而增大，随宽度和厚度增加而减小。选择更宽的高层金属有助于降低较长信号路径的串联电阻，但也会改变面积与寄生电容。

#figure10(3)
#align(center)[*图10.3　(a)集总电容互连与(b)分布RC连线模型（可编辑原生图元）*]

对于短连接，可以用总电容负载近似计算门延迟；对于电阻不可忽略的长连接，应将导线分成多个串联电阻段及并联电容段。
