// SOURCE PDF PAGE 218 / printed 199; example 6.2 first simulation.
#import "../figures/ch6-delay-capacitance-native.typ": inverter-chain
#set document(title:"第6章 · 例6.2 HSPICE电容参数测定（1） · PDF218")
#set text(lang:"zh")
= 第6章 · 印刷第199页

结合前一页的经验参数：

$ C_("eff") = C_j + 2 C_("ol") approx 0.5 " fF/μm" + 2(0.25 " fF/μm") approx 1 " fF/μm" $

== 例6.2　在0.18 μm工艺中用SPICE确定 $C_g$ 和 $C_("eff")$

#inverter-chain()

第一个反相器为10X，驱动40X反相器，再由40X驱动160X。对第一种仿真，令源漏面积和周长参数为零，以消除结电容影响；再施加具有非零面积/周长的第二种仿真，使用传播延迟的差求自身电容贡献。

源书在不计结电容条件下给出的首级传播延迟：下降40 ps，上升55 ps。

$ t_("pHL") = 0.7 R_N C_("fanout") $

$ t_("pLH") = 0.7 R_P C_("fanout") $

据此分别反推单位宽度栅电容：

#table(columns:(1.5fr,1fr),inset:4pt,table.header([下降沿反推],[上升沿反推]),[$C_g approx 1.9 " fF/μm"$],[$C_g approx 2.2 " fF/μm"$])

_源网表具有0.18 μm BSIM3模型路径、PWL激励、.tran 5ps 350ps和40/55ps延迟；此处保留推导关键值，模型文件不随教材上传。_