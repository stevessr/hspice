// SOURCE PDF PAGE 195 / printed 176. Source equation numbers 5.11–5.13.
#import "../figures/ch5-dff-power-native.typ": short-circuit-current
#set document(title:"第5章 · 短路电流和动态功耗 · 扫描195页")
#set text(lang:"zh")
= 第5章 · 印刷第176页

== 图5.30　转换过程中短路电流的流动

有限斜率输入可能使NMOS与PMOS在一定时间同时导通。放电与充电两个转换区间分别为 $Delta t_("scr")$、$Delta t_("scf")$：

$Delta t_("sc") = Delta t_("scr") + Delta t_("scf")$

#short-circuit-current()

$P_("SC") = I_("SC") V_("DD")$

$I_("SC") = (Delta t_("sc"))/T I_("SC,avg")$

$P_("SC") = Delta t_("sc") I_("SC,avg") V_("DD") f_("clk") quad "(5.11)"$

将短路重叠电流折算成等效电容 $C_("sc")$，有：

$P_("SC") = alpha_("sc") C_L V_("DD")^2 f_("clk") quad "(5.12)"$

将电容切换与短路两个分量合并：

$P_("dynamic") = alpha_("0→1") C_L V_("DD")^2 f_("clk") + alpha_("sc") C_L V_("DD")^2 f_("clk") = alpha C_L V_("DD")^2 f_("clk") quad "(5.13)"$

*二次核对：*源书编号（5.11）—（5.13）存在，$alpha$ 是合并后的系数，不能把电容和短路损耗误作两个独立的同名因子。
