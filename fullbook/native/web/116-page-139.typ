// SOURCE PDF PAGE 139 / printed 120
#set document(title:"第4章 · 例4.2结果和例4.3 SPICE验证 · PDF139")
= 第4章 · 印刷第120页
== 例4.2　电阻负载的噪声容限（续）
按上一页所给 $k'=430 " μA/V"^2$、$W/L=2$、$R_L=20 " kΩ"$、$V_T=0.4 " V"$ 和 $V_("DD")=1.2 " V"$：
$ V_("OL") approx V_("DD")/(1 + k R_L (V_("DD")-V_T)) approx 0.08 " V" $
$ V_("IL") = V_T + 1/(k R_L) approx 0.46 " V" $
$ V_("IH") = V_T + sqrt((8 V_("DD"))/(3k R_L)) - 1/(k R_L)
 approx 0.77 " V" $
据此计算：
$ "NM_L" = V_("IL")-V_("OL") = 0.38 " V" $
$ "NM_H" = V_("OH")-V_("IH") = 0.43 " V" $
以上计算基于饱和区与线性区的近似条件，原书要求检查假设是否满足。
== 例4.3　SPICE模型与手工分析的比较
原书使用0.18 μm CMOS工艺：$R_L=30 " kΩ"$，$W=400 " nm"$，$L=200 " nm"$，$k'=270 " μA/V"^2$、$C_("ox")=1 " μF/cm²"$、$V_T=0.5 " V"$、$E_c L=1.2 " V"$、$V_("DD")=1.8 " V"$、$v_("sat")=8 times 10^6 " cm/s"$。
源扫描给出的SPICE网表骨架：
#raw("* Resistive-load inverter example\n.param Supply=1.8\n.include 'bsim3v3.cmosp18.lib'\n.opt scale=0.1u\n.global Vdd Gnd\nVdd Vdd Gnd 'Supply'\nRup Vdd out 30k\nmn out in Gnd Gnd NMOS1 l=2 w=4 ad=0 pd=0 as=0 ps=0\nVin in Gnd 'Supply'\n.dc Vin 0 'Supply' 'Supply'/50\n.plot dc V(out)\n.end",block:true)
_原书实例的器件尺寸、参数和网表结构已核对；不同SPICE版本的库路径/模型名仍以实际库文件为准。_
