// SOURCE PDF PAGE 325 / printed 306. Source-guided editable editorial draft.
// No full-page 1:1 acceptance; all transistor-level artwork remains provisional.
#import "../figures/ch8-sram-cam-native.typ": figure9
#set document(title:"第9章·PDF325·CAM与FPGA")
#align(center)[#text(size:8pt,weight:"bold")[306　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

当一行中的任何一个标签位与输入关键词不匹配时，下拉晶体管都会令匹配线（ML）放电。只有该行每一位均匹配，预充至高电平的匹配线才保持为高。因为不匹配行的匹配线都要放电，大规模CAM的功耗可能十分显著。CAM还必须能够处理单一匹配、多行匹配和完全不匹配的情况。

图9.3给出一种CAM单元的原理图与版图。单元的上半部分是存储标签值及其反值的6T SRAM；下半部分把比较逻辑与匹配线放电器件组合起来。两条互补的标签线输入关键词，水平字线WL用多晶硅布线，匹配线使用金属布线。附加的比较网络由4个NMOS晶体管实现。

#figure9(3)
#align(center)[*图9.3　CAM单元的原理图和布局图（可编辑结构示意，逐晶体管连线待验）*]

这种CAM单元因为增加比较晶体管，相对六晶体管SRAM单元的面积大约增加20%～30%。为了在密度和速度之间取得合适的折中，也可以使用其他CAM单元结构。

*练习9.1*　解释图9.3的CAM单元如何工作。假设左侧的存储节点保存标签值0，给出各种标签线输入下的匹配线变化。

CAM标签阵列可与存储实际数据的SRAM阵列并排布置。匹配的标签行通过译码或使能逻辑选择SRAM中的对应字线。假定标签为32位宽，则每条匹配线横穿32个CAM比较单元。每行还应设置有效位，使无效标签不参与匹配。

匹配线在评估阶段还需要使能信号。因为预充后所有匹配线都暂时为高，必须等待最坏情况下的不匹配行充分放电，再将真正匹配行的信号送往SRAM。
