// SOURCE PDF PAGE 170 / printed 151
#import "../figures/ch5-cmos-gates-native.typ": gate-widths
#set document(title:"第5章 · 图5.2与多输入CMOS宽度规则 · PDF170")
= 第5章 · 印刷第151页

在匹配参考反相器最坏导通电阻的设计规则下，二输入NAND和NOR的器件尺寸采用不同的串并联补偿方式。

#gate-widths()

*图5.2　CMOS电路中器件的尺寸。* 原书比较(a)反相器、(b)与非门、(c)或非门。

NAND2：下拉两NMOS串联，每只宽2W；上拉两PMOS并联，最坏只一只导通时，每只PMOS宽2W。结果四个器件的宽度均为2W。

NOR2：下拉两NMOS并联，最坏只一只导通时每只宽W；上拉两PMOS串联，需要每只宽4W。这样最坏路径的有效上拉电阻近似与参考反相器一致。

类似原则可扩展到三输入逻辑门及更多输入：

#table(columns:(1.1fr,1.4fr,1.6fr),table.header([*电路*],[*PMOS宽度*],[*NMOS宽度*]),
[反相器],[2W],[W],
[NAND3],[各2W（并联）],[各3W（串联）],
[NOR3],[各6W（串联）],[各W（并联）],
)

伪NMOS的器件尺寸设计则与上下拉器件的电流比例相关，因为负载PMOS只有一只且始终导通。下拉NMOS可以根据期望低电平 $V_("OL")$ 和时序条件确定宽度。

本页之后将用图5.3讨论三个输入的伪NMOS与非/或非门：串联NMOS构成NAND，多支NMOS并联构成NOR。
