// Native editable reconstruction of scanned PDF page 028 (printed page 9).
// Source: user-provided scanned textbook; NOT accepted as 1:1 editorial fidelity.
#import "../figures/logic-levels-transient.typ": quantized-levels, in-out-levels, vtc
#set document(title: "原书第28页 · 连续信号与噪声容限")
#set text(lang: "zh")

= 图1.7　连续信号的逻辑抽象

#context {
  if target() == "paged" {
    grid(columns: (1fr, 1fr), column-gutter: 6pt, row-gutter: 0pt,
      [#quantized-levels()], [#in-out-levels()],
      [#vtc()], [#vtc(inverting: true)])
  } else {
    [
      #quantized-levels()
      #in-out-levels()

      #vtc()
      #vtc(inverting: true)
    ]
  }
}

*图1.7　连续信号的逻辑抽象。*（a）振幅量化与不确定区；（b）输入输出逻辑电平；（c）非转换电路传输特性；（d）转换电路传输特性。图符、标注、坐标线由 Typst 原生图元构成。

== 1.3.3　噪声容限的定义

在数字电路系统中，噪声一词指的是逻辑节点上电压或者电流不期望的变化。如今，许多噪声源都可能影响到电路的性能。我们希望定义一种衡量标准，用来评估电路中噪声的影响。如果噪声的幅度太大，将引起逻辑错误。然而，如果任何逻辑电路输入端的噪声振幅都小于规定的临界值——即这个电路的噪声容限（noise margin），那么信号从输入到输出的传输过程中噪声将被削弱。

在功能正确执行的数字系统中，噪声在电路中传输时将被削弱，而所需要的逻辑信号则会正确无误地恢复到满幅值。在从一级逻辑到下一级逻辑的传输过程中，噪声不会不断累加。这是数字系统的重要优点之一。

过去，噪声主要来自芯片外部的噪声源。如今，噪声也来源于芯片内部；电容耦合、电感耦合、制造容差、温度和电源变化，以及输出节点电负载，都会导致输出值偏移。设计时应考虑最坏情况下的输出电压范围。

通常，输出为高、低逻辑状态下的噪声容限并不相同，分别为：

$ "NMH" = V_("OH") - V_("IH") $

$ "NML" = V_("IL") - V_("OL") $

只要输入保持在对应范围内，电路应能在一定噪声影响下正常工作。原书后续章节会进一步讨论这些术语。

#text(size: 8pt, fill: gray)[校对记录：图1.7的四个子图已用原生曲线和坐标对象重绘；文字、公式已参照扫描页复核。图形细部、段落断行、坐标比例尚待逐项视觉对照；本页未通过1:1验收。]
