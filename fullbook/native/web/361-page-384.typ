// SOURCE PDF PAGE 384. Native Typst source-scan editorial selection, not 1:1 complete.
// Printed page 365; line-by-line transcription and source geometry remain unverified.
#import "../figures/ch10-summary-ch11-power-native.typ": fig1028,figp104,figp105,figp106,figp108,fig111,fig112
#set document(title:"第10章章末与第11章电源分布·源PDF384")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[365　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#figp106()
#align(center)[*图P10.6　多分支RC树（电路节点的概念重绘）*]

== 10.9　习题（P10.7—P10.11）

*P10.7*　针对0.18 μm工艺中的第5层金属导线，比较短线、中等长度线和长线：(a) 若线阻对延迟贡献小于5%，最大的“短导线”有多长？(b) 不考虑缓冲器，比较中等长度导线需要考虑的电容；(c) 长线既考虑电阻又考虑电容，计算不插入缓冲器的长度限制；(d) 计算长线最优插入缓冲器。

*P10.8*　图P10.8给出两条互相耦合的线网。其对地电容分别为50 fF和60 fF，二者耦合电容为100 fF。(a) 侵略者线网变化1.8 V时估计受害者的噪声峰值；(b) 如果侵略者与受害者反向变化，估计受害者时延分析的等效负载。

#figp108()
#align(center)[*图P10.8　100 fF耦合电容连接的两线网（可编辑示意）*]

*P10.9*　对0.13 μm工艺的第8层金属导线，利用给定工艺的典型数值估算单位长度电容的上下界；线长及邻线间距改变时检验计算的可用范围。

*P10.10*　线网上噪声注入的最大值取决于驱动器的驱动能力、侵略者的上升时间，以及串扰电容占总电容的比例。基于P10.8构造简化RC模型分析脉冲幅度。

*P10.11*　对比在0.18 μm和0.13 μm工艺中，10 mm导线所需的中继缓冲器数量，使用顶层金属与标准工艺参数计算。
