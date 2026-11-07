// SOURCE PDF PAGE 142 / printed 123
#import "../figures/ch4-mos-loads-native.typ": nmos-load
#import "../figures/ch4-inverter-native.typ": iv-load-line, inverter-vtc
#set document(title:"第4章 · NMOS饱和增强型负载、图4.10和尺寸比 · PDF142")
= 第4章 · 印刷第123页
== 图4.10　NMOS反相器（饱和增强型负载）
#nmos-load()
*图4.10(a) 饱和增强型NMOS负载反相器的两管连接。*
#iv-load-line()
*图4.10(b) 两个NMOS的电流与负载线；图4.10(c)给出电压传输特性。*
== MOS反相器的比例因子
把驱动晶体管的跨导系数与负载晶体管的跨导系数之比定义为：
$ K_R = k_("invert")/k_("load")
 = (k'(W/L)_I)/(k'(W/L)_L)
 = ((W/L)_I)/((W/L)_L) quad "(4.10)" $
适当增大 $K_R$ 可降低输出低电平 $V_("OL")$，但增加反相器版图面积。负载上拉器件的高电平受阈值电压限制，输出不能达到理想 $V_("DD")$。
== 负载NMOS的体效应
在饱和增强型负载中，负载栅漏短接，衬底偏置因输出端电位而变化。负载器件的阈值：
$ V_("TL") = V_("T0") +
 gamma (sqrt(V_("SB")+2 abs(phi_F)) - sqrt(2 abs(phi_F))) quad "(4.11)" $
其中 $V_("SB") = V_("OH")$。
举例若 $V_("DD")=1.2 " V"$ 且 $V_("TL")=0.45 " V"$，得到近似输出高电平 $V_("OH")=0.75 " V"$，不足以达到后级可靠的高逻辑电平。
_图4.10矢量为工作原理图，三子图尺寸及真实VTC待精修。_
