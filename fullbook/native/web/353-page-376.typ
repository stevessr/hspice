// SOURCE PDF PAGE 376. Scan-guided native Typst selection, not a 1:1 accepted page.
// Printed textbook page 357; topology/plot curves remain editorial abstractions.
#import "../figures/ch10-inductance-antenna-native.typ": fig1020,fig1021,fig1022,fig1023,fig1024,fig1025,fig1026,fig1027,fig1028
#set document(title:"第10章·串扰、RLC和天线效应·源PDF376")
#set text(size:7.1pt)
#show par: set par(leading:2.25pt,spacing:3.3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[357　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

互连电感可以在基本的 RC 线路模型中增加一项串联元件，形成 RLC 等效模型。

#fig1023()
#align(center)[*图10.23　分布式互连的 RLC 等效模型（可编辑图元）*]

在大多数片上导线中，较大的驱动器等效电阻及线阻可抑制电感效应，输出主要呈 RC 型单调响应。当互连线较长、驱动器输出阻抗较小或信号边沿很快时，电感更可能显现。

可将阻性分量与交流感抗作数量级比较。原书讨论的电感重要性边界写为：

#align(center)[$R_"buffer" + R_"wire" < omega L quad (10.22)$]

这里的比较是一阶判据；实际分布互连的瞬态响应还受线长、每单位长度电感/电容、终端阻抗和输入上升时间的影响。

教材进一步对比源阻抗 $R_s$ 和特征阻抗 $Z_0$ 的两种波形：当 $R_s \>\> Z_0$（阻尼大）时近似单调：

$ V_("out")(t) = 1 - exp(-t/(R C)) $

当 $R_s$ 低于 $Z_0$ 时，可出现欠阻尼形式的衰减振铃：

$ V_("out")(t) = 1 - r exp(-t/a) cos(b t + c) $

原书用这一通式展示振荡的本质，其中 $r,a,b,c$ 由 RLC 模型决定，并非统一的固定参数。

对均匀传输线，特征阻抗定义为：

#align(center)[$Z_0 = sqrt(L_"int" / C_"int")$]

当驱动和终端阻尼较大时，近似 RC 的计算通常有效；当阻尼较小时，传输线反射会导致过冲、欠冲和振铃。
