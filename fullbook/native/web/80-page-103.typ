// PDF scan 103 / printed84. Equations3.3–3.9 carefully source checked.
#set document(title:"第3章 · LEVEL1体效应阈值和沟道电流公式3.3–3.9 · PDF103")
#set text(lang:"zh")
= 第3章 · 印刷第84页

== 3.5　SPICE MOS LEVEL 1 器件模型（续）

首先，由衬底掺杂参数 NSUB 计算表面势参数：

$ "PHI" = 2 (k T)/q ln("NSUB"/n_i) quad "(3.3)" $

利用栅氧化层厚度 TOX 计算单位面积氧化层电容：

$ C_("ox") = epsilon_("ox")/"TOX" quad "(3.4)" $

然后由NSUB和 $C_("ox")$ 计算体效应参数：

$ "GAMMA" = sqrt(2 epsilon_("si") q "NSUB")/C_("ox") quad "(3.5)" $

最后求偏置相关的阈值电压：

$ V_T = "VTO" + "GAMMA" (sqrt("PHI" - V_("BS")) - sqrt("PHI")) quad "(3.6)" $

增强型NMOS器件的 VTO 为正，而PMOS器件的 VTO 为负。沟道参数 KP 可直接给出；若模型未提供 KP，则根据低场迁移率 UO 估算：

$ "KP" = "UO" times C_("ox") quad "(3.7)" $

== 线性区和饱和区的电流

线性区：

$ I_("DS") = W_("eff")/L_("eff") ("KP"/2)
 [2 (V_("GS") - V_T) V_("DS") - V_("DS")^2]
 (1 + "LAMBDA" times V_("DS")) quad "(3.8)" $

其条件为 $V_("GS") >= V_T$、$V_("DS") <= V_("GS") - V_T$。

饱和区：

$ I_("DS") = W_("eff")/L_("eff") ("KP"/2)
 (V_("GS") - V_T)^2 (1 + "LAMBDA" times V_("DS")) quad "(3.9)" $

其条件为 $V_("GS") >= V_T$、$V_("DS") >= V_("GS") - V_T$。

原书指出，在两个区都使用因子 $(1+"LAMBDA" V_("DS"))$，使两个区域在分界点保持电流连续，对SPICE数值方法有实际意义。

== 寄生电容参数

MOS覆盖电容的模型参数为CGSO、CGDO、CGBO，分别表示栅源、栅漏、栅衬底重叠电容；MOS氧化电容还由TOX与器件尺寸决定。LEVEL 1电容模型属于传统Meyer近似，不保证电荷严格守恒。

源漏与体区的pn结电容由CJ、CJSW、MJ、MJSW和PB等参数以及器件面积周长共同确定，下一页给出总电容式（3.10）。

_式（3.3）至（3.9）和源书参数大写拼写均已对照第103页；全文版式尚待严密验收。_
