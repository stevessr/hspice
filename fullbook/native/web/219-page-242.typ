// SOURCE PDF PAGE 242, printed 223. Skewed inverter rise/fall LE derivations.
#import "../figures/ch6-logical-effort-native.typ": le-panel
#set document(title:"第6章 · 例6.12偏斜反相器逻辑强度 · PDF242")
#align(center)[#text(size:8pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　　223]]
#line(length:100%,stroke:.5pt)

#align(center)[
  #le-panel(kind:"INV",up:"1",down:"1",le:"?")]

*解答：*

这里的延迟和输入电容都与参考反相器的值不同，必须调整其中之一来得到LE。以下给出得到LE的两种方法。对于这个门，上升和下降情况必须分别处理。

*方法一：* 设置延迟与参考反相器的延迟相等，并求出输入电容之比。

下降情况——下降延迟已经和常规的反相器相同了：

#align(center)[$LE_f = ((C_("in"))_("gate"))/((C_("in"))_("inv")) = (1+1)/(1+2)=2/3$]

上升情况——使所有的器件尺寸变为原来的两倍以获得相同的上升延迟：

#align(center)[#le-panel(kind:"INV",up:"2",down:"2",le:"4/3")]

#align(center)[$LE_r = ((C_("in"))_("gate"))/((C_("in"))_("inv")) = (2+2)/(1+2)=4/3$]

*方法二：* 用逻辑强度的定义：

#align(center)[$"LE"=((R_("eff") C_("in"))_("gate"))/((R_("eff") C_("in"))_("inv"))$]

对于下降情况：

#align(center)[$LE_f = (R_("eqn")(2C_g W))/(R_("eqn")(3C_g W))=2/3$]

对于上升情况：

#align(center)[$LE_r = (2R_("eqn")(2C_g W))/(R_("eqn")(3C_g W))=4/3$]

上升和下降情况的LE值是不同的，因此可以基于任何一个值进行优化。但是要想实现两种变化过程，则要用LE的平均值来确定晶体管的尺寸。

因此，该门的平均逻辑强度是：

#align(center)[$"LE" = ((2/3)+(4/3))/2=1$]