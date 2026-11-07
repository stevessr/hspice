// SOURCE PDF PAGE 154 / printed 135
#import "../figures/ch4-cmos-continued-native.typ": cmos-layout
#set document(title:"第4章 · 图4.13 CMOS版图与4.7伪NMOS引言 · PDF154")
= 第4章 · 印刷第135页

#cmos-layout()

*图4.13　CMOS反相器的版图。* 编辑图包括n阱、p阱、多晶硅、扩散、金属层1与接触点。其边界仅为结构性重画，尚未达到原图逐线几何精度。

电路模拟需要的几何参数由版图设计提取。SPICE MOS实例的关键尺寸与扩散相关参数包括：

$ L, quad W, quad "AS", quad "AD", quad "PS", quad "PD" $

其中 $L,W$ 是沟道长宽，AS/AD与PS/PD分别代表源漏扩散的面积和周长。对精确的瞬态仿真，源漏寄生电容信息不可忽略。

== 4.7　伪NMOS反相器

对于多输入逻辑门，传统CMOS推挽结构通常需要约为输入数两倍的晶体管数量。NMOS负载的一个优点是，多输入门只需要一个上拉负载，但饱和增强型NMOS负载会降低高电平 $V_("OH")$；线性增强型负载则需要额外的栅偏置电源。

伪NMOS（pseudo-NMOS）结构使用**PMOS作为始终导通的负载**：将PMOS栅极接地、源极接 $V_("DD")$，以一只或多只由输入控制的NMOS形成下拉网络。

当NMOS关闭时，PMOS把输出上拉到 $V_("DD")$；当NMOS导通时，上下拉管之间出现分压，需通过器件宽长比保证所需输出低电平。因此伪NMOS是**有比逻辑**，而理想静态CMOS反相器为无比逻辑。

低输出电平时伪NMOS存在从 $V_("DD")$ 到地的静态电流。该结构在减少多输入门晶体管数量与静态功耗之间作折中。
