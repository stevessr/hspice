// SOURCE PDF PAGE 344. Scan-guided original Typst excerpt and editable schematics.
// Not full-page 1:1 accepted; transistor topology and page geometry provisional.
#import "../figures/ch9-nonvolatile-ch10-interconnect-native.typ": figure9late
#set document(title:"第9章·非易失存储器·PDF344")
#align(center)[#text(size:8pt,weight:"bold")[325　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

采用热载流子注入（HCI）编程EPROM时，应使控制栅与漏端获得较高电压，源端与衬底接地。漏端较强的横向电场加速电子，部分高能电子跨越界面注入氧化层，被浮栅捕获。由于浮栅电位随电子积累而降低，注入趋于停止，这是一个自限制过程。

图9.24(a)示意热载流子注入过程。当漏和控制栅恢复正常电平后，负电荷仍留在浮栅，器件的等效外部阈值上升，常规的读取电压无法让晶体管导通，因此可编码存储“1”。

图9.24(b)中，紫外线照射能够使二氧化硅中形成电子-空穴对，并提供去除浮栅电子的机制，完成整片EPROM擦除。EPROM一般需要透明窗口封装，因此并不适合每一种嵌入式应用。

#figure9late(24)
#align(center)[*图9.24　EPROM写入的热载流子注入与紫外擦除（原生剖面）*]

*例9.4　EPROM编程*

题设：栅1原阈值为1 V，初始浮栅电压为0，两串联电容相同；当栅2电压加10 V时，浮栅节点变为5 V。热载流子注入使栅1节点降至2 V。求正常读栅电压及编程后使器件再次导通所需电压。

#align(center)[$C_1=C_2=C quad V_("G1")=(V_("G2"))/2 + V_(stored)$]

问题的电容分压图提供初始、10 V编程、注入后三种状态，数值解在下页续述。
