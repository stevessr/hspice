// SOURCE PDF PAGE 173 / printed 154
#import "../figures/ch5-cmos-gates-native.typ": wide-nand
#set document(title:"第5章 · 8输入门、DeMorgan与伪NMOS图5.5—5.7 · PDF173")
= 第5章 · 印刷第154页

5.2.2节指出：8输入NAND的直接CMOS实现需要8只NMOS串联及8只PMOS并联。若按参考反相器匹配最坏下拉延迟，每只串联NMOS需达到约8W，导致版图面积和寄生电容增大。

#wide-nand()

*图5.5　8输入与非门。* 此图编辑重排展示并联上拉与八级串联下拉的拓扑概念，细部MOS连线仍待完全描摹。

== 图5.6　德摩根定律的应用示意图

德摩根定律允许把输入与输出处的反相器移动到逻辑网络中，进而交换与门和或门：

$ overline(a dot b)=overline(a)+overline(b) $

$ overline(a+b)=overline(a) dot overline(b) $

图5.6以两输入逻辑符号演示输入端的反相泡、输出端的反相泡之间如何转换，便于设计多级门电路和消除不必要的反相器。

== 图5.7　利用德摩根定律将AND门转换成NOR门

例如，8输入AND逻辑可先把输入反相，再使用NOR逻辑构成等效功能。使用伪NMOS结构时，逻辑下拉支路可以由并联NMOS构成，但需警惕静态电流与输出低电平不能完全为0的影响。

源书图5.7包含(a)逻辑门符号与(b)伪NMOS晶体管实现的可比结构。仅用单级伪NMOS减少晶体管数量有时换来较大的待机功耗；因此还需对比多级标准CMOS实现。
