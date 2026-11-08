// SOURCE PDF PAGE 444 / printed page 425
// Native editable TTL table B.1 and chapter bibliography.
#set document(title:"附录B B.10延迟、B.11输入钳位、表B.1与文献 · PDF444")
= 附录 B · 印刷第425页
== B.10　传输延迟时间（续）

输入由高电平转为低电平时，$Q_2$、$Q_3$ 由导通变为截止，$Q_4$ 承担向输出负载充电的主要电流。原书指出利用图腾柱输出减小 $t_("PLH")$，后续 TTL 逻辑系列采用改进的肖特基技术进一步缩短传播延迟。

== B.11　输入钳位二极管

TTL 的输入端采用钳位二极管限制电压过冲和负向振荡，避免在输入极性剧烈变化时损害内部器件，并改善传输线振铃带来的问题。教材提到反向摆动若超过约 $-0.7 " V"$，二极管可形成导电钳位通路。

=== 表 B.1　标准晶体管—晶体管逻辑（54/74 TTL）在 $T_A=25 " °C"$ 的典型电特性

#table(columns:(1.2fr,1.15fr,1.35fr,1fr),inset:(x:2pt,y:2pt),
table.header([*参数*],[*典型值*],[*参数*],[*典型值*]),
[$V_("OH")/V_("OL")$],[3.5 V / 0.2 V],[扇出],[10],
[$V_("IH")/V_("IL")$],[1.5 V / 0.5 V],[电源电压],[+5.0 V],
[$"NM"_H/"NM"_L$],[2.0 V / 0.3 V],[功耗 / 每门],[10 mW],
[逻辑摆幅],[3.3 V],[传播延迟时间],[10 ns],
)

教材将原初 TTL 门的典型功耗延迟积标为 $100 " pJ"$，较先进的 74ALS 系列典型传播延迟约 $4 " ns"$、典型功耗约 $1 " mW"$；其性能与书中同时代的 CMOS 器件相比较。

== B.12　参考文献

+ V. H. Grinich and H. G. Jackson, _Introduction to Integrated Circuits_, McGraw-Hill, New York, 1975.
+ D. J. Hamilton and W. G. Howard, _Basic Integrated Circuit Engineering_, McGraw-Hill, New York, 1975.
+ H. Taub and D. Schilling, _Digital Integrated Electronics_, McGraw-Hill, New York, 1977.
+ D. A. Hodges and H. G. Jackson, _Analysis and Design of Digital Integrated Circuits_, 2nd ed., McGraw-Hill, New York, 1988, pp. 156–171.

_已将原书表 B.1 录为原生 Typst 表格；该扫描页的断行、字间距及脚注尚未完成原版视觉验收。_
