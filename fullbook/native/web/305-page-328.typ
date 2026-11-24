// SOURCE PDF PAGE 328 / printed 309. Source-guided editable editorial draft.
// No full-page 1:1 acceptance; all transistor-level artwork remains provisional.
#import "../figures/ch8-sram-cam-native.typ": figure9
#set document(title:"第9章·PDF328·CAM与FPGA")
#align(center)[#text(size:8pt,weight:"bold")[309　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

*例9.1（续）*

原书采用每级寄生延迟 $P=0.5$ 的近似，故标签线的归一化延迟：

#align(center)[$D=4(3.5)+4(0.5)=16$]

针对0.18 μm的工艺参数，单位时间常数为：

#align(center)[$tau=3 C_g R_("eqn")=3 (2 "fF"/mu m)(12.5 "kΩ")(0.2 mu m)=15 "ps"$]

标签线实际延迟：

#align(center)[$t_("tag")=D tau=16(15 "ps")=240 "ps"$]

最坏情况下匹配线的下拉等效电阻近似：

#align(center)[$R_("eq")=(12.5 "kΩ")/8 approx 1.6 "kΩ"$]

于是匹配线延迟：

#align(center)[$t_("matchline")=R_("eq") C_("ML")=(1.6 "kΩ")(200 "fF")=320 "ps"$]

总延迟：

#align(center)[$t_("total")=t_("tag")+t_("matchline")=240 "ps"+320 "ps"=560 "ps"$]

== 9.3　现场可编程门阵列

现场可编程门阵列（FPGA）是独立的可编程逻辑器件，可快速实现较复杂的数字逻辑系统。教材将其大致划分为SRAM编程与反熔丝编程两类，重点介绍SRAM编程的FPGA。该类型通过配置存储在SRAM中的位来改变逻辑函数和内部连线。

FPGA常用于ASIC设计完成前的原型验证，也可以用于最终产品。典型设计从RTL（Verilog/VHDL）描述出发，通过综合、逻辑优化、布局和布线形成配置数据，再把配置位写入器件内部的SRAM。

FPGA的总体结构由二维规则重复的可编程逻辑块（PLB）、布线通道、连接区与交换区构成，外围还有可配置的输入/输出模块。
