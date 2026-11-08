// SOURCE PDF PAGE 343. Scan-guided original Typst excerpt and editable schematics.
// Not full-page 1:1 accepted; transistor topology and page geometry provisional.
#import "../figures/ch9-nonvolatile-ch10-interconnect-native.typ": figure9late
#set document(title:"第9章·非易失存储器·PDF343")
#align(center)[#text(size:8pt,weight:"bold")[324　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

外部栅2上的电压变化，通过串联电容耦合至内部浮栅1：

#align(center)[$Delta V_(G1) = (C_2 Delta V_(G2))/(C_1+C_2)$]

由此可写出式（9.1）的浮栅电压：

#align(center)[$V_(G1,"new") = V_(G1,"old") + (C_2 (V_(G2,"new")-V_(G2,"old")))/(C_1+C_2) quad (9.1)$]

在没有浮栅存储电荷且初始电压均为零的理想情况下，需要 $V_(G1) >= V_T$ 才能打开导电沟道，因而

#align(center)[$(C_2 V_(G2))/(C_1+C_2) >= V_T$]

教材扫描印刷的最后一行分式是：

#align(center)[$V_(G2) >= ((C_1+C_2) V_T)/C_1$]

#text(size:8pt,fill:rgb("#805c2a"))[校勘记录：本页前面的耦合分式使用 $C_2$ 作为分子，以上印刷结果却把分母写为 $C_1$。直接代数推导应得到分母 $C_2$；此处保留原书印刷形式，差异列入独立核对清单。]

EPROM编程利用热载流子注入，在浮栅上累积负电荷，提高阈值；擦除通过紫外光使阈值回落。图9.23的漏电流-外部栅压曲线展示两个阈值：未编程为较低阈值 $V_(T0)$，编程后为较高的 $V_(T1)$。

#figure9late(23)
#align(center)[*图9.23　编程和擦除EPROM器件时阈值电压的变化（编辑曲线草图）*]
