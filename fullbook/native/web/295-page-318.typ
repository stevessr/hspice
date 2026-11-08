// SOURCE PDF 318 / printed 299. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第8章·半导体存储器设计·PDF318")
#align(center)[#text(size:8pt,weight:"bold")[299　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

== 8.6　小结

第8章应用前面逻辑门、传输管、延迟、功耗与噪声容限知识，讨论SRAM存储器设计。主要内容包括行列译码、6T存储单元、读写晶体管尺寸、字线和位线电容、列预充、写驱动、灵敏放大器、复制时序和阵列分块。规则阵列使存储器适合用CAD工具自动生成，称为存储器编译器。

== 8.7　参考文献

1. B. Prince, *Emerging Memories: Technologies and Trends*, Kluwer, 2002.
2. K. Itoh, *VLSI Memory Chip Design*, Springer-Verlag, 2001.
3. J. Rabaey, A. Chandrakasan, B. Nikolic, *Digital Integrated Circuits*, 2nd ed., Prentice-Hall, 2003.
4. S. M. Kang, Y. Leblebici, *CMOS Digital Integrated Circuits*, 3rd ed., McGraw-Hill, 2003.
5. H. Veendrick, *Deep-Submicron CMOS ICs*, 2nd ed., Kluwer, 2000.
6. J. P. Uyemura, *CMOS Logic Circuit Design*, Kluwer, 1999.
7. B. Razavi, *Design of Analog CMOS Integrated Circuits*, McGraw-Hill, 2001.

== 8.8　习题

*P8.1*　比较ROM、SRAM、DRAM、EPROM、EEPROM和Flash的存储结构与适用应用。

*P8.2*　依据图8.12绘出6T SRAM的等效电路，估计单元尺寸；题设接触孔尺寸为 $4lambda times 4lambda$。

*P8.3*　使用NAND2、NAND3、NAND4与反相器设计8位地址的两级译码器，解释选择两级的理由，并求译码分支强度。

*P8.4–P8.6*　围绕图8.8的SRAM单元开展读稳定性、写操作和器件尺寸设计。具体每一个晶体管尺寸与扫描版题设还须逐项核对。
