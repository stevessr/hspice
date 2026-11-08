// SOURCE PDF PAGE 358. Source scan-assisted Typst native editorial draft.
// All circuit diagrams, text positions and equations still require strict 1:1 acceptance.
#import "../figures/ch10-rc-elmore-native.typ": figure10more,fig-example102,fig-example101
#set document(title:"第10章·连线RC与艾蒙延迟·PDF358")
#align(center)[#text(size:8pt,weight:"bold")[339　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

RC阶梯网格中的每个电容都通过前面相应的串联电阻充放电。连线末端要形成同样的输出摆幅，通常比短线或集总电容负载需要更长时间。

图10.5比较分布RC网络在不同阶梯段数下的归一化阶跃响应。随着段数增多，分布式RC的近似更接近连续互连的真实传播特性；仅使用集总电容可以高估或低估节点延迟，具体取决于驱动端和输出端的位置。

原书在 0.18 μm 工艺给出定量对比：取一条长度 $1 "mm"$、宽度 $W=0.4 "µm"$ 的铝线，$C_("int")=0.2 "fF/µm"$、$R_("sq")=0.054 "Ω/□"$。书中采用 $R_("wire")=125 "Ω"$ 和 $C_("wire")=200 "fF"$，故集总模型近似 $0.7 R C=17.5 "ps"$，而图 10.5(b) 的分布 RC 真实延迟约 $10 "ps"$。

*源书数值校对注：* 扫描第 358 页所列 $0.054 times 1000/0.4$ 的算术结果应为 $135 "Ω"$，但原页印成 $125 "Ω"$；本稿保留教材的 125 Ω 与 17.5 ps 作为原书例子，差异不隐去。

#figure10more(5)
#align(center)[*图10.5　RC网络的归一化阶跃响应（定性编辑曲线）*]

对任意从源节点到目标节点的RC树，可使用艾蒙（Elmore）延迟估计传输延迟。它将每一个对地电容乘以该节点与目标节点路径上共同包含的电阻，再相加得到结果。

虽然艾蒙延迟不是精确的50%传播延迟，但它便于计算，并对多级RC树具有清晰的物理解释。
