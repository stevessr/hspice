// SOURCE PDF PAGE 437 / printed page 418
// Equations B.4.1b–B.4.5 reconstructed as editable Typst math.
#set document(title:"附录B Ebers-Moll模型及BJT储存电荷 · PDF437")
= 附录 B · 印刷第418页
== B.3　用于电路模拟的 BJT 模型（续）

与上一页的发射极电流配对，集电极电流由 Ebers–Moll 模型写为：

$ I_C = I_S (exp(V_("BE") / V_T)-1) - I_S / alpha_R (exp(V_("BC") / V_T)-1) quad "(B.4.1b)" $

正反向饱和电流的关系为：

$ I_S = alpha_F I_("ES") = alpha_R I_("CS") quad "(B.4.2)" $

其中 $alpha_R$ 为反向电流传输系数。寄生电荷分成基极—发射极电荷 $Q_("BE")$ 和基极—集电极电荷 $Q_("BC")$：

$ Q_("BE") = tau_F I_S (exp(V_("BE") / V_T)-1) + C_("jE0") integral_0^(V_("BE")) (1 - V / phi_E)^(-m_E) dif V quad "(B.4.3a)" $

$ Q_("BC") = tau_R I_S (exp(V_("BC") / V_T)-1) + C_("jC0") integral_0^(V_("BC")) (1 - V / phi_C)^(-m_C) dif V quad "(B.4.3b)" $

电荷对端电压的微分得到非线性微分电容：

$ C_("BE") = (dif Q_("BE"))/(dif V_("BE")) = (tau_F I_S) / V_T exp(V_("BE")/V_T) + C_("jE0") / (1 - V_("BE")/phi_E)^(m_E) quad "(B.4.4a)" $

$ C_("BC") = (dif Q_("BC"))/(dif V_("BC")) = (tau_R I_S) / V_T exp(V_("BC")/V_T) + C_("jC0") / (1 - V_("BC")/phi_C)^(m_C) quad "(B.4.4b)" $

对于集电极—衬底的寄生结，也可用耗尽层电容近似：

$ C_("CS") = C_("js0") / (1 - V_("SC")/phi_s)^(m_s) quad "(B.4.5)" $

== B.4　双极晶体管反相器

该节讨论使用电阻和 BJT 构成的数字反相器。书中说明，虽然 CMOS 已取代了大多数数字逻辑中的双极器件，但高电流驱动和高压驱动等场合仍可能使用 BJT 组合。

_保留了扫描页的 B.4 公式编号；公式核对与全部变量脚注仍待严格逐行验收。_
