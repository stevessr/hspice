// SOURCE PDF 319 / printed 300. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第8章·半导体存储器设计·PDF319")
#align(center)[#text(size:8pt,weight:"bold")[300　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

*习题P8.4–P8.6（续）*

进一步使用HSPICE模拟SRAM单元在最坏读、写条件下的内部节点电平，检查所选晶体管比例是否能抵抗噪声与工艺变化。

*P8.6（衍生题）*　把六管SRAM的两个上拉晶体管替换为100 MΩ级的多晶硅电阻，分析得到的四管单元的读写方式、内部节点的恢复，以及是否属于静态存储器。

*P8.7　灵敏放大器设计*

基于图8.20并采用0.18 µm工艺，讨论感测放大器在500 ps内驱动50 fF负载所需的偏置电流、检测100 mV位线摆幅时输入晶体管的尺寸、适合选用的图8.13预充结构、输入的初始电压、工作点和晶体管比例。

*设计题1　在0.18 µm工艺中设计译码器*

题目以1K×64位SRAM为目标。256×256的6T存储器阵列由10位地址访问：高8位控制256条字线，低2位控制4:1列多路选择器。每条字线覆盖四个64位字。

#figure8(6)
#align(center)[*图D8.1　SRAM阵列、地址与输出选择（结构重绘）*]
