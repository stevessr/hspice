// SOURCE PDF PAGE 369. Scan-guided editable Typst selection; NOT full 1:1 acceptance.
// Original source scan: printed page 350; images/figures are editable abstractions.
#import "../figures/ch10-coupling-native.typ": fig1011,fig1012,fig1013,fig1014,fig1015,fig1016,fig1017,fig1018,fig1019
#set document(title:"第10章·连线设计·源扫描PDF369")
#set text(size:7.2pt)
#show par: set par(leading:2.3pt,spacing:3.4pt)
#align(center)[#text(size:7.5pt,weight:"bold")[350　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#fig1015()
#align(center)[*图10.15　近间距与远间距情况下的侧向电容（可编辑示意）*]

两根同层导线非常接近时，可用平板公式近似其侧向电容。$T$ 为金属厚度，$S$ 为相邻线间距：

#align(center)[$C_"lateral" = epsilon_"ox" T/S quad (10.12)$]
#align(center)[$C_"lateral" approx 0.035 T/S "fF/μm"$]

教材采用的0.18 μm工艺上层金属条件为 $T=0.8 "μm"$、$S=0.4 "μm"$。原扫描该段结果疑似印为“0.0070 fF/μm”，但按同页给出的公式和数值计算是：

#align(center)[$0.035 times (0.8/0.4) = 0.070 "fF/μm"$]

对于图10.15(b)较远的间距（40λ），教材给出的侧向电容约为0.007 fF/μm，可近似忽略。

边缘电容在导线间距较远时比较突出。图10.16(a)显示紧邻导线由侧向电容主导，图10.16(b)则显示导线边缘形成的额外耦合。

#align(center)[$C_"fringe" = epsilon_"ox" ln(1 + T/H) quad (10.13)$]

对于 $T=H=0.5 "μm"$ 的例子：

#align(center)[$C_"fringe" = 4 (88.5 times 10^(-4) "fF/μm") ln(1 + 0.5/0.5) approx 0.025 "fF/μm"$]

#fig1016()
#align(center)[*图10.16　边缘电容的近、远间距模型（可编辑示意）*]

*校勘提示：* 源扫描第350印刷页的近间距小数与相邻第351页的计算不完全一致，原生版保留这一差异并列出按公式计算的结果，未静默更改教材。
