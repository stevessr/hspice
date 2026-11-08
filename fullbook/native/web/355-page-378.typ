// SOURCE PDF PAGE 378. Scan-guided native Typst selection, not a 1:1 accepted page.
// Printed textbook page 359; topology/plot curves remain editorial abstractions.
#import "../figures/ch10-inductance-antenna-native.typ": fig1020,fig1021,fig1022,fig1023,fig1024,fig1025,fig1026,fig1027,fig1028
#set document(title:"第10章·串扰、RLC和天线效应·源PDF378")
#set text(size:7.1pt)
#show par: set par(leading:2.25pt,spacing:3.3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[359　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

对上页导出的电感显著性条件联立，原书给出互连线长的窗口：

#align(center)[$t_r / (2 sqrt(L_"int" C_"int")) < l < (2/R_"int") sqrt(L_"int"/C_"int") quad (10.27)$]

左侧由输入边沿时间决定，右侧由互连阻尼参数决定。只有在合适的长度窗口内，电感对瞬态的影响才值得特别纳入设计分析。

另外，邻线的磁场耦合会产生互感。以两根线为例，耦合电压可以写作：

#align(center)[$v_1 = L_1 (dif i_1)/(dif t) + M (dif i_2)/(dif t)$]
#align(center)[$v_2 = M (dif i_1)/(dif t) + L_2 (dif i_2)/(dif t) quad (10.28)$]

其中 $M$ 为互感。高速信号的电流变化可能在相邻导线中感应额外电压，这与前一节的*电容性串扰*不同，但都属于互连线之间的电磁耦合。

== 10.6　天线效应

*天线效应*发生在制造工艺期间，而不只是芯片正常运行时。较大面积的金属连线可能在等离子体刻蚀等过程中积累电荷。如果这些电荷经由 MOS 栅氧化层泄放，就可能对薄氧化层造成不可逆损伤。

因此版图设计必须遵守工艺给出的天线设计规则，而不能只检查正常供电条件下的逻辑功能与互连时延。
