// SOURCE PDF PAGE 385. Native Typst source-scan editorial selection, not 1:1 complete.
// Printed page 366; line-by-line transcription and source geometry remain unverified.
#import "../figures/ch10-summary-ch11-power-native.typ": fig1028,figp104,figp105,figp106,figp108,fig111,fig112
#set document(title:"第10章章末与第11章电源分布·源PDF385")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[366　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 10.9　习题（P10.12）

*P10.12*　考虑0.13 μm工艺中一条18 mm长的第7层金属导线，采用下列原书条件：

#table(columns:2,inset:4pt,stroke:.35pt,
 [*参数*],[*原书给定*],
 [导线宽度],[0.4 μm],
 [金属厚度],[0.8 μm],
 [同层相邻导线间距],[2 μm],
 [上层金属],[第8层，与第7层局部重叠],
 [材料电阻率],[0.017 Ω·μm],
 [驱动器尺寸],[25×，用于后续分段分析],
 [负载电容],[50 fF])

(a) 计算导线的单位长度电阻和单位长度电容。

(b) 假设驱动器为理想电压源、负载电容为50 fF，估算分布式RC网络的延迟。

(c) 假设导线由25×反相器驱动，再次计算延迟。

(d) 若导线电感约为0.5 pH/μm，评估是否需要把电感纳入延迟模型，并将手算结果与 SPICE 比较。

(e) 去除25×反相器，使用标准公式优化长线缓冲器插入，计算新的导线长度分段与延迟，并与 SPICE 分析对照。

该页只有最后一道习题，原扫描下半页留白。重排时应保留读者笔记空间，避免为了填满页面添加非教材内容。
