// SOURCE PDF 322 / printed 303. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第9章·存储器设计中的其他课题·PDF322")
#align(center)[#text(size:8pt,weight:"bold")[303　数字集成电路分析与设计 · 第9章]]
#line(length:100%,stroke:.55pt)

#set document(title:"第9章·存储器设计中的其他课题·PDF322")
#align(center)[#text(size:17pt,weight:"bold")[第9章　存储器设计中的其他课题]]

*本章提要*　9.1绪论；9.2内容寻址存储器；9.3现场可编程门阵列；9.4动态读/写存储器；9.5只读存储器；9.6 EPROM与EEPROM；9.7 Flash存储器；9.8 FRAM；9.9小结；9.10参考文献；9.11习题。

## 9.1　绪论

存储器在数字集成电路的总面积中占据越来越大的比例。将存储器与逻辑模块集成在同一芯片上，称为嵌入式存储器。对处理器、图形芯片与需要高数据传输率的系统而言，片上存储器可以减少外部互连带来的延迟、功耗、封装和带宽限制。

半导体存储器可按存取结构、静态/动态工作方式、是否需刷新、断电后数据是否保留等分类。高密度存储器的每位成本尤为重要；在可靠性、速度、功耗和密度方面，不同存储技术形成不同权衡。

教材比较了6T SRAM、动态电容型存储器以及其他非易失性技术，并说明选择技术时需要同时考虑容量、单元面积和工艺额外步骤。此页的技术市场数据属于原书出版时的背景描述，不代表当前市场份额。
