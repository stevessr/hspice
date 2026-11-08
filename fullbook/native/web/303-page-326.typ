// SOURCE PDF PAGE 326 / printed 307. Source-guided editable editorial draft.
// No full-page 1:1 acceptance; all transistor-level artwork remains provisional.
#import "../figures/ch8-sram-cam-native.typ": figure9
#set document(title:"第9章·PDF326·CAM与FPGA")
#align(center)[#text(size:8pt,weight:"bold")[307　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#figure9(4)
#align(center)[*图9.4　CAM和SRAM阵列的结构图（原生可编辑功能图）*]

实际CAM系统必须识别多个意外情况。多重匹配可以在存储标签之前检查是否有重复标签来减少；若全部存储标签都不匹配，则发生“未命中”（miss），所有匹配线保持低电平。这个条件可以利用大扇入的或非逻辑或分级匹配检测电路产生。未命中后，可以把新标签和对应数据分别写入CAM和SRAM。

因为CAM单元内部使用SRAM来保存标签，所以CAM阵列本身也具有字线、标签线和写入控制。图9.3的两条标签线兼作6T SRAM的位线，但与通常的SRAM预充方式不同：这两条标签线必须从低电平开始，防止标签比较网络在预充期间误将匹配线拉低。

例如，若一侧保存的标签节点为高，而比较支路的下拉管在预充期间已经导通，匹配线就可能出现错误放电。因此在匹配线预充时，必须将输入关键词对应的互补标签线保持为低电平。

串联下拉网络的器件位置会影响最坏情况延迟。第6章已介绍后到达信号应接近串联栈顶端。图9.5把直接由标签线控制的比较晶体管置于更接近匹配线的位置，而把由存储单元稳定节点控制的器件放在下方。

这一重新排列让下方晶体管在关键词到达前有机会先放掉内部节点电容，从而在输入不匹配时缩短匹配线放电时间。
