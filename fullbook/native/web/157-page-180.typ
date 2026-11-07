// SOURCE PDF PAGE 180 / printed 161
#import "../figures/ch5-complex-sequential-native.typ": complex-dual
#set document(title:"第5章 · 例5.3复杂CMOS门与图5.13 · PDF180")
= 第5章 · 印刷第161页
#complex-dual()
*图5.13*　通用复杂门由p型上拉复合结构和n型下拉复合结构组成。
== 例5.3　复杂的CMOS门
问题：使用静态互补CMOS和伪NMOS分别实现：
$ F=overline(A B+C D) $
首先构造n型下拉网络，功能为 $A B+C D$，即A、B串联的第一支路，与C、D串联的第二支路并联。
上拉p型结构利用德摩根定律：
$ F=overline(A B) dot overline(C D) $
$ F_("dual")=(A+B)(C+D) $
因此PMOS上拉采用两组并联的A/B和C/D器件，再将两组串联接至VDD；NMOS下拉由两个串联支路并联接至地。
伪NMOS实现只需一个固定栅接地的PMOS上拉器件和相同的NMOS下拉网络，晶体管数量较少，但输出低电平存在静态电流。
