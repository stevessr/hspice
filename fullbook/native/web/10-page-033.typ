// PDF scan page 033 / printed page 14.
// Editable page source: CMOS inverter schematic, source-linked prose.
// Not accepted as a 1:1 facsimile.
#import "../figures/chapter1-continuation.typ": cmos-inverter
#set document(title: "原书第33页 · CMOS与NMOS")
#set text(lang: "zh")

= 1.4.2　CMOS 与 NMOS

对 NMOS 和 PMOS 器件有了基本了解之后，可以构造第一个逻辑门：CMOS 反相器。如图1.11所示，CMOS 反相器由一个 n 沟道器件和一个 p 沟道器件组成，连接在电源 $V_("DD")$ 和地 Gnd（也称 $V_("SS")$）之间。

PMOS 是连接到 $V_("DD")$ 的上拉器件，用于将输出拉向高电位；NMOS 是连接到地的下拉器件，用于将输出拉向低电位。输入 $V_("in")$ 同时连接两个晶体管的栅极，输出 $V_("out")$ 连接两个漏极。

当输入为 $V_("DD")$ 时，NMOS 导通、PMOS 截止，输出节点和负载电容经 NMOS 放电，使 $V_("out")$ 接近零。当输入为零时，NMOS 截止、PMOS 导通，输出被拉高到 $V_("DD")$。由此实现逻辑反相。

#cmos-inverter()

*图1.11　CMOS 反相器的示意图。* PMOS、NMOS、公共栅输入、漏端输出及输出电容 $C$ 采用可编辑的 Typst 线段、节点与文字组成；晶体管图符的最终轮廓需要和原图再次比对。

在稳定高电平和低电平状态下，由于上下管中通常有一只处于截止，理想 CMOS 的稳态直流功耗较小，这是它相比传统 NMOS 门电路的重要优势。

在早期 NMOS 工艺中，逻辑门常由 n 沟道晶体管构成。NMOS 反相器的下拉器件与 CMOS 反相器类似，但上拉器件使用电阻 $R_L$。这个电阻可以由保持导通的耗尽型 n 沟道器件实现。当输入低时，下拉管截止，上拉电阻将输出拉高；当输入高时，下拉管导通，输出被拉低，但上拉电阻仍提供电流。

输出为低时，电源与地之间存在约为 $(V_("DD") - V_("OL")) / R_L$ 的直流电流，因此 NMOS 电阻负载反相器会持续消耗静态功率。随着门电路规模扩大，这一损耗不可忽略，低静态功耗的 CMOS 因而取得了优势。

#text(size: 8pt, fill: gray)[校对状态：本页正文与图1.11为原生 Typst 重排候选；图形坐标、源图标注、段落换行尚未逐项完成1:1验收。]
