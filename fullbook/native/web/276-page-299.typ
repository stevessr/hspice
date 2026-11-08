// SOURCE PDF 299 / printed 280. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF299")
#align(center)[#text(size:8pt,weight:"bold")[280　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

*例8.1（续）*

译码器的最优尺寸取决于所用逻辑结构、末级驱动负载、每一级的逻辑强度和分支强度。完成单级输入电容反推后，还应核对预译码信号的16路分支负载。不同拆分方式的最优结果不能仅凭门级数直接判断。

== 8.3　静态RAM单元设计

若存储器单元无需周期性时钟或刷新即可在供电期间保持数据，则称为静态存储器。静态RAM（SRAM）通常由双稳态电路及可控的存取通路组成。

=== 8.3.1　静态存储器操作

图8.7(a)的基本SRAM单元由两个交叉耦合的反相器和两个存取晶体管构成。字线决定该单元是否与位线连通；两条互补位线传递数据，提高读写速度并抑制共模干扰。存储节点的一侧保存二进制值，另一侧保存其反值。

#figure8(7)
#align(center)[*图8.7　SRAM单元与双稳态电压传输特性（功能图草稿）*]
