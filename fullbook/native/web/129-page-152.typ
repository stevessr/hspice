// SOURCE PDF PAGE 152 / printed 133
#import "../figures/ch4-cmos-continued-native.typ": cmos-example-vtc
#set document(title:"第4章 · 例4.7 CMOS SPICE网表与噪声容限 · PDF152")
= 第4章 · 印刷第133页

== 例4.7　0.18 μm CMOS反相器的SPICE分析（续）

原题参数如下，输入端以 $V_("DD")=1.8 " V"$ 扫描：

#table(columns:(1.5fr,1.6fr,1.5fr),
[$C_("ox")$],[1.0 μF/cm²],[$L$ = 200 nm],
[$V_("TN")$],[0.5 V],[$V_("TP")$ = -0.5 V],
[$E_("cN")L_N$],[1.2 V],[$E_("cP")L_P$ = 4.8 V],
[$v_("sat")$],[8×10⁶ cm/s],[$W_N$ = 400 nm],
[$mu_n$],[270 cm²/(V·s)],[$W_P$ = 800 nm],
[$mu_p$],[70 cm²/(V·s)],[$V_("DD")$ = 1.8 V],
)

书中的HSPICE示例输入（型号名称与库文件路径沿用原书）：

#raw("*CMOS Inverter Example\n*Set supply and library\n.param Supply=1.8\n.include 'bsim3v3.cmosp18.lib'\n.opt scale=0.1u\n.global Vdd Gnd\nVdd Vdd Gnd 'Supply'\n*Top level simulation netlist\nmp out in Vdd Vdd PMOS1 l=2 w=8 ad=0 pd=0 as=0 ps=0\nmn out in Gnd Gnd NMOS1 l=2 w=4 ad=0 pd=0 as=0 ps=0\nVin in Gnd 'Supply'\n*Simulation\n.dc Vin 0 'Supply' 'Supply/50'\n.plot dc V(out)\n.end",block:true)

#cmos-example-vtc()
*例4.7 CMOS VTC*：原图标注 $V_("IL")=0.626 " V"$、$V_S=0.8 " V"$、$V_("IH")=0.909 " V"$；黑色曲线为依据原图交点和趋势绘制的原生编辑曲线，不代表原始 SPICE 数据点。

书中根据SPICE曲线读取：

#table(columns:(1fr,1.1fr,1fr,1.1fr),
[$V_("OH")$],[1.8 V],[$V_("OL")$],[0 V],
[$V_("IL")$],[0.626 V],[$V_("IH")$],[0.909 V],
[$V_S$],[0.8 V],[],[],
)

所以：

$ "NM_H" = 1.8 - 0.909 = 0.891 " V" $

$ "NM_L" = 0.626 - 0 = 0.626 " V" $

这是原书所列仿真模型的结果，非普适工艺常数。
