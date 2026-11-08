// SOURCE PDF PAGE 352. Editable source-guided editorial selection, strict page 1:1 not accepted.
#import "../figures/ch9-nonvolatile-ch10-interconnect-native.typ": figure9late,figure10,fig-summary
#set document(title:"数字集成电路第9章·PDF352")
#align(center)[#text(size:8pt,weight:"bold")[333　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

*P9.5*　在原书给定的ROM/EPROM比较条件下，分析热电子注入或浮栅电荷对存储数据的影响，以及读取高电平是否可能造成误判。

*P9.6*　利用图9.4、图9.9等结构，讨论从基本3-LUT到4-LUT时所需的SRAM配置位、传输门层数及相应面积和延迟变化。

*P9.7*　利用图9.16的1T DRAM阵列与电荷共享公式，解释单元电容、位线电容和灵敏放大器的关系，分析最坏差分摆幅。

*P9.8*　对比典型的单管DRAM与其他动态存储结构，说明读取时破坏性与恢复过程的含义。

*P9.9*　从图9.20的ROM阵列出发，根据指定的逻辑值表选择存储晶体管的位置，并构建行列译码。

*P9.10*　图P9.10给出以行列交点晶体管形成的一组ROM逻辑。对电路给出的若干输入组合，列出输出值，并解释读取时的预充与放电过程。

#figure9late(27)
#align(center)[*图P9.10　ROM晶体管阵列习题的结构草图*]

部分习题的长表达式、配套电路晶体管尺寸和问题字样仍需对原扫描逐字重录，当前只保留来源页码与主要设计任务。
