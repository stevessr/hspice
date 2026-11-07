// SOURCE PDF PAGE 195 / printed 176
#import "../figures/ch5-flipflops-power-native.typ": short-circuit-current
#set document(title:"第5章 · 图5.30及短路功耗式5.11—5.13 · PDF195")
= 第5章 · 印刷第176页
== 输入过渡期间的短路功耗
当输入缓慢通过反相器转换区，PMOS和NMOS可同时导通。令正向和反向输入过渡时的短路持续时间为 $Delta t_("scr")$ 和 $Delta t_("scf")$：
$ Delta t_("sc")=Delta t_("scr")+Delta t_("scf") $
短路功率由短路平均电流和电源电压决定：
$ P_("sc")=I_("sc") V_("DD") $
#short-circuit-current()
*图5.30*　(a)输入上升、(b)输入下降时的PMOS与NMOS重叠导通区间。图为可编辑电流峰值示意。
一个时钟周期中短路电流的平均贡献为：
$ P_("sc")=(Delta t_("sc")/T) I_("sc,avg") V_("DD")
 =Delta t_("sc") I_("sc,avg") V_("DD") f_("clk") quad "(5.11)" $
原书把短路电流造成的电荷写成等效电容关系，定义短路活动系数 $alpha_("sc")$：
$ P_("sc")=alpha_("sc") C_L V_("DD")^2 f_("clk") quad "(5.12)" $
总动态功耗由转换电容和短路项构成：
$ P_("dynamic")=alpha_(0to1) C_L V_("DD")^2 f_("clk")
 +alpha_("sc") C_L V_("DD")^2 f_("clk") $
$ =(alpha_(0to1)+alpha_("sc")) C_L V_("DD")^2 f_("clk")
 =alpha C_L V_("DD")^2 f_("clk") quad "(5.13)" $
因此，应把活动因子的定义和统计口径与短路项的归一化方式一致处理。将短路功耗忽略只在输入转换足够快、短路电流贡献很小的条件下是合理近似。
