// SOURCE PDF PAGE 194 / printed 175. Corrected OCR error 230->250 MHz, pW->uW.
#set document(title:"第5章 · 例5.6 反相器功耗与HSPICE · 扫描194页")
#set text(lang:"zh")
= 第5章 · 印刷第175页

== 例5.6　手工功耗与SPICE仿真的比较

源扫描明确列出：PMOS宽度 $W_P = 800 " nm"$，NMOS宽度 $W_N = 400 " nm"$，总负载 $C_L=50 " fF"$，转换频率 *250 MHz*，0.18 μm工艺、$V_("DD")=1.8 " V"$。输入上升与下降时间均设置300 ps。

$P_("hand") = C_L V_("DD")^2 f = (50 " fF")(1.8 " V")^2 (250 " MHz") = 40.5 mu "W"$

教材的SPICE示例采用4 ns周期的激励，.tran 50 ps 5 ns，并用 .measure 在1至5 ns区间计算平均功耗。原页测得：

#table(columns:(2fr,1fr),inset:4pt,table.header([指标],[核对值]),[理论电容转换功耗],[40.5 μW],[SPICE总平均功耗],[46.3 μW],[相对增幅],[约14%])

$ (46.3 - 40.5)/(40.5) approx 0.143 = 14.3% $

SPICE测量略高，主要因为有限输入转换时间内NMOS与PMOS的重叠导通，额外产生短路电流。

== 源书网表的审阅参数

#table(columns:(1fr,2fr),inset:3pt,table.header([参数],[源书设置]),[.param Supply],[1.8],[.opt scale],[0.1u],[Cload],[50 fF],[Vin pulse],[周期4 ns、上升/下降200 ps],[.tran],[50 ps、5 ns],[.measure],[tran avgpwr avg P(Xinv) from=1n to=5n])

*二次扫描纠错：*OCR把250 MHz识别为230 MHz，把 μW误判为其他单位；这里严格采用原页印刷的250 MHz、40.5 μW、46.3 μW。题干要求300 ps而网表使用200 ps，此处作为原书内参数差异原样记录，不擅自改成一致。
