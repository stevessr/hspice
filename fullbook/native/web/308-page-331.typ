// SOURCE PDF PAGE 331 / printed 312. Source-guided editable editorial draft.
// No full-page 1:1 acceptance; all transistor-level artwork remains provisional.
#import "../figures/ch8-sram-cam-native.typ": figure9
#set document(title:"第9章·PDF331·CAM与FPGA")
#align(center)[#text(size:8pt,weight:"bold")[312　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

PLB输出的配置多路器决定其逻辑类型。选择查找表组合结果时，PLB实现组合逻辑；选择D触发器输出时，PLB实现时序逻辑。触发器由额外CLK信号控制，时钟需要按布局连接到各个PLB。实际FPGA常包含多种时钟资源，但源书的简化结构只给出基本DFF连接。

*例9.2　FPGA逻辑块*

*问题：* 图9.9的3-LUT实现什么逻辑功能？该逻辑是组合还是时序？

*解答：* 根据图中的8个SRAM配置位建立三输入真值表，再使用卡诺图化简：

#align(center)[$"Out"= B + A C$]

本例选择的是直接的查找表输出，而不是触发器输出，所以属于组合逻辑。

PLB之间使用预制布线轨迹。连接区里的每一条可编程连接都由SRAM位控制相应的传输管。当配置位为1时，对应传输管允许信号通过；为0时连接断开。

#figure9(10)
#align(center)[*图9.10　FPGA可编程的连接区和交换区（可编辑布线草图）*]

布线资源是否充足、传输门串联数量与扇出，以及连接区和交换矩阵的几何规划共同决定FPGA的实际容量和速度。
