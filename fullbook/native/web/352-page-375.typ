// SOURCE PDF PAGE 375. Scan-guided native Typst selection, not a 1:1 accepted page.
// Printed textbook page 356; topology/plot curves remain editorial abstractions.
#import "../figures/ch10-inductance-antenna-native.typ": fig1020,fig1021,fig1022,fig1023,fig1024,fig1025,fig1026,fig1027,fig1028
#set document(title:"第10章·串扰、RLC和天线效应·源PDF375")
#set text(size:7.1pt)
#show par: set par(leading:2.25pt,spacing:3.3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[356　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 10.5　连线的电感

前述互连模型以电阻和电容为主。随着工作速度提高和导线加长，电流变化还会产生磁通与感应电压，必须考虑导线电感。对于简化的自感模型：

#align(center)[$Phi = L i quad (10.18)$]

电感两端的电压与电流变化率成正比：

#align(center)[$Delta V = L (dif i)/(dif t) quad (10.19)$]

在理想均匀介质中，单位长度互连电容和电感的乘积满足电磁场关系：

#align(center)[$C_"int" L_"int" = epsilon_"ox" mu_"ox" quad (10.20)$]

原书取单位长度电容约 $0.1 "fF/μm"$，估算单位长度互连电感约 $0.45 "pH/μm"$。这两者均是教材参数化示例，实际线宽、回流路径和屏蔽结构会改变结果。

原书所用估计还给出绝缘介质的电导率为零的近似、氧化物的介电常数 $epsilon_("ox")$ 及磁导率 $mu_("ox")$；源例的 $L_("int") approx 0.45 "pH/μm"$ 是由 $C_("int")=0.1 "fF/μm"$ 和介质关系推得的数量级估值。

导线的串联阻抗可写作：

#align(center)[$Z_"RL" = R + j omega L quad (10.21)$]
#align(center)[$omega = 2 pi f$]

在较低频率下 $R$ 分量占优；频率升高时，$omega L$ 的贡献增大。长线应检查电感是否会引起过冲、振铃或耦合噪声。
