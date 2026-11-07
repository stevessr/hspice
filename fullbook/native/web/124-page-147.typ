// SOURCE PDF PAGE 147 / printed 128
#import "../figures/ch4-cmos-continued-native.typ": five-regions, through-current
#set document(title:"第4章 · 图4.12 CMOS五工作区 · PDF147")
= 第4章 · 印刷第128页

== 图4.12　CMOS反相器的特性
#five-regions()
#through-current()

*图4.12*　(a) CMOS反相器；(b) NMOS与PMOS的负载线；(c) 电压传输特性与电流转移特性。上述可编辑曲线保留工作区顺序，并非原图准确采样点。

观察图4.12(a)的端口极性：n沟道器件正常工作时 $V_("GS")$、$V_("DS")$、$V_("TN")$ 为正；p沟道器件采用互补极性。分析PMOS电流时可以对各偏置使用绝对值，但必须检查PMOS的实际导通条件。若有电流，栅电压应比源电压至少低一个PMOS阈值绝对值。

图4.12(c)把输入由0增加到 $V_("DD")$ 时的静态VTC划分为五个区域：
#table(columns:(.7fr,1.5fr,2.4fr),inset:(x:3pt,y:2pt),
table.header([*区域*],[*NMOS / PMOS*],[*物理情况*]),
[I],[截止 / 线性],[NMOS截止，$V_("out")=V_("DD")$],
[II],[饱和 / 线性],[NMOS导通，PMOS漏源压较小],
[III],[饱和 / 饱和],[转换点附近，电流相等],
[IV],[线性 / 饱和],[NMOS漏源压较小],
[V],[线性 / 截止],[PMOS截止，$V_("out") approx 0$],
)

区域I：当 $V_("in")$ 未达到 $V_("TN")$ 时，输出保持 $V_("OH")=V_("DD")$。区域II：NMOS饱和而PMOS线性，其电流平衡条件为：

$ I_("DN")("sat") = I_("DP")("lin") $

该式的展开从下一扫描页继续。
