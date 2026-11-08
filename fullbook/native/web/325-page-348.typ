// SOURCE PDF PAGE 348. Scan-guided original Typst excerpt and editable schematics.
// Not full-page 1:1 accepted; transistor topology and page geometry provisional.
#import "../figures/ch9-nonvolatile-ch10-interconnect-native.typ": figure9late
#set document(title:"第9章·非易失存储器·PDF348")
#align(center)[#text(size:8pt,weight:"bold")[329　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

图9.30比较了两种Flash阵列结构。NOR型通过位线并联访问存储单元，而NAND型把多个浮栅器件串联。电路读出时必须用适当的选通电压，使未被读取的串联器件形成低电阻通路，目标单元的状态才能决定整个串联支路是否导通。

#figure9late(30)
#align(center)[*图9.30（续）两类Flash阵列*]

为对单元编程，选中控制栅与相应源、漏端施加规定的高低电平；未选单元偏置必须抑制扰动和误编程。图9.31展示Flash阵列的可编程偏置和读出方案，其设计与普通NOR ROM不同：同一组晶体管既用于读取，又必须承受较高的写/擦电压。

#figure9late(31)
#align(center)[*图9.31　Flash阵列编程与读取结构（原生编辑草图）*]

Flash的读、编程和擦除需要不同的供电和时序控制。读出电路通常要判别阈值分布，且要兼顾擦写寿命、数据保持、相邻单元干扰及工艺变化。原书各器件端口、符号及电压标注尚需逐线复核。
