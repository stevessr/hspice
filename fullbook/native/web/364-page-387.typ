// SOURCE PDF PAGE 387. Native Typst source-scan editorial selection, not 1:1 complete.
// Printed page 368; line-by-line transcription and source geometry remain unverified.
#import "../figures/ch10-summary-ch11-power-native.typ": fig1028,figp104,figp105,figp106,figp108,fig111,fig112
#set document(title:"第10章章末与第11章电源分布·源PDF387")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[368　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

当芯片功耗达到100 W，供电电压可能降至1.2 V甚至更低时，供电电流可达100 A量级。为了让噪声维持在可接受范围内，供电路径的目标阻抗必须很小。

原书给出供电噪声容限决定电源网格目标阻抗的计算：

#align(center)[$Z = (V_"DD" times "允许的噪声百分比")/I_"DD" quad (11.1)$]

当 $V_"DD"=1.2 "V"$、$I_"DD"=100 "A"$，允许噪声为10%时：

#align(center)[$Z = (1.2 "V" times 0.10)/(100 "A") = 1.2 "mΩ"$]

这一数量级要求电源网格的电阻、电感和封装路径都受到严格约束。

== 11.2.1　IR 压降和 $L dif i/dif t$

电源网络中同时存在导线电阻与寄生电感。导线电阻在电流通过时造成静态或缓慢变化的 IR 压降，而快速切换的电流还会引入瞬态的电感电压：

#align(center)[$V = I R + L (dif i)/(dif t) quad (11.2)$]

原书强调，IR 压降会降低驱动器看到的有效供电电压，使逻辑门变慢，并产生与邻近门同时切换相关的动态供电扰动。对于同步设计，这会进一步影响关键路径延迟、时钟偏斜和可预测性。

同时切换时，地电位也可能相对系统参考地抬升，形成*地线反跳（ground bounce）*。
