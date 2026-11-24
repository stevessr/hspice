// SOURCE PDF PAGE 020 / printed page 1.
// 2026-11-08: source-scan paragraph sequence, chapter overview and two footnotes
// retyped as editable Typst. Exact line breaks / photographic glyph fidelity unverified.
#set document(title:"第1章　深亚微米数字集成电路设计 · 章首页 · PDF020")
#set text(lang:"zh",size:7.25pt)
#set par(justify:true,leading:2pt,spacing:3pt)
#align(center)[#text(size:17pt,weight:"bold")[第 1 章　深亚微米数字集成电路设计]]
#v(13pt)
#block(width:100%,fill:luma(90%),inset:10pt)[
  #text(weight:"bold",size:8pt)[本章提要]
  #table(
    columns:(36pt,1fr),stroke:none,inset:(x:2pt,y:2pt),
    [1.1],[绪论],
    [1.2],[集成电路产业的简要历史],
    [1.3],[数字逻辑门设计的回顾],
    [1.4],[数字集成电路设计],
    [1.5],[数字电路的计算机辅助设计],
    [1.6],[面临的挑战],
    [1.7],[小结],
    [1.8],[参考文献],
    [1.9],[习题],
  )
]
#v(10pt)
== 1.1　绪论

当今世界，集成电路（IC，integrated circuit）实际上是每一个电子元件的组成部分，如手机、个人数字助理、寻呼机、个人计算机、打印机、机顶盒、汽车，等等。这些 IC 中的大多数本质上是数字的，尽管模拟电路在不断增加。本书讨论深亚微米（DSM，deep submicron）工艺中数字电路的设计。如果你已经学过超大规模集成电路（VLSI，very large-scale integration）设计的课程，会熟悉本书中所讨论的许多电路问题。然而，本书的主旨是训练你“像电路设计师那样思考”。目的是给出知识和模型，使你能够分析现有的电路并设计出有趣的新电路。我们的目标在于提供一些工业界设计电路的实际经验，说明怎样使设计在速度、功耗和可靠性方面获得良好的平衡。我们将尽力提供一些未来工艺方面可能出现的进步和潜在的问题方面的知识。

在开始讨论电路之前，需要了解基本的数字元件和用来分析这些基本元件的工具。我们需要考虑工艺的发展趋势以及由于工艺的等比例缩小引发了什么类型的问题。这将贯穿本书其余部分描述的主题。

现代的数字系统设计需要若干工程技术专家的共同努力才能完成。首先，系统设计师或系统结构师将确定整个系统所需要的特性，编写一份定义所有输入、输出、环境条件、操作速度等的详细规格说明书。然后，使用寄存器传输级（RTL，register-transfer level）语言、VHDL 或 Verilog 来实现这个系统。随后，这个 RTL 描述转换成能够满足功能要求的逻辑设计。这一步的输出称为门级设计。门级设计一旦完成就转入电路级设计，用晶体管来实现每个逻辑门。最后，晶体管电路图再转换成几何版图形式的集成电路，这种版图通常以 GDS-II 格式表示。

好的系统设计要求设计决策可以在系统特性、逻辑设计、电路设计、版图设计和制造工艺之间进行适当的平衡、折中通常是必须加以考虑的，并且需要对可选择方案进行评估。因此，对上面提到的各种专业人士而言，具有一定的相关领域的知识是很重要的。

#v(5pt)
#text(size:6.3pt)[① VHDL 和 Verilog 是用来描述大型数字系统的硬件描述语言。]

#text(size:6.3pt)[② GDS-II 是用于在版图中描述几何目标的一种工业标准格式。]
