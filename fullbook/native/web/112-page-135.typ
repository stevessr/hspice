// SOURCE PDF PAGE 135 / printed 116
#import "../figures/ch4-inverter-native.typ": resistor-load-nmos, iv-load-line, inverter-vtc
#set document(title:"第4章 · 图4.9电阻负载NMOS及式4.4 · PDF135")
= 第4章 · 印刷第116页
== 图4.9　电阻负载NMOS反相器
#resistor-load-nmos()
*图4.9(a) 电阻负载反相器的NMOS、电阻 $R_L$ 和输出端电容 $C_T$。*
#iv-load-line()
*图4.9(b) 漏极特性曲线和负载线。* 不同 $V_("GS")=V_("in")$ 的器件曲线与负载线交点决定对应的稳态输出 $V_("out")=V_("DS")$。
#inverter-vtc(title:"图4.9(c) 电压传输特性")
在静态分析时，电阻电流和NMOS漏极电流相等。从欧姆定律可知，负载线在 $V_("DS")=0$ 与 $V_("DD")$ 两端的截距分别为 $V_("DD")/R_L$ 和0。
在电流为零的状态，输出高电平为 $V_("OH")$；当NMOS导通并下拉输出时，稳态值由负载线与相应漏电流曲线的交点得到。
当输入足够高、输出处于低电平时，二者电流满足：
$ I_("DS") = I_R = (V_("DD")-V_("OL"))/R_L quad "(4.4)" $
式（4.4）是后续近似求解 $V_("OL")$ 的起点。原书指出除高低输出电平外，还需在VTC上确定 $V_("IL")$、$V_("IH")$ 和切换点 $V_S$。
_图4.9为原生可编辑示意；原书三幅子图中器件参数、曲线准确数量及坐标仍需核对。_
