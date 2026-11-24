// SOURCE PDF 321 / printed 302. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第8章·半导体存储器设计·PDF321")
#align(center)[#text(size:8pt,weight:"bold")[302　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

*设计题2　在0.18 µm工艺中设计SRAM单元和读/写电路*

该题继续研究64K SRAM单元与列I/O的设计。阵列具有256列；读输出采用64个感测放大器，每一个感测放大器从四个候选列中选择一个。

(a) 确定6T单元的晶体管尺寸，使读操作时内部节点不发生错误翻转，写操作时能够将节点压低到足以翻转的电压。优先使用最小化面积的整数晶体管尺寸。

(b) 计算单元交叉耦合反相器的转换阈值，并使用HSPICE进行DC验证与尺寸调整。

(c) 计算读期间单元可从位线汲取的电流，可使用变化开始和结束时的平均值估算。

(d) 计算连接256行单元的位线电容，包含晶体管结电容、互连及接触孔。

(e) 计算将位线放电180 mV所需时间。

(f) 按图8.20设计灵敏放大器，评估在给定偏置电流、输出电容和输出摆幅下的感测延迟。

(g) 计算写操作的位线下拉电阻，使写入时间接近读取时间。

(h) 设计预充上拉器件，要求下一次读周期之前位线误差足够小；原书建议以约两倍下拉尺寸作为预充初值。

(i) 使用SPICE检验所有结果。

这组题构成一个从单元DC稳定性到读写动态延迟、最终由HSPICE验证的完整设计流程。
