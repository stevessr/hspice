// SOURCE PDF PAGE 333 / printed 314; scan-assisted editorial draft.
// Figures editable, original circuit-level wiring and geometry not strictly verified.
#import "../figures/ch9-dram-rom-native.typ": figure9later
#set document(title:"第9章·动态RAM与ROM·PDF333")
#align(center)[#text(size:8pt,weight:"bold")[314　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

FPGA的使用还有另一种方式：可以将可编程逻辑结构直接嵌入微处理器、存储器及其他逻辑功能块所在的芯片中。系统所需的部分功能可在制造后由CAD软件完成编程。

== 9.4　动态读/写存储器

降低每位存储成本推动了结构更简单、面积更小的动态存储单元。第8章的静态存储单元通常需要4～6个晶体管，并依赖电源维持触发器状态；动态RAM（DRAM）则利用电容中存储的电荷来表示二进制值。由于结泄漏及亚阈值电流，存储电荷会逐渐减小，需要周期性刷新。教材中的刷新周期约为数毫秒量级，具体周期应以工艺及产品规定为准。

动态存储器可以减少单元面积、提高集成密度，但刷新、电荷感测和时序控制也使外围电路更复杂。

图9.12讨论一种从6T SRAM去除PMOS上拉器件后得到的四管动态结构。原来的双稳态上拉行为由预充位线与存取晶体管共同实现。写入高电平后，电荷保持在内部节点电容上，维持另一侧下拉管的状态；读写过程中还存在与位线的电荷共享。

#figure9later(12)
#align(center)[*图9.12　去掉上拉器件的静态RAM单元（原生功能重绘）*]

=== 9.4.1　三管动态单元

图9.13给出3T DRAM：读写端口分开，由不同字线选择。内部节点电容 $C_1$ 保存数据，晶体管尺寸比不再需要满足静态SRAM读稳定性那样严格的条件。
