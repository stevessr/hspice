// SOURCE PDF PAGE 279 / PRINTED 260. Scan-backed editable excerpt, not 1:1 accepted.
#import "../figures/ch7-domino-continuation-native.typ": fig729
#set document(title:"第7章·7.5.1多米诺门逻辑强度与局限·PDF279")
#align(center)[#text(size:8pt,weight:"bold")[260　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

== 7.5.1　多米诺门的逻辑强度

此时出现的一个问题是多米诺逻辑是否确实比静态 CMOS 门更快，以及较少晶体管的性能优势如何量化。作为对比，考虑图7.29所示的静态或非门和动态或非门。两个门具有相同的下拉能力，并且假设它们要驱动相同的输出负载，以便进行公平的比较。所有器件的长度都是 $2lambda$。

#fig729()
#align(center)[*图7.29　静态门和动态门逻辑强度的比较*]

对于静态门，可以通过比较静态或非门与相应反相器的输入电容得到逻辑强度。上拉器件尺寸为 $8lambda$，下拉器件尺寸为 $4lambda$ 的反相器作比较：

#align(center)[$"LE"_("NOR") = ("NOR输入电容")/("反相器输入电容")=(16lambda+4lambda)/(8lambda+4lambda)=5/3$]

对于多米诺电路，输入电容就是一个 $8lambda$ 的 NMOS 器件，所以：

#align(center)[$"LE"_("dyn NOR")=(8lambda)/(12lambda)=2/3$]

因为多米诺逻辑中外部反相器的 $"LE"=1$，两个门的逻辑强度平均值是逻辑强度的几何平均值：

#align(center)[$"LE"_("avg")=sqrt((2/3)times 1) approx 0.8$]

因此，多米诺级在整体驱动能力与输入电容负载方面更好。要注意静态门有两级串联的上拉晶体管，而多米诺电路求值时只需单个 NMOS 器件导通，避免上下拉器件的竞争。另一方面，动态门需要预充与时钟，工作方式不同于普通的静态 CMOS 门。

== 7.5.2　多米诺逻辑的局限性

虽然多米诺逻辑有上述优点，仍然存在电容上电荷丢失而引发误逻辑的风险。主要问题是电荷共享、电容性耦合导致的噪声注入、电荷泄漏或少数载流子损失。一旦电荷丢失，无法保证电路继续执行正确功能。