// SOURCE PDF PAGE 418 / printed 399; chapter 11 problem set.
// Editable source-check draft. Diagrams are topology sketches, strict 1:1 pending.
#import "../figures/ch11-exercises-native.typ": figP112,figP113,figP114,figP116,figP117
#set document(title:"第11章 · 习题与电路图 · PDF418")
#set text(lang:"zh",size:7.4pt)
#show par: set par(leading:2.1pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[第11章　电源网格和时钟设计　　　　　　　　　399]]
#line(length:100%,stroke:.55pt)

#figP117()
#align(center)[#text(size:7.1pt)[图 P11.7　去耦 MOS 电容与反相器电源节点]]

*P11.8*　对于图 11.27 所示的电路，绘制输入的时钟信号和输出的时钟信号。设计从 Clk 到两个输出端延迟相等的电路。

*P11.9*　对于图 11.41（b）所示的电路，假设所有器件的 $W = 0.5$ μm，用 SPICE 来绘制 $tau$ 与 $V_c$ 的关系曲线。假设该反相器驱动另一个相同的反相器。按照从 SPICE 里得出的结果，如果图 11.41（a）中有 25 级，VCO 的频率范围是什么？

*P11.10*　要求用最小的延迟驱动一条 10 mm 长的导线。但是，输入电容必须是 12λ（也就是由 2X 反相器所引起的输入电容）。回答如下的问题，先用快速粗略计算，然后使用详细分析重做这道习题，最后用 SPICE 对比结果。

(a) 首先画一个产生最小延迟的只涉及反相器和导线的电路图。电路中应该有从 2X 开始并且尺寸递增的反相器，直到到达为了驱动导线段而插入的缓冲器为止。显示从一端到另一端的整个延迟路径。

(b) 设计反相器的尺寸来产生最小的延迟。

(c) 计算从 2X 反相器到导线末端的延迟值。

_本页按原书习题内容保持题目而不加入答案。图形为源页条件对应的可编辑抽象，严格图线几何和字间距仍需审核。_
