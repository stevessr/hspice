// SOURCE PDF PAGE 250 / PRINTED 231. Exercises P6.4/P6.5.
#import "../figures/ch6-branch-exercises-native.typ": fig-p64, fig-p65
#set document(title:"第6章 · 习题P6.4、P6.5晶体管速度饱和与自电容 · PDF250")
#align(center)[#text(size:8pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　　231]]
#line(length:100%,stroke:.5pt)

*P6.4*　在图P6.4中的每一个电路中，假设输入的阶跃变化如图中所示，确定输出的自身电容。

#fig-p64()
#align(center)[*图P6.4　四种不同输入转变下的三输入CMOS逻辑门*]

*P6.5*　本题中，分析图P6.5中两个电路的输入选择和速度饱和模型对延迟的影响。

#fig-p65()
#align(center)[*图P6.5　单个NMOS与三只串联NMOS*]

（a）用HSPICE和0.13 μm工艺文件，比较两种情况下的 $t_("pHL")$ 延迟。输出电容是50 fF。输入应该是一个0 V到1.2 V的阶跃信号。可以通过在网表中设置 $"AS"$、$"AD"$、$"PS"$ 和 $"PD"$ 为0而在模拟中忽略寄生效应。哪一种情况下的延迟较小？为什么？

（b）现在，调整电路（b）中的所有3个器件的尺寸，直到电路（a）和电路（b）的延迟相同为止。（b）中的器件尺寸是根据什么因素减少的？