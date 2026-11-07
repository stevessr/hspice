// SOURCE PDF PAGE 185 / printed 166
#import "../figures/ch5-complex-sequential-native.typ": sr-nor
#set document(title:"第5章 · 例5.4 NOR SR锁存器尺寸与NAND SR引言 · PDF185")
= 第5章 · 印刷第166页
== 例5.4　用或非门设计SR锁存器
*问题：* 在0.13 μm CMOS工艺中设计一只NOR SR锁存器，使S→Q和R→Q反相输出的传播延迟约为400 ps。输出Q与反相Q各负载100 fF，最小沟道长度L=100 nm。

*解：* 使用交叉耦合的两只二输入NOR门。为了获得目标传播延迟，原书将400 ps平均分到两次逻辑门转换，每次约为200 ps。

按等效电阻模型：
$ t=0.7 R_("eqn") (L/W) C_L $
代入 $R_("eqn")=12.5 " kΩ/□"$、$C_L=100 " fF"$、目标200 ps：
$ 200 " ps"=0.7 times 12.5 " kΩ" times (L/W) times 100 " fF" $
$ W/L approx 4.4 $
当 $L=100 " nm"$：
$ W_N=440 " nm" $
考虑NOR的串联PMOS支路，采用上拉器件的经验尺寸近似可得：
$ W_P=1.76 " μm" $
此处宽度对应原题工艺、负载和延迟假设，不能直接用于其他工艺。

== 用与非门构成的SR锁存器
另一种结构使用两只NAND门交叉耦合，见图5.18。输入为低电平有效，逻辑与上述NOR锁存器互补。该结构输入S/R同时为低时属于禁止状态，详细真值表在下一页。
