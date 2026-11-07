// SOURCE PDF PAGE 213 / printed 194; figures 6.4 and 6.5.
#import "../figures/ch6-delay-capacitance-native.typ": stacking
#set document(title:"第6章 · 串联管速度饱和与尺寸 · PDF213")
#set text(lang:"zh")
= 第6章 · 印刷第194页

== 图6.4　考虑速度饱和效应时确定CMOS门尺寸

单级反相器采用PMOS约2W、NMOS W。理想等效电阻法会把NAND的两只串联NMOS调到各2W，把NOR的两只串联PMOS调到各4W。

#stacking()

但两只串联器件并非在整个转换期间工作于完全相同的偏置；串联堆叠中的内部节点抬升会改变上管的 $V_("GS")$ 与 $V_("DS")$，使速度饱和条件与单管不同。

== 图6.5　速度饱和的堆叠器件

图6.5比较了宽W的单个NMOS及两只宽2W的串联NMOS在给负载放电时的电流—电压特性。单管的输出端饱和电流与堆叠两管电流不宜直接假定完全一致。

_本页的全部原始I–V坐标、器件M0/M1/M2的曲线与回路尚待精确逐线重画。_