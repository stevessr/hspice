// SOURCE PDF PAGE 194 / printed 175
#set document(title:"第5章 · 例5.6功耗手算与HSPICE模拟 · PDF194")
= 第5章 · 印刷第175页
== 例5.6　手工计算功耗与SPICE比较
*问题：* 设计0.18 μm工艺CMOS反相器，$W_P=800 " nm"$，$W_N=400 " nm"$，输出负载 $C_L=50 " fF"$，平均翻转频率 $f_("avg")=250 " MHz"$，$V_("DD")=1.8 " V"$。忽略寄生电容。比较手算与HSPICE的功耗。
由式（5.9）：
$ P=C_L V_("DD")^2 f_("avg") $
$ = 50 " fF" times (1.8 " V")^2 times 250 " MHz" $
$ =40.5 " μW" $
原书设置输入上升/下降时间约300 ps，测量一个4 ns时钟周期内的电源平均功率。其HSPICE结构包含：
#raw("* Inverter power comparison, 0.18 um example\n.param Supply=1.8\n.lib 'bsim3v3.cmosp18.lib' TT\n.opt scale=0.1u\n.global Vdd Gnd\nVdd Vdd Gnd 'Supply'\n.subckt inv in out\nmp out in Vdd Vdd PMOS1 l=2 w=8\nmn out in Gnd Gnd NMOS1 l=2 w=4\nCload out Gnd 50fF\n.ends\nXinv in out inv\nVin in Gnd pulse(0 'Supply' 1ns 300ps 300ps 1.7ns 4ns)\n.tran 50ps 5ns\n.measure tran avgpwr avg P(Xinv) from=1ns to=5ns\n.end",block:true)
书中的平均功耗读数为 **46.3 μW**，高于40.5 μW的手算约14%。增加的功耗主要与输入转换期间两管短时同时导通的短路电流有关，不能把SPICE结果误记成单纯的 $C_L V_("DD")^2 f$。
下一扫描页将对短路功耗进行定量近似。
