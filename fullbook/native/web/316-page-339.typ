// SOURCE PDF PAGE 339 / printed 320; scan-assisted editorial draft.
// Figures editable, original circuit-level wiring and geometry not strictly verified.
#import "../figures/ch9-dram-rom-native.typ": figure9later
#set document(title:"第9章·动态RAM与ROM·PDF339")
#align(center)[#text(size:8pt,weight:"bold")[320　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

*9.4.3　动态RAM的外部特性（续）*

DRAM每行必须在限定时间内至少存取或刷新一次。读、写及刷新之间的周期安排要满足器件对时钟相位、保持时间与预充时间的要求。教材介绍的传统异步DRAM通过行地址选通（RAS）和列地址选通（CAS）控制访问，两者通常使用低有效引脚信号。读写详细时序应以具体芯片数据手册为准。

== 9.5　只读存储器

ROM是非易失性存储器，常用于保存固定信息、控制表和程序代码（固件）。通常不希望数据在系统正常运行中被随意改变。本节从MOS阵列的晶体管连接开始，分析后续可擦写器件的基本概念。

=== 9.5.1　MOS ROM单元阵列

ROM由字线和位线交叉构成。与DRAM的每个交叉点都有一个单元不同，掩膜ROM通过在交叉点上有无晶体管（或者晶体管阈值的不同）来编码“0”和“1”。

#figure9later(19)
#align(center)[*图9.19　基本ROM单元：字线控制位线下拉*]

图9.19的基本NMOS单元在字线升高时接通位线到地的路径，因而把预充后的位线拉低；没有晶体管的交点不会放电，位线保持高电平。阵列通过列选择电路和输出缓冲器输出数字结果。
