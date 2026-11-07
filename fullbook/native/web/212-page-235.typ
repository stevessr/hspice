// SOURCE PDF PAGE 235 / printed 216. Exact equation 6.24 and 6.25 and FO condition.
#import "../figures/ch6-path-sizing-native.typ": fig626
#set document(title:"第6章 · NAND NOR本征延迟与混合路径等扇出优化 · PDF235")
#align(center)[#text(size:8pt,weight:"bold")[216　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.5pt)

扇出很合适。同样，合适的 $f$ 值将使每级延迟相同。

与非门和或非门的本征时间常量可以按以下方式得出。考虑图6.4所示的器件尺寸，可以计算有效输出电阻和输入电容，然后把这两个参数相乘：

#align(center)[$tau_("nand") = R_("eff") C_("in") = R_("eqn") (L_n/W_n) 4W_n C_g = 4R_("eqn") C_g L_n$]

#align(center)[$tau_("nor") = R_("eff") C_("in") = R_("eqn") (L_n/W_n) 5W_n C_g = 5R_("eqn") C_g L_n quad "(6.24)"$]

数字电路中的典型逻辑路径可以含有多种类型的门。考虑图6.26所示情况的最佳延迟。总延迟可以给出如下：

#align(center)[$"总延迟" = tau_("nand") ((C_(j+1))/(C_j)+gamma_("nand")) + tau_("inv") ((C_(j+2))/(C_(j+1))+gamma_("inv")) + tau_("nor") ((C_(j+3))/(C_(j+2))+gamma_("nor")) quad "(6.25)"$]

通过 $j$ 和 $j+1$ 这两级的延迟为：

#align(center)[$D_(j+1) = tau_("nand") ((C_(j+1))/(C_j)+gamma_("nand")) + tau_("inv") ((C_(j+2))/(C_(j+1))+gamma_("inv"))$]

#fig626()
#align(center)[*图6.26　逻辑路径中串联的混合门*]

对于最小延迟，求对 $C_(j+1)$ 的导数：

#align(center)[$(partial D_(j+1))/(partial C_(j+1)) = tau_("nand") (1/C_j) - tau_("inv") (C_(j+2)/C_(j+1)^2)=0$]

#align(center)[$therefore tau_("nand") ((C_(j+1))/(C_j)) = tau_("inv") ((C_(j+2))/(C_(j+1)))$]

#align(center)[$therefore tau_("nand") "FO"_j = tau_("inv") "FO"_(j+1)$]

其中，$"FO"_j=C_(j+1)/C_j$，$"FO"_(j+1)=C_(j+2)/C_(j+1)$。由此，得出了另一个重要的结果。对于这种情况，当一个给定门的 $tau times "FO"$ 等于下一级门的 $tau times "FO"$ 时延迟最小。也就是说，要满足最佳的解决办法，门延迟并非必须相等，而延迟的扇出部分必须相等。

为了支持这个结论，如果现在把上面的分析用于下两级门，将可得到：

#align(center)[$D_(j+2)=tau_("inv") ((C_(j+2))/(C_(j+1))+gamma_("inv")) + tau_("nor") ((C_(j+3))/(C_(j+2))+gamma_("nor"))$]

#align(center)[$(partial D_(j+2))/(partial C_(j+2)) = tau_("inv")(1/C_(j+1))-tau_("nor")(C_(j+3)/C_(j+2)^2)=0$]

#align(center)[$therefore tau_("inv") ((C_(j+2))/(C_(j+1))) = tau_("nor") ((C_(j+3))/(C_(j+2)))$]