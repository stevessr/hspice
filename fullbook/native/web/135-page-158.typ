// SOURCE PDF PAGE 158 / printed 139
#set document(title:"第4章 · 式4.24与例4.9尺寸比较 · PDF158")
= 第4章 · 印刷第139页

== MOS器件的等效电阻

NMOS和PMOS导通电阻可分别按方块电阻除以宽长比估算：

$ R_N = R_("eqn") L_N/W_N quad "(4.24a)" $

$ R_P = R_("eqp") L_P/W_P quad "(4.24b)" $

例：$R_("eqn")=12.5 " kΩ/□"$，$R_("eqp")=30 " kΩ/□"$；宽度加倍时，等效电阻近似减半。

== 例4.9　CMOS反相器和伪NMOS反相器的比较

给出图4.14的两类反相器，要求尽量小的面积和直流功耗，负载为 $C_L=50 " fF"$，使用0.13 μm工艺参数：

#table(columns:(1.8fr,2.3fr),
[$mu_n, mu_p$],[270、70 cm²/(V·s)],
[$C_("ox")$],[1.6 μF/cm²],
[$V_("TN"),V_("TP")$],[0.4 V、-0.4 V],
[$E_("cN")L_N,E_("cP")L_P$],[0.6 V、2.4 V],
[$v_("sat")$],[8×10⁶ cm/s],
[$V_("DD"),L$],[1.2 V、100 nm],
)

CMOS目标：$t_("PHL")=t_("PLH") < 50 " ps"$，$V_("OH")=1.2 " V"$，$V_("OL")=0$。

伪NMOS目标：$t_("PHL") < 50 " ps"$，$V_("OH")=1.2 " V"$，$V_("OL")=0.1 " V"$。

按 $tau=0.7 R_("eff") C_L$ 近似得到要求 $R_("eff") approx 1.4 " kΩ"$。因此：

$ W_N/L_N = 12.5/1.4 approx 8.75 $

$ W_P/L_P = 30/1.4 approx 21 $

在 $L_N=L_P=0.1 " μm"$ 下：

$ W_N=0.875 " μm", quad W_P=2.1 " μm" $

本页先完成CMOS的尺寸设计，伪NMOS的上拉宽度由下一页继续求解。
