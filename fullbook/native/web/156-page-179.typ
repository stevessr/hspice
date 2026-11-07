// SOURCE PDF PAGE 179 / printed 160
#import "../figures/ch5-complex-sequential-native.typ": aoi21
#set document(title:"第5章 · 式5.5 AOI21和图5.12 · PDF179")
= 第5章 · 印刷第160页
== 5.3　复杂的CMOS门（续）
对上页函数施加德摩根定律：
$ F=overline((A+B) dot C)
 =overline(A+B)+bar C=bar A dot bar B+bar C quad "(5.5)" $
n型器件在输入高时导通，因此下拉网络按 $overline F=(A+B)C$ 构成：A、B两支路并联，再与C串联。
p型器件在输入低时导通，因此上拉网络采用对偶关系：A、B两只串联，另一支C并联，构成通向VDD的逻辑路径。
#aoi21()
*图5.12*　实现反相复合函数的CMOS结构。该图为可编辑拓扑标注，而非源书晶体管连线的1:1描摹。
更普遍的规则是：先构造输出为0时的NMOS下拉网络，然后将其串联与并联的关系互换以构成上拉PMOS网络。上拉与下拉网络在输出F处相连，组成互补的静态逻辑门。
