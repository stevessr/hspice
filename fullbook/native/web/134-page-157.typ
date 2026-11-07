// SOURCE PDF PAGE 157 / printed 138
#import "../figures/ch4-delay-tristate-native.typ": inverter-delay
#set document(title:"第4章 · 图4.15时序模型与式4.22—4.23 · PDF157")
= 第4章 · 印刷第138页

== 反相器的尺寸确定：简化时序模型

为分析尺寸和传输延迟的关系，将器件导通电阻近似为有效电阻 $R_("eff")$，由其驱动输出负载电容 $C_L$。图4.15(a)定义输入与输出都经过其幅度50%点时的传播延迟：输出下降为 $t_("PHL")$，输出上升为 $t_("PLH")$。

#inverter-delay()

*图4.15*　(a) 输入输出阶跃波形；(b) NMOS下拉和PMOS上拉分别采用等效RC模型。

对于输出下降，$R_("eff")=R_N$：

$ V_("out")(t) = V_("DD") e^(-t/(R_N C_L)) quad "(4.22a)" $

对于输出上升，$R_("eff")=R_P$：

$ V_("out")(t) = V_("DD") (1-e^(-t/(R_P C_L))) quad "(4.22b)" $

在两种情况下，50%传播延迟均满足：

$ tau = 0.69 R_("eff") C_L quad "(4.22c)" $

增加MOS器件宽长比 $W/L$ 会减小等效导通电阻，并缩短相应输出边沿的传播延迟，但也增加输入栅电容和版图面积。

原书给出的HSPICE经验等效方块电阻：

$ R_("eqn")=12.5 " kΩ/□" quad "(4.23a)" $

$ R_("eqp")=30 " kΩ/□" quad "(4.23b)" $

其中前者针对NMOS、后者针对PMOS。教材脚注指出，这是对0.35、0.18及0.13 μm历史工艺的近似，不是任意现代工艺的标准值。
