// SOURCE PDF PAGE 215 / printed 196; equations 6.7–6.9.
#import "../figures/ch6-delay-capacitance-native.typ": load-components
#set document(title:"第6章 · 门负载与输入栅电容 · PDF215")
#set text(lang:"zh")
= 第6章 · 印刷第196页

== 负载电容的组成

一个门的输出负载分为自身寄生电容、互连电容以及所驱动后级门的输入电容：

$ C_("load") = C_("self") + C_("wire") + C_("fanout") quad "(6.7)" $

#load-components()

*图6.7*　门负载电容的组成部分；输出分支可连接多个后级，扇出电容是后级输入电容之和。

== 6.3.1　门扇出电容

$ C_("fanout") = sum C_G $

考虑CMOS反相器NMOS/PMOS两种栅电容以及重叠电容后：

$ C_G = (C_("ox") L + 2 C_("ol"))(W_n + W_p) quad "(6.8)" $

对于教材采用的0.13 μm工艺参数：$C_("ox") L = 1.6 " fF/μm"$、$C_("ol")=0.25 " fF/μm"$，则：

$ C_g = 1.6 " fF/μm" + 2 (0.25 " fF/μm") approx 2 " fF/μm" quad "(6.9)" $

此处的 $C_g$ 是单位宽度输入电容参数，而非一只特定尺寸反相器的总输入电容。

_式（6.7）—（6.9）和单位已对照扫描，图6.7的全部器件连接和扇出分支仍待原位复刻。_