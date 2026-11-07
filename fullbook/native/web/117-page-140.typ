// SOURCE PDF PAGE 140 / printed 121
#import "../figures/ch4-inverter-native.typ": inverter-vtc
#set document(title:"第4章 · 例4.3 SPICE VTC与噪声容限结果 · PDF140")
= 第4章 · 印刷第121页
== 例4.3　SPICE模型与手工分析的比较（续）
在0.18 μm器件的SPICE模拟后，通过扫描输入 $V_("in")$ 并读取输出电压得到电阻负载反相器的VTC。对原书图中的斜率 $-1$ 两点和切换点，结果如下：
#table(columns:(1.6fr,1.4fr),table.header([*量*],[*模型示例值*]),
 [$V_("OL")$],[0.085 V],
 [$V_("IL")$],[0.558 V],
 [$V_("IH")$],[0.972 V],
 [$V_S$],[0.78 V],
 [$V_("OH")$],[1.8 V],
)
#inverter-vtc(title:"例4.3 SPICE电压传输曲线的编辑示意")
按教材用单位增益点定义：
$ "NM_L" = V_("IL")-V_("OL") = 0.558 - 0.085 = 0.473 " V" $
$ "NM_H" = V_("OH")-V_("IH") = 1.8 - 0.972 = 0.828 " V" $
在切换点 $V_S approx 0.78 " V"$ 时，源扫描还通过负载线与NMOS饱和电流等式建立手工计算，并比较接近程度。
这些数值属于例4.3给定的0.18 μm工艺模型条件，不可当作任意工艺中通用的反相器指标。
_图上的斜率、纵横轴刻度和曲线点是原生趋势示意，非原HSPICE仿真输出的逐点复刻。_
