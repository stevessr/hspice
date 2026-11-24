// SOURCE PDF PAGE 382. Native Typst source-scan editorial selection, not 1:1 complete.
// Printed page 363; line-by-line transcription and source geometry remain unverified.
#import "../figures/ch10-summary-ch11-power-native.typ": fig1028,figp104,figp105,figp106,figp108,fig111,fig112
#set document(title:"第10章章末与第11章电源分布·源PDF382")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[363　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 10.7　小结（续）

耦合电容手算的一阶模型：

#align(center)[$C_"area" = epsilon_"ox" W/H$]
#align(center)[$C_"lateral" = epsilon_"ox" T/S$]
#align(center)[$C_"fringe" = epsilon_"ox" ln(1+T/H)$]

不同邻线转变的等效耦合电容：

#table(columns:2,inset:3pt,stroke:.35pt,
 [*邻线状态*],[*有效负载*],
 [侵略者不变化],[$C_L=C_"gnd"+C_c$],
 [两者一起变化],[$C_L=C_"gnd"$],
 [两者反向变化],[$C_L=C_"gnd"+2C_c$])

串扰噪声近似：$Delta V_2 = C_c Delta V_1/(C_"gnd"+C_c)$。

电感与互感：$Delta V = L (dif i)/(dif t)$，对相邻两线有 $v_1=L_1 (dif i_1)/(dif t)+M(dif i_2)/(dif t)$。

对于高速线网，需联合检查 $R_"buffer"+R_"wire" < j omega L$ 与线路传播时间、边沿时间对应的几何窗口。制造阶段的天线比由金属收集面积与栅面积之比给出。

== 10.8　参考文献

1. M. Celik, L. Pileggi, and A. Odabasioglu, *IC Interconnect Analysis*, Kluwer Academic Publishers, Boston, MA, 2002.
2. Y. Ismail and E. Friedman, *On-chip Inductance in High-Speed Integrated Circuits*, Kluwer Academic Publishers, Boston, MA, 2001.
3. H. Bakoglu, *Circuits, Interconnections, and Packaging for VLSI*, Addison-Wesley Publishing, Reading, MA, 1990.
4. N. Arora, K. V. Rao, R. Schumann, and L. Richardson, “Modeling and Extraction of Interconnect Capacitances,” *IEEE Transactions on Computer-Aided Design*, vol. 15, no. 1, pp. 58–67, Jan. 1996.

该页为原书印刷第363页公式和参考文献的可编辑排版，未完成原版字体、行距和页脚的视觉1:1对齐。
