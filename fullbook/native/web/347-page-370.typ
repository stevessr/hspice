// SOURCE PDF PAGE 370. Scan-guided editable Typst selection; NOT full 1:1 acceptance.
// Original source scan: printed page 351; images/figures are editable abstractions.
#import "../figures/ch10-coupling-native.typ": fig1011,fig1012,fig1013,fig1014,fig1015,fig1016,fig1017,fig1018,fig1019
#set document(title:"第10章·连线设计·源扫描PDF370")
#set text(size:7.2pt)
#show par: set par(leading:2.3pt,spacing:3.4pt)
#align(center)[#text(size:7.5pt,weight:"bold")[351　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

将区域、侧向和边缘三个电容贡献相加，可以估计每单位长度的总互连电容 $C_"int"$。

对上层金属线间距较近的情况，原书以两侧同层邻线以及上下两侧导体建模：

#align(center)[$C_"int" = 2 C_"area" + 2 C_"lateral" + 2 C_"fringe"$]
#align(center)[$approx 2(0.03) + 2(0.070) + 2(0.0) = 0.2 "fF/μm"$]

对上层金属间距较远的情况，侧向电容近似为零，边缘电容成为主要修正：

#align(center)[$C_"int" = 2 C_"area" + 2 C_"fringe" + 2 C_"lateral"$]
#align(center)[$approx 2(0.03) + 2(0.025) + 2(0.0) = 0.1 "fF/μm"$]

原书还将同一过程用于底层金属。相邻较近时：

#align(center)[$C_"int" = 2(0.015) + 2(0.035) + 2(0.0) = 0.1 "fF/μm"$]

相邻较远时：

#align(center)[$C_"int" = 2(0.015) + 2(0.025) + 2(0.0) = 0.08 "fF/μm" approx 0.1 "fF/μm"$]

#fig1016()
#align(center)[*图10.16　边缘电容模型（近间距/远间距，编辑示意）*]

上层金属的典型结果为：近间距导线约0.2 fF/μm，远间距导线约0.1 fF/μm。该量级与先前用于互连延迟计算的单位长度电容假设相吻合。
