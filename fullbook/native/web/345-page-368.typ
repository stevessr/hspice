// SOURCE PDF PAGE 368. Scan-guided editable Typst selection; NOT full 1:1 acceptance.
// Original source scan: printed page 349; images/figures are editable abstractions.
#import "../figures/ch10-coupling-native.typ": fig1011,fig1012,fig1013,fig1014,fig1015,fig1016,fig1017,fig1018,fig1019
#set document(title:"第10章·连线设计·源扫描PDF368")
#set text(size:7.2pt)
#show par: set par(leading:2.3pt,spacing:3.4pt)
#align(center)[#text(size:7.5pt,weight:"bold")[349　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

在图10.13的分析模型里，中心金属线同时受到上、下金属层及同层两侧导线的影响。原书把区域电容、侧向电容和边缘电容分别计算，再相加估计总电容。

#fig1013()
#align(center)[*图10.13　与中间导线相关的电容（可编辑拓扑示意）*]

区域电容是每单位长度电容中最容易估算的部分。对导线与地以及导线与上一层金属的重叠区域，使用平板电容模型：

#align(center)[$C_"area" = epsilon_"ox" W/H quad (10.11)$]

其中 $epsilon_"ox" = 4 epsilon_0$，$W$ 是金属线宽，$H$ 是垂直层间距。原书写为：

#align(center)[$C_"area" = 4 (88.5 times 10^(-4) "fF/μm") W/H approx 0.035 W/H "fF/μm"$]

对0.18 μm工艺的示例，$W=0.4 "μm"$，$H=0.5 "μm"$：

#align(center)[$C_"area" approx 0.03 "fF/μm"$]

#fig1014()
#align(center)[*图10.14　区域电容模型（可编辑示意）*]

这一模型用于建立数量级直觉；它忽略边缘和三维电场耦合。由于线宽按比例缩小，其他条件相同时区域电容也随之减小。
