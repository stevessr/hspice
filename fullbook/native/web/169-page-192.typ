// SOURCE PDF PAGE 192 / printed 173. Power equations scan verified.
#import "../figures/ch5-dff-power-native.typ": charge-discharge
#set document(title:"第5章 · CMOS功耗和动态功耗 · 扫描192页")
#set text(lang:"zh")
= 第5章 · 印刷第173页

== 5.8　CMOS门电路的功耗

功耗需要综合考虑逻辑转换、短路电流、泄漏及有比逻辑的直流待机电流，延迟和功耗须联合优化。

$P = I_D V_("DD") quad "(5.7)"$

功耗来源按动态、静态划分。动态包括电容转换、过渡期间短路电流和毛刺转换；静态包括亚阈值传导、反偏结泄漏及某些电路的直流待机通路。

== 5.8.1　动态（转换）功耗

CMOS反相器输入高→低，PMOS给负载 $C_L$ 充电；输入低→高，NMOS放电。

#charge-discharge()

$I_("D,avg") = C_L (Delta V_("swing"))/(Delta t) = C_L V_("DD") f_("avg") quad "(5.8)"$

$P_("switching") = I_("D,avg") V_("DD") = C_L V_("DD")^2 f_("avg") quad "(5.9)"$

此处的 $f_("avg")$ 指该节点的有效充电事件频率，不应与任意输入翻转次数混淆。

*核验：*式（5.7）—（5.9）的编号、C与电压的平方关系已对照印刷第173页。示意图不包含原书图5.29的完整波形。
