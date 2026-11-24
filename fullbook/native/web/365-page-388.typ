// SOURCE PDF PAGE 388. Native Typst source-scan editorial selection, not 1:1 complete.
// Printed page 369; line-by-line transcription and source geometry remain unverified.
#import "../figures/ch10-summary-ch11-power-native.typ": fig1028,figp104,figp105,figp106,figp108,fig111,fig112
#set document(title:"第10章章末与第11章电源分布·源PDF388")
#set text(size:7.15pt)
#show par: set par(leading:2.3pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[369　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#fig111()
#align(center)[*图11.1　电源分布系统的 IR 压降（原生可编辑简化电路图）*]

IR 压降主要影响门的时序。在高速设计中，时钟和关键逻辑门可能对供电波动格外敏感。应在典型活动情况下计算压降，也要检查较强同时切换条件下的瞬态压降和噪声。

当供电噪声预算下降时，增加电源网格金属面积、降低路径阻抗、使用片上去耦电容与合理布局负载都可能改善结果，但会付出面积、功耗和布线拥塞代价。

芯片封装的电感是 $L dif i/dif t$ 压降的重要来源。原书指出：较长引脚封装的电感可能约1—2 nH，快速电流变化会形成大幅的动态供电噪声。

#fig112()
#align(center)[*图11.2　芯片封装的不同选择：DIP与BGA（可编辑概念示意）*]

双列直插式（DIP）引线较长，封装寄生电感较大；球栅阵列（BGA）通过大量焊球连接，在供电回路方面可降低部分封装寄生电感，但也会增加封装和制造成本。

本页原扫描还讨论了地电位抬升与供电可靠性之间的关系；需要在后续编校中逐句恢复。
