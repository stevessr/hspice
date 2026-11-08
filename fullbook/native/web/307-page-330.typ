// SOURCE PDF PAGE 330 / printed 311. Source-guided editable editorial draft.
// No full-page 1:1 acceptance; all transistor-level artwork remains provisional.
#import "../figures/ch8-sram-cam-native.typ": figure9
#set document(title:"第9章·PDF330·CAM与FPGA")
#align(center)[#text(size:8pt,weight:"bold")[311　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#figure9(8)
#align(center)[*图9.8　SRAM编程的3-LUT与可选寄存输出逻辑块（可编辑结构图）*]

查找表中的8位分别由8个SRAM单元保存。输入 $A$、$B$、$C$ 及其互补信号通过三级传输管多路器树，选出唯一的一条路径，输出对应的真值表位。

如果把3-LUT看成8输入多路选择器，则 $A$、$B$、$C$ 是选择变量，8个SRAM单元保存需要实现的逻辑函数。通过对这些SRAM配置位赋予0或1，可以实现任意三输入布尔函数。

#figure9(9)
#align(center)[*图9.9　3-LUT的编程示例（可编辑结构草图）*]

使用NMOS传输管实现的选择树存在高电平传输损失，这是由于NMOS阈值电压的限制。因此在LUT输出端通常增加恢复逻辑，防止信号下降影响后续门电路。

输出可以直接送往PLB的输出缓冲器，也可以先送入D触发器，以实现组合逻辑或时序逻辑模式。最终选择由另一个SRAM配置位控制多路器完成。
