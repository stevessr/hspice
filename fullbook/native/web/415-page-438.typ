// SOURCE PDF PAGE 438 / printed page 419
#import "../figures/appendix-b-native.typ": bjt-inverter
// Native editable BJT resistor-loaded inverter parameter table.
#set document(title:"附录B BJT反相器图B.4与电压传输特性 · PDF438")
= 附录 B · 印刷第419页
== B.4　双极晶体管反相器

图 B.4(a) 中，集电极电阻 $R_C$ 接到 $V_("CC")$，基极通过输入电阻 $R_B$ 连接 $V_("in")$，发射极接地，输出电压 $V_("out")$ 取自集电极。

#bjt-inverter()

#table(columns:(1.15fr,1.2fr,2.25fr),inset:(x:3pt,y:2pt),
table.header([*参数*],[*原书示例*],[*含义*]),
[$V_("CC")$],[5 V],[电源电压],
[$R_B$],[10 kΩ],[输入基极限流电阻],
[$R_C$],[1 kΩ],[集电极负载电阻],
[$beta_F$],[70],[正向共射极电流增益],
[$V_("BE")("on")$],[0.7 V],[BJT导通基极—发射极压降],
[$V_("BE")("sat")$],[0.8 V],[饱和时基极—发射极压降],
[$V_("CE")("sat")$],[0.1 V],[集电极—发射极饱和压降],
)

当 $V_("in")$ 为低电平时，BJT 截止，集电极电阻没有明显压降，输出接近 $V_("CC")$；输入升高后 BJT 先进入正向活性区，输出下降；再进一步增大输入时进入饱和，输出接近 $V_("CE")("sat")$。

== B.5　电压传输特性

原书把图 B.5 的 BJT 电阻负载反相器 VTC 分为截止、活性和饱和三个工作区。每一区域的输出电压取决于晶体管电流及 $R_C$ 上的压降。

_原书图 B.4 的等效图及反相器符号尚待用原生图元逐元素重画。_
