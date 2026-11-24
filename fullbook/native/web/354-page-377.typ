// SOURCE PDF PAGE 377. Scan-guided native Typst selection, not a 1:1 accepted page.
// Printed textbook page 358; topology/plot curves remain editorial abstractions.
#import "../figures/ch10-inductance-antenna-native.typ": fig1020,fig1021,fig1022,fig1023,fig1024,fig1025,fig1026,fig1027,fig1028
#set document(title:"第10章·串扰、RLC和天线效应·源PDF377")
#set text(size:7.1pt)
#show par: set par(leading:2.25pt,spacing:3.3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[358　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

继续讨论图10.24中两种阶跃响应：阻性终端较大时波形单调，阻性终端小于线路特征阻抗时可出现反射振铃。

#fig1024()
#align(center)[*图10.24　RC 单调响应与 RLC 振铃的概念曲线（非原图实测数据）*]

对于给定工艺参数，教材将电感效应显著的导线长度条件整理成上界：

#align(center)[$l_"max" < (2 / R_"int") sqrt(L_"int" / C_"int") quad (10.23)$]

信号沿长度为 $l$ 的导线往返传播时间为：

#align(center)[$t_"roundtrip" = 2 T_0 = 2 l sqrt(L_"int" C_"int") quad (10.24)$]

其中 $T_0=l sqrt(L_("int") C_("int"))$ 是单程飞行时间（time of flight），$2T_0$ 是线路往返传播时间。原书图 10.24 将单调波形的 10%–90% 上升时间与欠阻尼波形的过冲、欠冲和稳定时间 $t_s$ 放在同一张图中比较。

如果输入信号上升时间足够短，传输线的行波和反射就不可忽略。教材给出的条件：

#align(center)[$t_r < 2 l sqrt(L_"int" C_"int") quad (10.25)$]

将其改写为线长下界：

#align(center)[$l_"min" > t_r / (2 sqrt(L_"int" C_"int")) quad (10.26)$]

这说明边沿时间和互连线传播时延必须一起考虑。仅凭导线总电阻和总电容，不能保证解释所有高速瞬态现象。
