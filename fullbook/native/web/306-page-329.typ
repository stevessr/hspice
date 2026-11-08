// SOURCE PDF PAGE 329 / printed 310. Source-guided editable editorial draft.
// No full-page 1:1 acceptance; all transistor-level artwork remains provisional.
#import "../figures/ch8-sram-cam-native.typ": figure9
#set document(title:"第9章·PDF329·CAM与FPGA")
#align(center)[#text(size:8pt,weight:"bold")[310　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

逻辑块之间的轨迹通过可配置的开关互连。设计一个可复用的基本逻辑块和布线单元后，就能在水平、垂直方向重复排列，形成完整FPGA内核。

#figure9(6)
#align(center)[*图9.6　FPGA芯片的总体结构（二维PLB阵列草图）*]

FPGA的可编程逻辑块（PLB）分布在阵列中，外围是I/O模块；水平和垂直的多组布线轨迹连接逻辑块。逻辑块输出通过连接区进入布线轨迹，轨迹之间通过交换区切换方向。

#figure9(7)
#align(center)[*图9.7　典型SRAM FPGA体系结构中的布线通道与交换区*]

图9.7还示意逻辑块、输入/输出端口以及布线金属的相对位置。交换区（switch block）也称交换矩阵（switch matrix），连接区（connection block）控制PLB到布线轨迹的连接。

PLB的简化示意见图9.8，其中包括SRAM单元、传输管、D触发器与多路器。SRAM配置位具有两种用途：存储逻辑函数的真值表数据，以及选择PLB自身的连接和输出工作模式。

图中使用3输入查找表（3-LUT），对输入 $A$、$B$、$C$ 的8种组合保存8个真值表位。每一次输入组合经传输管树选中其中一位；实际FPGA也常使用不同大小的LUT。
