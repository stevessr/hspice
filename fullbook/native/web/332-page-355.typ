// SOURCE PDF PAGE 355. Editable source-guided editorial selection, strict page 1:1 not accepted.
#import "../figures/ch9-nonvolatile-ch10-interconnect-native.typ": figure9late,figure10,fig-summary
#set document(title:"数字集成电路第10章·PDF355")
#align(center)[#text(size:8pt,weight:"bold")[336　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

10.1　绪论（续）

数字系统使用多个金属层连接不同的晶体管、功能模块和时钟树。图10.1给出典型工艺中的多层金属、层间绝缘介质与通孔（via）的结构。在相对先进工艺中，较低层金属用于局部短连接，而较高层金属较宽、适合更长距离的信号或电源传送。

#figure10(1)
#align(center)[*图10.1　集成电路多层互连剖面（原生编辑剖面草图）*]

连线电阻取决于材料电阻率、线长、宽度和厚度；电容取决于与衬底和相邻导体之间的几何以及介质常数。较小截面会增大电阻，而密集并排放置的金属线可能增加耦合电容。

图10.2用几何尺寸 $L$、$W$、$T$ 和相邻间距描述局部互连，用于后续的电阻、层间电容和侧壁耦合计算。

#figure10(2)
#align(center)[*图10.2　互连线横截面与电阻/电容几何模型*]

除了延迟，导线失效还可能来源于由过大电流密度导致的电迁移（electromigration），或由工艺缺陷造成的断路、短路。布局布线与材料选择需联合考虑速度、信号完整性和长期可靠性。
