// Source PDF page 075 / printed page 56. Fig 2.18, example 2.11 and pn-junction intro.
#import "../figures/mos-cap-native.typ": gate-cap-variation
#set document(title:"第2章 · MOS工作区栅电容和例2.11 · PDF75页")
#set text(lang:"zh")

= 第2章 · 印刷第56页

== 图2.18　工作区中的电容分配

在截止状态，沟道不形成，栅极电容主要通过衬底耦合；在线性区，栅沟道电容约均匀分配到源漏端；在饱和区，沟道靠近漏端被夹断，栅—漏沟道电容趋小。

#gate-cap-variation()

*图2.18　栅—源、栅—漏和栅—体电容随偏置改变的可编辑趋势示意。*

== 例2.11　薄氧化物电容的计算

原题使用 PMOS 器件：$t_("ox")=22 " Å"$、$W=400 " nm"$、$L=100 " nm"$。由上一页 $C_g approx 1.6 " fF/μm"$ 得：

$ C_G = 0.4 times 1.6 " fF" = 0.64 " fF" $

#table(columns:(1.0fr,1.0fr,1.0fr,1.0fr),
 table.header([*工作区*],[*$C_("GS")$*],[*$C_("GD")$*],[*$C_("GB")$*]),
 [截止区],[0],[0],[0.64 fF],
 [线性区],[0.32 fF],[0.32 fF],[0],
 [饱和区],[0.43 fF],[0],[0],
)

在饱和区，栅源电容约为总栅电容的 $2/3$；题目中的0.43 fF是 $2/3 times 0.64$ 的近似值。

== 2.8.2　pn结电容

MOS 器件的源漏与体区形成 pn 结，在正常偏置中通常为反向偏置。教材首先给出理想二极管电流：

$ I_D = I_s (exp(V_j/V_("th")) - 1) quad "(2.35)" $

_例2.11三种工作区的电容已对照扫描件录入表格；图2.18仍是定性示意。_
