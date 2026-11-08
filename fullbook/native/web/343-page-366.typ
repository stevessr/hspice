// SOURCE PDF PAGE 366. Scan-guided editable Typst selection; NOT full 1:1 acceptance.
// Original source scan: printed page 347; images/figures are editable abstractions.
#set document(title:"第10章·连线设计·源扫描PDF366")
#set text(size:7.2pt)
#show par: set par(leading:2.3pt,spacing:3.4pt)
#align(center)[#text(size:7.5pt,weight:"bold")[347　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

=== 例10.4　缓冲器插入举例

问题：沿用例10.3中长20 mm的第5层金属导线，用最优的缓冲器插入减小时延，计算新的总延迟。

#table(columns:2,stroke:.4pt,inset:3pt,
 [*源扫描给定参数*],[*数值*],
 [$R_"int"$],[54 mΩ/μm],
 [$C_"int"$],[0.1 fF/μm],
 [$L$],[20,000 μm],
 [$R_"eqn"$],[12.5 kΩ/□],
 [$C_G$],[2 fF/μm],
 [$C_"eff"$],[1 fF/μm],
 [$W$],[0.2 μm],
 [$beta$],[2],
)

由式（10.9）和（10.10）求得：

#align(center)[$N = sqrt((R_"int" C_"int" L^2)/(2 R_"eqn" (C_G+C_J) (1+beta))) approx 6.9 approx 7$]
#align(center)[$M = sqrt((R_"eqn" C_"int")/(C_G (1+beta) R_"int")) approx 140$]

缓冲器等效电阻、输出自身电容和下级输入电容分别为：

#align(center)[$R_"eff" = (12.5 "kΩ")/140 approx 90 "Ω"$]
#align(center)[$C_"self" = C_"eff" (2W+W) 140 = 84 "fF"$]
#align(center)[$C_"fanout" = C_G (2W+W) 140 = 168 "fF"$]

在教材绘出的单段RC模型中，导线等效电阻为154 Ω，两组导线电容均为143 fF：

#align(center)[$tau_"Elmore" = 7 ((90 "Ω") (84 "fF" + 143 "fF") + (90 "Ω" + 154 "Ω") (143 "fF" + 168 "fF")) approx 0.67 "ns"$]

由此教材结论：*插入缓冲器后总延迟约减小一半*。以上为原书例题数值，不代表使用另一个工艺模型重新仿真。

== 10.4　连线的耦合电容

本节将单位长度导线电容拆分为对地、区域、侧向与边缘部分，建立手算的一阶电容模型。原书此前采用的0.2 fF/μm典型值，需要解释其物理来源及适用条件。
