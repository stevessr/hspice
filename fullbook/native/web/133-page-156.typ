// SOURCE PDF PAGE 156 / printed 137
#import "../figures/ch4-cmos-continued-native.typ": five-regions
#set document(title:"第4章 · 例4.8伪NMOS SPICE与4.8尺寸确定 · PDF156")
= 第4章 · 印刷第137页

== 例4.8　用SPICE设计伪NMOS反相器（续）

由式（4.21），在 $V_("DD")=1.8 " V"$、$V_("OL")=0.065 " V"$ 下计算得到：

$ W_N/W_P approx 2.0 $

若取 $W_P=400 " nm"$，则 $W_N=800 " nm"$。这一尺寸组合可达到题目指定的低电平近似目标。

源书HSPICE输入如下（采用原书的工艺库命名）：

#raw("*Pseudo-NMOS Inverter Example\n*Set supply and library\n.param Supply=1.8\n.include 'bsim3v3.cmosp18.lib'\n.opt scale=0.1u\n.global Vdd Gnd\nVdd Vdd Gnd 'Supply'\n*Top level simulation netlist\nmp out Gnd Vdd Vdd PMOS1 l=2 w=4 ad=0 pd=0 as=0 ps=0\nmn out in Gnd Gnd NMOS1 l=2 w=8 ad=0 pd=0 as=0 ps=0\nVin in Gnd 'Supply'\n*Simulation\n.dc Vin 0 'Supply' 'Supply/50'\n.plot dc V(out)\n.end",block:true)

原书给出的模拟结果：

$ V_("OH") = 1.8 " V", quad V_("OL") = 0.065 " V" $

书中的伪NMOS VTC在输出低电平附近有一条接近0.065 V的水平平台；它不能像理想CMOS反相器一样得到接近0 V的稳定低电平。

== 4.8　反相器的尺寸确定

反相器尺寸确定就是选择上拉和下拉晶体管的 $W/L$，满足时序、功耗、面积和噪声容限等要求。通常一个或两个约束成为最终尺寸的主要决定因素。

对CMOS反相器，由于待机静态功耗较小，尺寸优化通常重点考虑时序；对伪NMOS反相器，则必须首先考虑所需 $V_("OL")$ 及噪声容限，并核对静态功耗。

接下来教材将比较CMOS和伪NMOS的尺寸设计。
