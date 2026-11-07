// SOURCE PDF PAGE 199 / printed 180. Double-scan OCR corrections (μA, μW).
#set document(title:"第5章 · 完整功耗与伪NMOS例5.8 · PDF199")
#set text(lang:"zh")
= 第5章 · 印刷第180页

== 5.8.3　完整的功耗公式

标准CMOS门包含动态切换和静态泄漏；此前已把短路电流造成的功耗并入行为因子：

$P = alpha C V_("DD")^2 f_("clk") + I_("leak") V_("DD") quad "(5.17)"$

对伪NMOS门，教材另计入直流待机功耗，并假设仅有半数时间存在此电流：

$P = alpha C V_("DD")^2 f_("clk") + I_("leak") V_("DD") + (I_("DC") V_("DD"))/2 quad "(5.18)"$

== 例5.8　0.13 μm工艺的伪NMOS反相器

扫描源页：$V_("OL")=0.1 " V"$、$W_N/L_N=9$、$V_("DD")=1.2 " V"$，利用线性区NMOS电流模型求得：

$I_("DC") = 250 mu "A"$

$P_("DC") = I_("DC") V_("DD") = (250 mu "A")(1.2 " V") = 300 mu "W"$

#table(columns:(1fr,1fr),inset:4pt,table.header([源书条件或结论],[二次核对]),[$V_("OL")$],[0.1 V],[$W_N/L_N$],[9],[$I_("DC")$],[250 μA],[$P_("DC")$],[300 μW])

== 5.9　功耗和延迟的折中

降低活动电容和供电电压往往影响传播延迟。功耗和性能需要放在同一评价框架中考察，下一页引入PDP和EDP。

*二次扫描纠错：*原页为*250 μA*和*300 μW*，并非OCR误读的pA/pW。整页仍为待完整验收的原生选段。
