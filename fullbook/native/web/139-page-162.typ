// SOURCE PDF PAGE 162 / printed 143
#import "../figures/ch4-delay-tristate-native.typ": inverter-chain
#set document(title:"第4章 · 图P4.2与习题P4.2—P4.6 · PDF162")
= 第4章 · 印刷第143页

== P4.2　反相器的高低输出电平

计算图P4.2四种电路的 $V_("OH")$ 和 $V_("OL")$。它们分别是电阻上拉、饱和NMOS上拉、线性NMOS上拉和CMOS反相器，每个电路的输出连接一个电容。图中电源为1.2 V；线性上拉栅极偏置为1.6 V。

== P4.3　CMOS器件尺寸与噪声容限

两个反相器的晶体管尺寸为：

#table(columns:(1fr,1.35fr,1.35fr),table.header([*器件*],[*PMOS宽度*],[*NMOS宽度*]),
[电路A],[$W_P=16 lambda$],[$W_N=4 lambda$],
[电路B],[$W_P=8 lambda$],[$W_N=4 lambda$])

计算 $V_("IL")$ 和 $V_("IH")$，比较两者多源噪声容限 $"NM_H"$ 和 $"NM_L"$。

== P4.4　饱和增强型负载反相器

一只饱和增强型NMOS负载反相器的上拉和下拉器件宽度均为 $W=4lambda$。计算 $V_("OH")$、$V_("OL")$、$V_("IH")$ 与 $V_("IL")$；将结果与SPICE模拟比较，说明差异原因。

== P4.5　改变CMOS切换电平

设计一只CMOS反相器，使其切换电平 $V_S=2/3 V_("DD")$。求相应的 $W_P/W_N$。

== P4.6　反相器链的噪声传播

图P4.6(a)给出串接的八级反相器。图P4.6(b)中，每只CMOS反相器 $W_P=0.2 " μm"$、$W_N=0.1 " μm"$、$L_P=L_N=0.1 " μm"$，电源1.2 V。

#inverter-chain()

当输入为0时，原本第一级输出为1.2 V；若输入由于噪声提高到0.45 V，求随着级联反相器增加，输出偏离正确值的情况，直到输出误差小于2%。后续具体题问见下一页。
