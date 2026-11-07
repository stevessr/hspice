// SOURCE PDF PAGE 200 / printed 181. Equations 5.19–5.23.
#set document(title:"第5章 · PDP与EDP折中 · PDF200")
#set text(lang:"zh")
= 第5章 · 印刷第181页

== 5.9　功耗和延迟的折中（续）

将门的平均功耗乘以平均传播延迟，得到功耗—延迟积：

$"PDP" = P_("avg") t_p quad "(5.19)"$

若 $P_("avg")=C V_("DD")^2 f$，且近似 $t_p=1/(2f)$，则：

$"PDP" = (C V_("DD")^2)/2 quad "(5.20)"$

此量的单位为能量。电容从0充至 $V_("DD")$ 后储存 $C V_("DD")^2/2$ 的能量；不能把它与电源每周期提供的全部能量混同。

PDP不能单独保留延迟差异，因此继续定义能量—延迟积：

$"EDP" = "PDP" times t_p quad "(5.21)"$

从电流和电容的关系出发：

$Delta t = (C Delta V)/I quad "(5.22)"$

教材采用简单的电流近似 $t_p approx (C V_("DD"))/(K_2 (V_("DD")-V_T))$，得出：

$"EDP" = (C^2 V_("DD")^3)/(2 K_2 (V_("DD")-V_T)) quad "(5.23)"$

#table(columns:(1fr,2fr),inset:4pt,table.header([指标],[物理量及单位]),[PDP],[每次操作的能量尺度，J],[EDP],[能量和延迟的联合尺度，J·s])

*校对说明：*式（5.19）至（5.23）按原扫描图像检查编号和电压指数，两个推导均依赖教材声明的简化假设。原页正文尚未逐字完整复刻。
