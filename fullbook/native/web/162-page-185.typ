// SOURCE PDF PAGE 185 / printed p.166; scan-based delay, sizing, and SR continuation.
// The transistor-level Fig5.4 example's full cross-coupled device drawing
// still needs geometry verification; not certified 1:1.
#import "../figures/ch5-complex-sequential-native.typ": sr-nor-sizes
#set document(title:"第5章 · 例5.4 NOR SR锁存器尺寸与NAND SR引言 · PDF185")
#set text(lang:"zh",size:7.2pt)
#set par(justify:true,leading:2pt,spacing:3pt)
#align(center)[#text(size:8pt,weight:"bold")[166　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

都为高电平，结果 $Q$ 和 $bar(Q)$ 都是低电平，由于这时的输出不是互补的，所以 $S$ 和 $R$ 输入端都为高的条件是禁止的或不允许的。当两个输出不互补时，仅将其当做禁止态处理。实际上，当输入触发脉冲回到其静止状态时，锁存器最终的状态是由最后进入低电平的那个输入决定的。

从 $S$ 到 $Q$ 的延迟可以近似地估算成两个或非门的延迟，而从 $S$ 到 $bar(Q)$ 的延迟是仅为一个或非门的延迟。同样，从 $R$ 到 $Q$ 的延迟是一个门的延迟，而从 $R$ 到 $bar(Q)$ 的延迟是两个门的延迟。

== 例 5.4　用或非门设计 SR 锁存器

*问题：* 在 0.13 μm 的 CMOS 中，用或非门设计一个 SR 锁存器，使从 $S$ 到 $Q$ 的延迟和从 $R$ 到 $bar(Q)$ 的延迟都为 400 ps。假设 $Q$ 和 $bar(Q)$ 驱动的总负载为 100 fF，并且 $L=100 " nm"$。

*解答：* 用下面交叉耦合的或非门结构来实现 SR 锁存器。

#sr-nor-sizes()
#align(center)[*例 5.4　交叉耦合 CMOS 或非门的晶体管级尺寸示意*]

为获得希望得到的传播延迟，利用关系式 $t_("PHL")=t_("PLH")=0.7 R_("eff") C_L$。这里有两个传播延迟，分别从 $S$ 到 $Q$ 和从 $R$ 到 $bar(Q)$，所以将这两个延迟等分在两个或非门之间。对于 NMOS 器件，已经知道 $R_("eqn")=12.5 " kΩ/□"$，所以有：

$ t_("PHL")=0.7 (12.5 " kΩ") L/W (100 " fF")=200 " ps" $

$ W/L=4.4 $

设两个 NMOS 器件都有 $W_n=440 " nm"$。

对于 PMOS 器件，利用经验法则，简单地将 NMOS 器件的尺寸变成四倍，从而得到：

$ W_p=1.76 " μm" $

*用与非门构成的 SR 锁存器。* SR 锁存器也可以用与非门来设计，如图 5.18(a) 所示。与或非门电路类似，锁存器的复位条件是 $Q=0$ 和 $bar(Q)=1$。然而，在与非门电路中，$S$ 和 $R$ 两个输入通常都是逻辑 1；$S=0$ 时锁存器置位，$R=0$ 时锁存器复位。因此，这种锁存器对有效的低输入产生响应，如图 5.18(b) 中的 $S$ 和 $R$ 两输入端的小圆圈所指示的。对于与非门结构的 SR 锁存器，禁止条件是 $S=R=0$，因为这会导致 $Q=bar(Q)=1$。
