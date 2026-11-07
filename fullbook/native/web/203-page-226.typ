// SOURCE PDF PAGE 226 · print 207. Equations 6.14 and 6.15.
#import "../figures/ch6-ramp-native.typ": fig616
#set document(title:"第6章·斜坡延迟与反相器链累积延迟·PDF226")
#align(center)[#text(size:8pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　　207]]
#line(length:100%,stroke:.5pt)

#align(center)[$t_("pHL,ramp") approx (2t_("pLH,step"))/4+t_("pHL,step")$]
#align(center)[$= t_("pHL,step")/2 + t_("pHL,step")$]

从上面的例子中，可以很清楚地看到斜波输入是如何影响传播延迟的。实际上增加了一个依赖于斜波输入上升/下降延迟的延迟项 $Delta t_("ramp")$。因此，总延迟可以写成：

#align(center)[$t_("ramp")=Delta t_("ramp")+t_("step")$]

对于阶跃输入，如果能够将 $Delta t_("ramp")$ 与传播延迟联系起来将会大大简化这个表达式。如果把输入上升/下降传播延迟表示为 $t_("in")$，那么根据上面的例子，会发现对于给定的输出波形 $Delta t_("ramp")=t_("in")/2$。也就是说：

#align(center)[$t_("ramp") approx t_("in")/2+t_("step") quad "(6.14)"$]

对于图6.16所示的斜波输入的反相器链的延迟，这是一个非常方便的结果。对于反相器来说，$t_("step")$ 值给定为 $0.7R C$，下一级的 $Delta t_("ramp")$ 值可以近似为 $0.7R C/2$，为了方便可以舍入为 $0.3R C$。如果按照图6.16所示将传播延迟项合并，并且假设输入传播延迟大约等于最后一级的传播延迟（如果电路中各级传播延迟大致相等，则这是一个合理的假设），那么总延迟（total_delay）就可以非常简单地计算如下：

#align(center)[$"Total_delay" approx sum_i R_i C_i quad "(6.15)"$]

#fig616()
#align(center)[*图6.16　斜波输入的反相器链延迟*]

这就是说，在处理斜波输入的延迟计算的时候不必再加0.7这个因数了。因为所遇到的大多数电路的输入都是斜波输入，所以使用式（6.15）进行延迟计算是比较安全的。

总地来说，对于有限的斜波输入，对精确传播延迟的估算可以通过把每级逻辑的导通电阻与负载电容的积简单相加得到。如果导通电阻和电容的计算是精确的，按这种方式计算出来的结果和SPICE模拟的结果是一致的。

#line(length:100%,stroke:.5pt)
*例6.6　一个反相器驱动4个扇出反相器，计算该反相器的延迟。*

*问题：*（a）一个CMOS反相器上拉器件尺寸为 $8lambda:2lambda$，下拉器件尺寸为 $4lambda:2lambda$，驱动4个同样的反相器，采用0.18 μm工艺，假设是斜波输入并忽略连线电容。（b）假设为斜波输入，计算4个反相器构成的链的延迟。考虑不同的上升和下降延迟的影响。