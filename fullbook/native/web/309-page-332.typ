// SOURCE PDF PAGE 332 / printed 313. Source-guided editable editorial draft.
// No full-page 1:1 acceptance; all transistor-level artwork remains provisional.
#import "../figures/ch8-sram-cam-native.typ": figure9
#set document(title:"第9章·PDF332·CAM与FPGA")
#align(center)[#text(size:8pt,weight:"bold")[313　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

在SRAM编程型FPGA中，配置位为1的连接传输管导通，为0的连接断开。连接区晶体管把源PLB的输出连接到可选轨迹，交换区晶体管则可以在不同水平、垂直轨迹之间转接信号，最后通过多路选择器把信号送入目标PLB。

FPGA芯片的输入/输出电路也需要支持配置。图9.11中的I/O可以设置成输入、输出或双向形式。输出缓冲器可以被OE信号控制为高阻态；若从外部引脚接收信号，可以通过D触发器寄存或直接传递到内部逻辑网络，取决于配置的多路器。

#figure9(11)
#align(center)[*图9.11　FPGA的I/O缓冲和可配置寄存（可编辑结构示意）*]

教材同时讨论FPGA相对专用集成电路（ASIC）的权衡。采用可编程布线和SRAM配置位，通常会增加芯片面积、互连延迟和功耗，实际利用率也受查找表填充率与布线拥塞影响。

SRAM配置位属于易失性存储器，内部节点电容降低时可能受到高能粒子影响，产生单粒子翻转（SEU，single-event upset）。FPGA上可以报告很高的等效逻辑门容量，但可利用的比例受目标逻辑映射与路由资源约束。原书引用的10%～20%利用率与“5 M门以上”均属于当时的背景数据。

另一条方向是在ASIC或SoC中嵌入局部可配置逻辑结构，让某些功能在制造后仍可以编程。
