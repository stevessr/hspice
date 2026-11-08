// SOURCE PDF PAGE 416 / printed 397; chapter 11 problem set.
// Editable source-check draft. Diagrams are topology sketches, strict 1:1 pending.
#import "../figures/ch11-exercises-native.typ": figP112,figP113,figP114,figP116,figP117
#set document(title:"第11章 · 习题与电路图 · PDF416")
#set text(lang:"zh",size:7.4pt)
#show par: set par(leading:2.1pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[第11章　电源网格和时钟设计　　　　　　　　　397]]
#line(length:100%,stroke:.55pt)

参考文献（续）

3. I. Young, J. Greason, and K. Wong, “A PLL Clock Generator with 5 to 110 MHz of Lock Range for Microprocessors,” *JSSC*, Vol. 27, No. 11, November 1992, pp. 1599–1607.

4. Behrad Razavi, *Design of Analog CMOS Integrated Circuits*, McGraw-Hill, New York, 2001.

== 11.6　习题

*P11.1*　列出几个已知的方法来解决 IR 压降问题。这些方法中的哪些也同时对 Ldi/dt 和 EM 问题有效？

*P11.2*　(a) 在 0.18 μm 工艺里一条宽 0.4 μm、长 400 μm 的导线用于一条电源总线。该导线连接在一个电感为 $L = 2$ nH 的管脚上。有 $W = 1$ μm 的 32 个反相器连接在这条电源线上，在一个 100 ps 的时间周期里其中一半的反相器同时变为高。在这条电源总线的远端（靠近第 32 个反相器 inv32）最坏情况下的电压降是什么？参数：第 5 层金属电阻率 = 54 mΩ/□，厚度 = 0.8 μm。

#figP112()
#align(center)[#text(size:7.1pt)[图 P11.2　带封装电感及 32 个反相器的电源线]]

(b) 假设 $J_"max" = 10^6$ A/cm²，这条导线能通过电迁移检查吗？

(c) 如果不能，导线宽度需要是多少才能通过电迁移检查？

*P11.3*　如图 P11.3 所示的同时变化的情况，32 个输出驱动器中的 31 个从高变到低，而最右边的驱动器保持稳定。假设焊线电感为 10 nH，当每个反相器在 1.8 ns 内通过芯片地线放电 50 pF 时会引起多少地线反跳？设 $V_"DD" = 1.8$ V。

#figP113()
#align(center)[#text(size:7.1pt)[图 P11.3　多驱动器共用芯片地线的反跳模型]]

*P11.4*　在图 P11.4 所示的两相非交叠时钟系统中，为了使系统能正确工作，在 Phi2 下降和 Phi1 上升之间需要的最小延迟是多少？题目条件及示意图在下一页继续。