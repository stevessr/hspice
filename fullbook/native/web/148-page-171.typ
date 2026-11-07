// SOURCE PDF PAGE 171 / printed 152
#import "../figures/ch5-cmos-gates-native.typ": equivalent-width
#set document(title:"第5章 · 图5.3/5.4与等效宽度式5.1/5.2 · PDF171")
= 第5章 · 印刷第152页

== 图5.3　伪NMOS器件的尺寸确定

在伪NMOS电路中，负载PMOS栅极接地，形成始终导通的上拉路径。下拉可用NMOS单管、三串联NAND3以及三并联NOR3实现。串联器件宽度必须增加，以补偿导通电阻的累积。

*图5.3*　(a)伪NMOS反相器；(b)与非门；(c)或非门。图中NAND3的三只NMOS各取3W，NOR3各取W，上拉器件宽度均为 $W_P$。

#equivalent-width()

*图5.4　三个NMOS串联形成等效器件的版图关系与等效宽度。*

对于三只串联NMOS，利用 $R proportional L/W$ 的关系得到：

$ W_("eq") = (W_1 W_2 W_3)/
 (W_1 W_2+W_2 W_3+W_3 W_1) quad "(5.1)" $

这等价于 $1/W_("eq")=1/W_1+1/W_2+1/W_3$。三只相同宽度3W的器件同时导通时，其有效宽度约为W。

对于三只并联NMOS，所有器件均导通时：

$ W_("eq") = W_1+W_2+W_3 quad "(5.2)" $

在NOR电路的最坏情况中，通常只考虑一只下拉NMOS导通，因此按单支路确定其最小宽度。图5.4的版图示意说明串联扩散区与单只等效器件之间的关系，但布局寄生和工艺效应仍可能不同。
