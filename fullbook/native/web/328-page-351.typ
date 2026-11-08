// SOURCE PDF PAGE 351. Editable source-guided editorial selection, strict page 1:1 not accepted.
#import "../figures/ch9-nonvolatile-ch10-interconnect-native.typ": figure9late,figure10,fig-summary
#set document(title:"数字集成电路第9章·PDF351")
#align(center)[#text(size:8pt,weight:"bold")[332　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

*9.10　参考文献（续）*

原书列出数字集成电路分析、CMOS电路设计及FPGA体系结构等参考著作，含J. Rabaey、A. Chandrakasan、B. Nikolic合著的《Digital Integrated Circuits》，以及S. M. Kang、Y. Leblebici关于CMOS集成电路设计的著作。所有作者、版本与出版年份仍应按本页扫描逐字核验。

== 9.11　习题

*P9.1*　根据图9.3的CAM单元分析比较功能。考虑当匹配线先被预充、随后启用标签线时，两组输入是否匹配以及内部放电路径。

*P9.2*　比较两种CAM单元图中的晶体管尺寸与拓扑，分析哪种结构在功耗、速度或面积上更有优势。

*P9.3*　图P9.2中的CAM单元被用于具有多行、多位标签的CAM阵列。考虑匹配线电容、比较晶体管串联路径、驱动电容和预充器件，计算最坏不匹配时延。

*P9.4*　设计一个9.5节所述的具体ROM阵列并说明每个交叉点用晶体管存在与否表示所需布尔值的方法。

#figure9late(27)
#align(center)[*图P9.2　CAM电路相关习题的可编辑功能图（非逐管复刻）*]
