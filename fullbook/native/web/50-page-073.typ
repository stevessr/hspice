// Source PDF page 073 / printed page 54. Subthreshold swing and section 2.8.
#set document(title:"第2章 · 亚阈值斜率与MOS电容引言 · PDF73页")
#set text(lang:"zh")

= 第2章 · 印刷第54页

== 亚阈值斜率因子

在式（2.32）描述的工作区，定义漏电流每变化十倍所需的栅压变化量为亚阈值斜率 $S$：

$ S = Delta V_("GS") = (n k T / q) ln(10) quad "(2.33)" $

室温下 $kT/q approx 26 " mV"$，所以理想 $n=1$ 对应 $S approx 60 " mV/decade"$；书中指出实际 $n$ 经常为1.5到2，相应的 $S$ 约90至120 mV/decade。

== 例2.10　亚阈值摆幅参数的计算

原题在 $V_("DS")=1.8 " V"$ 下读取 PMOS 器件的两组亚阈值电流：

#table(columns:(1.2fr,1.2fr),
 table.header([*电流幅值*],[*栅压读数*]),
 [$10 " nA"$],[$0.140 " V"$],
 [$100 " nA"$],[$0.212 " V"$])

电流恰好增长十倍，栅压差为：

$ S = 0.212 - 0.140 = 0.072 " V/decade" $

$ n approx 72/60 = 1.2 $

教材结果为 $n=1.2$，$S approx 72 " mV/decade"$。

== 2.8　MOS晶体管的电容

本章后续区分两类 MOS 电容：栅极通过薄氧化物与沟道及源漏形成的栅电容，以及源漏扩散区与衬底之间的 pn 结电容。电容决定开关节点需要充放的电荷，因而直接影响动态延迟和功耗。

_例2.10栅压读数和差值已逐格核对；本页2.8节引言为结构性整理。_
