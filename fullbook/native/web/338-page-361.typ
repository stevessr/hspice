// SOURCE PDF PAGE 361. Source scan-assisted Typst native editorial draft.
// All circuit diagrams, text positions and equations still require strict 1:1 acceptance.
#import "../figures/ch10-rc-elmore-native.typ": figure10more,fig-example102,fig-example101
#set document(title:"第10章·连线RC与艾蒙延迟·PDF361")
#align(center)[#text(size:8pt,weight:"bold")[342　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

*例10.2　对短导线具有和没有电阻影响时的延迟*

问题：图中的输入反相器驱动四个相同尺寸的反相器，四个负载通过20 μm导线连接，导线宽度为0.2 μm，采用0.18 μm工艺。已知：

#align(center)[$C_("eff")=1 "fF/µm" quad C_("int")=0.2 "fF/µm" quad C_g=2 "fF/µm"$]

#fig-example102()
#align(center)[*例10.2　20 μm导线驱动四个反相器（编辑逻辑图）*]

驱动反相器宽度为 $W_N=0.8 "µm"$、$W_P=0.4 "µm"$；四个负载尺寸相同。相应的输入扇出、驱动器自电容以及导线电容为：

#align(center)[$C_("fanout")=4(2)(0.8+0.4) "fF"=9.6 "fF"$]
#align(center)[$C_("self")=(1)(0.8+0.4) "fF"=1.2 "fF"$]
#align(center)[$C_("wire")=(0.2)(20) "fF"=4 "fF"$]

总负载：

#align(center)[$C_("load")=9.6+1.2+4=14.8 "fF"$]

忽略导线电阻，采用教材的 $R_("eq")=12.5 "kΩ"$ 模型及对应尺寸，驱动电阻约6.25 kΩ，得到：

#align(center)[$tau_("driver")=(6.25 "kΩ")(14.8 "fF")=92.5 "ps"$]

计算20 μm金属导线的电阻，若方块电阻为54 mΩ/□：

#align(center)[$R_("wire")=(54 "mΩ")(20/0.2) approx 5.4 "Ω"$]

再使用π型或阶梯RC模型计入导线电阻，可获得更精确的结果。
