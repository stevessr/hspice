// SOURCE PDF PAGE 224 · print 205. Step/ramp trajectory comparison.
#import "../figures/ch6-ramp-native.typ": fig615, fig613
#set document(title:"第6章·图6.15阶跃/斜波轨迹与例6.5·PDF224")
#align(center)[#text(size:8pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　　205]]
#line(length:100%,stroke:.5pt)
#fig615()
#align(center)[*图6.15　简化的反相器输出电流与 $V_("out")$、$V_("in")$ 的函数关系*]

对于负向的斜波输入可以得到类似的结果，只是拐角平缓的情况将发生在图中的D点附近。同样，实际的输入/输出轨迹的影响是减少了最初用来给输出电容充电的电流。因此，施加一个斜波输入时延迟将会增加。

延迟精确的增加量由多种因素决定，但最终是由作为时间函数的输出电流波形所控制的。下面的例子说明了在阶跃输入和斜波输入的情况下如何获得延迟的解析表达式。

#line(length:100%,stroke:.5pt)
*例6.5　阶跃输入和斜波输入的延迟计算*

*问题：*

（a）计算下图所示的由阶跃输入引起的波形的延迟 $t_("pHL,step")$。

#fig613()

*解答：* 阶跃情况下的传播延迟计算非常简单：对于一个从0跳变到 $V_("DD")$ 的理想阶跃，输出由高电平开始下降；对到达 $V_("DD")/2$ 的时间，利用电容电流积分。