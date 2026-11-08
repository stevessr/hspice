// SOURCE PDF PAGE 287 / PRINTED268. Scan-backed editable exercise draft.
#import "../figures/ch7-exercises-ch8-native.typ": figP73, figP75
#set document(title:"第7章·习题P7.3—P7.7传输门与多米诺逻辑·PDF287")
#align(center)[#text(size:8pt,weight:"bold")[268　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

*P7.3（续）*

(b) 对于图 P7.3（b）重复（a）的计算。然后当时钟输入升高时，计算最坏情况下通过 D 锁存器的延迟。考虑所有电容。设 $W=200 "nm"$。

#figP73()

*P7.4*　使用传输门，设计具有以下输出的电路：

(a) $"Out" = A + B C$

(b) $"Out" = A B + B C + overline(C)$

(c) 和 (d) 为含嵌套括号和反相符号的组合布尔函数（需继续对照扫描原题逐符号重录）。

然后去掉不需要的晶体管和开关。

*P7.5*　图 P7.5 中各个电路的输出是什么？

#figP75()
#align(center)[*图P7.5　两个动态逻辑求值网络*]

*P7.6*　设计具有以下输出的多米诺逻辑电路：（a）至（d）分别要求四种带有反相项和合取/析取组合的布尔输出；具体长表达式尚待逐字复核原图。

*P7.7*　图 P7.7 中电路的各个输入信号的逻辑强度（LE）分别是多少？除非特别指定，所有晶体管都是最小尺寸，$L=2lambda$，$W=2lambda$。