// SOURCE PDF PAGE 107 / printed 88, equations 3.12–3.16.
#set document(title:"第3章 · BSIM3短沟道阈值与双参杂模型 · PDF107")
#set text(lang:"zh")
= 第3章 · 印刷第88页

接前页，BSIM3模型根据沟道长度和宽度所在的区域分箱。原书提醒，模型分区的边界可能造成仿真不连续性，因此工艺方提供的模型必须检查尺寸和电压范围内的平滑程度。

== 3.6.2　短沟道阈值电压

第2章给出含体效应的长沟道阈值公式。BSIM3从一个形式相近的阈值表达式开始：

$ V_T = "VTH0" + gamma (sqrt("PHI" - V_("BS")) - sqrt("PHI")) quad "(3.12)" $

原书指出，沟道的杂质浓度高于体区掺杂浓度，采用单一杂质浓度和单一体效应系数不能正确描述阈值随漏端、沟道长度、宽度的变化。

BSIM3把表面沟道掺杂写为NCH，衬底掺杂写为NSUB。对应的费米势项为：

$ "PHI" = 2 (k T)/q ln("NCH"/n_i) quad "(3.13)" $

根据两种掺杂浓度分别引入两个体效应系数：

$ gamma_1 = sqrt(2 epsilon_("si") q "NCH")/C_("ox") $

$ gamma_2 = sqrt(2 epsilon_("si") q "NSUB")/C_("ox") quad "(3.14)" $

氧化层电容仍依据TOX：

$ C_("ox") = epsilon_("ox")/"TOX" quad "(3.15)" $

利用这两个体效应系数定义K1、K2：

$ "K1" = f(gamma_2, "PHI") $

$ "K2" = f(gamma_1, gamma_2, "PHI") quad "(3.16)" $

这里保留原书的函数表示，不自行推断BSIM3完整K1/K2提取公式。下一页将它们代入阈值计算，并讨论SCE和RSCE。

_本页式（3.12）—（3.16）、NCH/NSUB与K1/K2变量已按扫描逐符号校对。_
