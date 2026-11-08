// SOURCE PDF PAGE 371. Scan-guided editable Typst selection; NOT full 1:1 acceptance.
// Original source scan: printed page 352; images/figures are editable abstractions.
#import "../figures/ch10-coupling-native.typ": fig1011,fig1012,fig1013,fig1014,fig1015,fig1016,fig1017,fig1018,fig1019
#set document(title:"第10章·连线设计·源扫描PDF371")
#set text(size:7.2pt)
#show par: set par(leading:2.3pt,spacing:3.4pt)
#align(center)[#text(size:7.5pt,weight:"bold")[352　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

印刷第352页承接第351页的结论：中间间距的连线电容介于0.1与0.2 fF/μm之间；电容提取工具可以更准确地分解实际几何中的三维耦合。最坏情况下可能达到0.2—0.3 fF/μm。

== 10.4.2　耦合对延迟的影响

第10.3节的艾蒙延迟模型把电容主要视为对地负载，未充分考虑邻近线网同时开关时的耦合效应。实际上，邻线的信号变化方向会直接影响受害者线网上的有效电容和时延。

#fig1017()
#align(center)[*图10.17　线间耦合电容（五条邻线的可编辑示意）*]

原书图10.18考虑两个相邻的缓冲器输出线网：线网2是要分析延迟的*受害者*，线网1是会影响它的*侵略者*。为了突出耦合机制，先忽略导线电阻，考虑线网2自身的对地电容 $C_"gnd"$ 与两线之间的耦合电容 $C_c$。

#fig1018()
#align(center)[*图10.18　用于分析耦合延迟和噪声的电路（可编辑示意）*]

若把耦合电容的另一端简单接地，得到的只是一种情况。需要分别区分侵略者不变化、同向变化、反向变化三种情形。
