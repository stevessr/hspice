// SOURCE PDF PAGE 381. Native Typst source-scan editorial selection, not 1:1 complete.
// Printed page 362; line-by-line transcription and source geometry remain unverified.
#import "../figures/ch10-summary-ch11-power-native.typ": fig1028,figp104,figp105,figp106,figp108,fig111,fig112
#set document(title:"第10章章末与第11章电源分布·源PDF381")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[362　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#fig1028()
#align(center)[*图10.28　金属线跨层连通以避免天线效应（可编辑示意）*]

在制造过程中，若把较长的连接推迟到更晚的金属层步骤，可以减少早期敏感栅所暴露的金属收集面积。这种处理和保护二极管一样，需要版图与工艺规则共同保证。

== 10.7　小结

原书对0.18 μm及0.13 μm工艺的互连参数给出如下典型示例：

#table(columns:4,inset:3pt,stroke:.35pt,
 [*工艺*],[*金属层*],[*ρ（μΩ·cm）*],[*方块电阻*],
 [0.18 μm],[铝1—4],[2.7],[54 mΩ/□],
 [0.18 μm],[铝5],[2.7],[27 mΩ/□],
 [0.13 μm],[铜1—6],[1.7],[42 mΩ/□],
 [0.13 μm],[铜7—8],[1.7],[21 mΩ/□])

#align(center)[$R = rho L/A = (rho/T) (L/W) = R_"sq" (L/W)$]

源书同时列出用于复核上述薄层电阻的几何参数：0.18 μm 五层铝工艺中，金属 1–4 的 $T=0.5 "µm"$、$H=0.5 "µm"$、最小线宽 $W_("min")=0.3 "µm"$；第五层 $T=1.0 "µm"$、$H=0.5 "µm"$、$W_("min")=0.4 "µm"$。0.13 μm 八层铜工艺中，1–6 层 $T=0.4 "µm"$、$H=0.5 "µm"$、$W_("min")=0.2 "µm"$；7–8 层 $T=0.8 "µm"$、$H=0.5 "µm"$、$W_("min")=0.4 "µm"$。

艾蒙延迟计算使用给定电阻路径上的电容加权求和：

#align(center)[$tau_i = sum_(k) C_k R_(i k)$]

长线缓冲器插入时，教材整理的最优分段数与缓冲器尺寸为：

#align(center)[$N = sqrt((R_"int" C_"int" L^2/2)/(R_"eqn"(C_J+C_G)(1+beta)))$]
#align(center)[$M = sqrt((R_"eqn" C_"int")/((C_G(1+beta)) R_"int"))$]

本章其余总结位于下一页，包括区域/侧向/边缘电容、噪声串扰、电感和天线效应。
