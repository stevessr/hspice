// SOURCE PDF 324 / printed 305. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第9章·存储器设计中的其他课题·PDF324")
#align(center)[#text(size:8pt,weight:"bold")[305　数字集成电路分析与设计 · 第9章]]
#line(length:100%,stroke:.55pt)

CAM还可用于网络路由表：由目的IP地址或相应关键词查找下一跳（next hop），再把数据包转送到下一节点。其关键在于将存储的标签与查询词进行匹配，而不是仅给出存储单元的地址。

图9.2示意一组CAM标签行。每一个标签由多个位构成，每一位可以由类似6T SRAM的单元保存原值与互补值。查询关键词的对应位与这些标签位进行比较；每行具有一条匹配线，表示整个标签是否一致。

#figure9(2)
#align(center)[*图9.2　CAM查询阵列的排列（可编辑结构图）*]

工作开始时，每行匹配线可以预充到高电平。若查询位与某单元中保存的标签位不相等，比较电路通过下拉晶体管使该行匹配线放电；只有所有标签位均一致时，整条匹配线才能保持高电平。

多行标签可以同时执行比较，所以CAM以额外的比较晶体管、匹配线和功耗换取快速关联查询。此处的逐晶体管结构、XOR极性和匹配线耦合尚需对原图逐线验收。
