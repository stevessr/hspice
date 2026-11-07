// SOURCE PDF PAGE 212 · 印刷第193页。
// 例6.1原始计算式与SPICE比较均按源扫描核对；未做整页1:1签收。
#set document(title: "第6章 · 例6.1 手工计算有效电阻 · 扫描212页")
#set text(lang: "zh")
#align(center)[#text(size:8.3pt, weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　193]]
#line(length: 100%, stroke: 0.55pt)
#v(17pt)

#text(weight:"bold")[例6.1　手工计算有效电阻]

#line(length: 100%, stroke: 0.45pt)

#text(weight:"bold")[问题：]

利用上面的等式用 0.13 μm 工艺参数计算单位尺寸器件的 $R_("eqn")$ 和 $R_("eqp")$。

#text(weight:"bold")[解答：]

对于 NMOS 器件，

#v(8pt)
#align(center)[$I_("Dsat") = (W_N v_("sat") C_("ox") (V_("DD") - V_("TN"))^2)/(V_("DD") - V_("TN") + E_C L_N)$]
#v(8pt)

#v(8pt)
#align(center)[$= ((0.1)(10^(-4))(8)(10^6)(1.6)(10^(-6))(1.2-0.4)^2)/((1.2-0.4)+0.6) approx 60 mu "A"$]
#v(8pt)

#v(8pt)
#align(center)[$therefore R_("eqn") = (1.2/2)/(0.7(60 mu "A")) approx 14.5 " kΩ"$]
#v(8pt)

对于 PMOS 器件，

#v(8pt)
#align(center)[$I_("Dsat") = (W_P v_("sat") C_("ox") (V_("DD") - abs(V_("TP")))^2)/(V_("DD") - abs(V_("TP")) + E_C L_P)$]
#v(8pt)

#v(8pt)
#align(center)[$= ((0.1)(10^(-4))(8)(10^6)(1.6)(10^(-6))(1.2-0.4)^2)/((1.2-0.4)+2.4) approx 25 mu "A"$]
#v(8pt)

#v(8pt)
#align(center)[$therefore R_("eqp") = (1.2/2)/(0.7(25 mu "A")) approx 33.5 " kΩ"$]
#v(8pt)

#line(length: 100%, stroke: 0.45pt)
#v(7pt)

把上面的结果和 SPICE 模拟结果进行比较是有趣的。事实上，到目前为止，我们在所有时序的计算中一直在使用由 SPICE 得到的结果：

#v(8pt)
#align(center)[$R_("eqn") approx 12.5 " kΩ/□"$]
#v(8pt)

#v(8pt)
#align(center)[$R_("eqp") approx 30 " kΩ/□"$]
#v(8pt)

手工计算和 SPICE 模拟结果相当一致，意味着我们的假设基本上都是正确的。SPICE 中的实际电流要比得到偏小的 $R_("eq")$ 值的手工计算中的电流稍微高一点。

从这些值中，可以通过分别将其除以每个器件的 $W/L$ 来计算 $R_N$ 和 $R_P$：

#v(8pt)
#align(center)[$R_N = R_("eqn") (L/W)_n$]
#v(8pt)

#v(8pt)
#align(center)[$R_P = R_("eqp") (L/W)_p quad "(6.6)"$]
#v(8pt)

我们将会发现 $R_P$ 和 $R_N$ 很适合于时序计算，但是这些值不能用于其他目的。这些值是从时序公式中得到的，所以只能用于时序计算的场合中。事实上，导通电阻是非线性的，而且它的值取决于所使用的电压。

== 6.2.1　再次讨论门的尺寸——速度饱和效应

我们已经讨论过门的合适尺寸问题，现在应该回过头来检查给 CMOS 与非门和或非门确定尺