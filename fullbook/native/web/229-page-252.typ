// SOURCE PDF PAGE 252 / PRINTED233. Exercises P6.9 continuation, P6.10–6.13.
#import "../figures/ch6-branch-exercises-native.typ": fig-p69-cont, fig-p610, fig-p611
#set document(title:"第6章 · 习题P6.9—P6.13及电路结构 · PDF252")
#align(center)[#text(size:8pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　　233]]
#line(length:100%,stroke:.5pt)

#fig-p69-cont()
#align(center)[*图P6.9（续）　（c）（d）使用统一最小沟道长度 $L=2lambda$ 的串并联MOS器件*]

*P6.10*　图P6.10中的第一个门的输入B的 $ "LE"_R $ 是多少？后面门的 $ "LE"_F $ 呢？

#fig-p610()
#align(center)[*图P6.10　复合两级逻辑门的上拉、下拉晶体管尺寸与F输出*]

*P6.11*　在图P6.11中，计算最优化延迟和晶体管的尺寸（所有器件都是标准CMOS门且所有晶体管都有最小长度，$L=0.1 " μm"$）。$C_("inv")$ 是最小尺寸反相器的输入电容。

#fig-p611()
#align(center)[*图P6.11　反相器—与非门—或非门—反相器链，输出 $1000 C_("inv")$*]

*P6.12*　在图P6.12中，计算最佳的路径延迟和晶体管尺寸（所有器件都是标准CMOS门且所有晶体管都有最小长度，$L=0.1 " μm"$）。使用0.13 μm工艺参数。$C_("inv")$ 是最小尺寸反相器的输入电容。

*P6.13*　不另外增加反相器，确定图P6.13中的尺寸，以使传播延迟最小，并计算路径延迟。如果要使延迟最优化需要增加多少个反相器（以及在哪里增加）？