// SOURCE PDF PAGE 362. Source scan-assisted Typst native editorial draft.
// All circuit diagrams, text positions and equations still require strict 1:1 acceptance.
#import "../figures/ch10-rc-elmore-native.typ": figure10more,fig-example102,fig-example101
#set document(title:"第10章·连线RC与艾蒙延迟·PDF362")
#align(center)[#text(size:8pt,weight:"bold")[343　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

*例10.2（续）*

按照原书近似的π型网络，导线寄生电容分摊到两端，艾蒙延迟为：

#align(center)[$tau approx (6.25 "kΩ")(3.2 "fF")+(6.25 "kΩ"+5.4 "Ω")(11.6 "fF")$]
#align(center)[$tau approx 92.6 "ps"$]

因此对于20 μm的这条短线，计入导线电阻前后（92.5 ps与92.6 ps）没有明显差别，可以使用集总负载近似。

*例10.3　驱动长导线的反相器延迟*

问题：第五层铝线长20 mm，由100X反相器驱动。线宽0.5 μm，单位长度电容0.1 fF/μm，高层金属方块电阻0.027 Ω/□。

导线的总电阻：

#align(center)[$R_("wire")=(0.027 "Ω") (20000/0.5)=1080 "Ω"$]

导线电容：

#align(center)[$C_("wire")=(0.1 "fF/µm")(20000 "µm")=2 "pF"$]

放大100倍后的反相器等效电阻：

#align(center)[$R_("eff")=(12.5 "kΩ")/100=125 "Ω"$]

在源书中，输出自电容写为 $C_("self")=C_("eff") (2W+W) 100=(1 "fF/µm")(0.6 "µm")100=60 "fF"$。其量级远小于长导线的 2 pF，因而该例按图中的 125 Ω 驱动电阻、1080 Ω 线电阻和两个 1 pF 对地电容构成的 π 型模型求解。

假设自电容由 $C_("eff")$ 模型计算，约为60 fF，相比2 pF导线电容很小。将电容近似为两半分布，使用π型网络，则：

#align(center)[$tau_("Elmore")=(125 "Ω")(1 "pF")+(125 "Ω"+1080 "Ω")(1 "pF") approx 1.3 "ns"$]

这说明长连线延迟不能仅由晶体管负载电容估算。
