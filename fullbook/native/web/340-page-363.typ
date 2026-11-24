// SOURCE PDF PAGE 363 / printed 344. Fig 10.9 historical data and critical length.
// Original chart dots and axes are editable qualitative redraw, not recovered measured data.
#import "../figures/ch10-rc-elmore-native.typ": figure10more
#set document(title:"第10章 · 图10.9 FO4连线延迟比较、临界线长、10.3缓冲器插入 · PDF363")
#set text(size:7.2pt)
#set par(justify:true,leading:2.5pt,spacing:4pt)
#align(center)[#text(size:8pt,weight:"bold")[344　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

同导线长度的导线延迟图。作为参考点，对 350 nm 工艺，4 扇出门延迟近似为 150 ps；对 130 nm 工艺，4 扇出门延迟缩小到大约 40 ps；对于 65 nm 工艺，延迟缩小到大约 25 ps。另一方面，对 $L=1 " mm"$，连线延迟从 3 ps 分别增加为 27 ps 和 116 ps；对 $L=2 " mm"$，延迟值分别是 12 ps、110 ps 和 460 ps；对 $L=3 " mm"$，延迟值分别是 30 ps、240 ps 和 1035 ps。对每个工艺点，导线延迟成倍增加，并且按导线长度平方增加。很明显，当单个缓冲器驱动长导线时，随着工艺等比缩减或者连线长度的增加，连线延迟将对最终成为 4 扇出门的延迟起主导作用。

#figure10more(9)
#align(center)[#text(size:6.7pt)[图 10.9　门延迟与连线延迟（原生可编辑示意）]]

#table(columns:(1fr,1fr,1fr,1fr),inset:(x:3pt,y:2pt),
  table.header([*连线长度*],[*350 nm*],[*130 nm*],[*65 nm*]),
  [1 mm],[3 ps],[27 ps],[116 ps],
  [2 mm],[12 ps],[110 ps],[460 ps],
  [3 mm],[30 ps],[240 ps],[1035 ps],
)
#text(size:6.3pt)[上表为将原书段落数字整理为可编辑表格，非原书新增表号。]

对每种工艺，我们对长线可以定义一个经验法则，即将 4 扇出延迟设置为等于连线延迟。临界的导线长度可以从下式得出：

$ "FO4" = 0.38 R_("int") C_("int") L_("crit")^2 $

$ therefore L_("crit") = sqrt("FO4" / (0.38 R_("int") C_("int"))) $

例如，在 0.18 μm 工艺中，临界值 $L_("crit")$ 可以用这个公式计算，或者从图 10.9 中估值得出大约是 2.5 mm。当然，这个值将取决于给定导线的 $R_("int")$ 和 $C_("int")$ 值变化。

== 10.3　超长导线的缓冲器插入

对于超长导线，上面描述的平方关系的延迟特性在任何设计中都不能接受。连线延迟将特别长以至于超过门延迟。在集成电路里，全局的导线往往会非常长，因为必须分布在整个芯片中的各处。这些导线与时钟、总线和设计中的其他主要信号线相关。因为长导线的延迟与 $L$ 是平方的关系，所以标准的解决方法是沿着导线间隔地加入中继器（repeater）或者缓冲器（buffer），这样有效地把导线缩短成小段。缓冲器的作用是把二次方关系的延迟变成更线性的延迟。
