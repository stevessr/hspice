// Source PDF page 082 / printed 63: consolidated equations and full gate capacitance matrix.
#set document(title:"第2章 · MOS短沟道与电容公式汇总 · PDF082")
#set text(lang:"zh")
= 第2章 · 印刷第63页

== 2.9　小结（续）：工作区和短沟道模型

截止近似下 $V_("GS")<V_T$，传统长沟道手算忽略亚阈值漏电。对于深亚微米速度饱和模型，令 $V_("ov")=V_("GS")-V_T$：

$ V_("Dsat") = (V_("ov") E_c L)/(V_("ov")+E_c L) $

若 $V_("DS") >= V_("Dsat")$，使用：

$ I_("DS") = W v_("sat") C_("ox") V_("ov")^2/(V_("ov")+E_c L) $

否则使用：

$ I_("DS") = W/L (mu_e C_("ox"))/(1+V_("DS")/(E_c L))
  (V_("ov")-V_("DS")/2)V_("DS") $

对于亚阈值区，原书再次列出指数型电流关系：

$ I_("sub") = I_s exp((q(V_("GS")-V_T-V_("offset")))/(n k T))
   (1-exp(-(q V_("DS"))/(k T))) $

== 不同工作区的理想栅电容分配

#table(columns:(1fr,1.35fr,1.35fr,1.35fr),
 table.header([*电容*],[*截止区*],[*线性区*],[*饱和区*]),
 [$C_("GS")$],[0],[$(1/2) C_("ox") W L$],[$(2/3) C_("ox") W L$],
 [$C_("GD")$],[0],[$(1/2) C_("ox") W L$],[0],
 [$C_("GB")$],[$C_("ox") W L$],[0],[0],
)

== 结电容和总端口电容

结电容的典型形式：

$ C_j = (C_("j0") A)/(1-V_j/phi_B)^m $

$ C_j = (C_("jb")(A_b + A_("sw")))/(1-V_j/phi_B)^(m_j) $

$ C_j = K_("eq") C_("jb")(Y+x_j)W = C_j' W $

原书还列出单位宽度下 $C_("gs")$、$C_("gd")$、$C_("gb")$、$C_("sb")$、$C_("db")$ 等综合电容随工作区变化的公式。其中 $C_("ol")$ 需要加入栅—源与栅—漏支路；源漏扩散电容则按结的偏置与面积估算。

#table(columns:(1fr,1.3fr,1.3fr,1.3fr),
 table.header([*单位宽度项目*],[*截止*],[*线性*],[*饱和*]),
 [$C_("gs")$],[$C_("ol")$],[$C_("ol")+(1/2) C_g$],[$C_("ol")+(2/3) C_g$],
 [$C_("gd")$],[$C_("ol")$],[$C_("ol")+(1/2) C_g$],[$C_("ol")$],
 [$C_("gb")$],[器件偏置相关],[0],[0],
 [$C_("sb")$],[$C_("jsb")$],[$C_("jsb")+alpha C_("jc")$],[$C_("jsb")+beta C_("jc")$],
 [$C_("db")$],[$C_("jdb")$],[$C_("jdb")+alpha C_("jc")$],[$C_("jdb")+beta C_("jc")$],
)

_小结表格中的变量需保留原书归一化约定；其中 $alpha$、$beta$ 来自沟道分配，详细推导还须结合第3章复核。_
