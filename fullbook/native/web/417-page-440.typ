// SOURCE PDF PAGE 440 / printed page 421
// Source-checked BJT thresholds and Schottky clamped inverter explanation.
#import "../figures/appendix-b-additional-native.typ": *
#set document(title:"附录B 例：BJT门限及肖特基钳位反相器 · PDF440")
= 附录 B · 印刷第421页
== B.5　电压传输特性（续）

将 $R_B=10 " kΩ"$、$R_C=1 " kΩ"$、$V_("CC")=5 " V"$、$V_("CE")("sat")=0.1 " V"$、$V_("BE")("sat")=0.8 " V"$、$beta_F=70$ 代入式(B.5.4)，得到：

$ V_("IH") = 0.8 + (10 (5-0.1))/70 = 1.5 " V" $

于是图 B.5 的两个主要断点为：
#table(columns:(1fr,1.5fr,1.5fr),inset:3pt,
table.header([*断点*],[*输入电压*],[*输出电压*]),
[BP1],[0.7 V],[5.0 V],
[BP2],[1.5 V],[0.1 V],
)

原书将电压传输特性在活性区的斜率用电压增益表示：

$ a_v = (Delta V_("out"))/(Delta V_("in")) quad "(B.5.5)" $

== B.6　肖特基钳位反相器

#align(center)[#b6-schottky-clamp()]

图 B.6 描述肖特基势垒二极管跨接在 BJT 基极与集电极之间的结构。输入电压继续升高时，SBD 先导通并转移部分基极电流，限制晶体管进入深饱和，从而减少关断期间必须释放的少数载流子存储电荷。

教材在近似电压模型下对比：$V_("BE")("on") approx 0.7 " V"$，肖特基二极管正向压降约 $0.3 " V"$，故钳位后的 $V_("CE") approx 0.4 " V"$；没有钳位时的饱和压降约为 $0.1 " V"$。更快的关断以略高的低电平输出电压为代价。

_图 B.6(a) 器件截面和 (b) 等效电路连接尚未完成几何忠实性核验。_
