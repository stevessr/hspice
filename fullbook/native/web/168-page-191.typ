// SOURCE PDF PAGE 191 / printed 172. Native logical treatment of D latch.
#import "../figures/ch5-dff-power-native.typ": flipflop-timing, d-master-slave
#set document(title:"第5章 · D锁存器时序与门级实现 · 扫描191页")
#set text(lang:"zh")
= 第5章 · 印刷第172页

== 图5.26　锁存器的时序参数

透明高电平D锁存器主要关注输入到输出传输延迟 $t_("d-q")$。数据在CK高电平期间透传；接近时钟下降沿的数据必须满足该沿附近的建立与保持条件，才能保证锁存结果。

#flipflop-timing()

锁存器的关闭沿是数据被保存的关键时刻，不能把D锁存器的透明窗口误写成边沿采样。

== 图5.27　D锁存器的门级实现

教材用两只输入门和交叉耦合NOR门实现D锁存器。可编辑布尔级功能为：

$Q_("next") = "CK" D + overline("CK") Q$

上式表达高电平透明和低电平保持，不代替图5.27所示物理反馈门网络。

#table(columns:(1fr,1fr,2fr),inset:4pt,table.header([*CK*],[*D*],[*Q后继*]),[0],[X],[保持 $Q$],[1],[0],[0],[1],[1],[1])

== 图5.28　D触发器的与或非门实现

图5.28使用互补时钟控制的两个透明级联锁存器，构成上升沿采样的存储单元；原版为晶体管级AOI结构，当前只给出原生逻辑级重绘。

#d-master-slave()

*二次扫描核验：*图5.26—5.28的图号、D锁存器关闭沿和门级功能正确；版图级晶体管连线未逐管验收。
