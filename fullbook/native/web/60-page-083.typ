// Source PDF 083 / printed 64. Bibliography and P2.1 source parameter table.
#import "../figures/mos-ch2-end-native.typ": mos-four-caps
#set document(title:"第2章 · MOS电容连接图、参考文献与习题P2.1 · PDF083")
#set text(lang:"zh")
= 第2章 · 印刷第64页

#mos-four-caps()

*第2章 MOS 电容的三个工作区等效网络。* 电容取值及其对漏、源和体端的分配由上一页小结表决定。原扫描给出了三幅含 $C_("ol")$、$C_("jDB")$、$C_("jSB")$ 的电路图。

== 2.10　参考文献

1. A. S. Grove, *Physics and Technology of Semiconductor Devices*, Wiley, New York, 1967.
2. R. S. Muller and T. Kamins, *Device Electronics for Integrated Circuits*, 2nd ed., Wiley, New York, 1986.
3. S. M. Sze, *Physics of Semiconductor Devices*, 2nd ed., Wiley-Interscience, 1981.
4. K-Y Toh, P-K Ko, and R. G. Meyer, “An Engineering Model for Short-Channel MOS Devices,” *IEEE Journal of Solid-State Circuits*, vol. 23, no. 4, August 1988.
5. T. Sakurai and A. R. Newton, “Alpha-Power Law MOSFET Model and Its Applications to CMOS Inverter Delay and Other Formulas,” *IEEE Journal of Solid-State Circuits*, vol. 25, no. 2, pp. 584–594, April 1990.
6. J. Meyer, “MOS Models for Circuit Simulation,” *RCA Review*, vol. 32, pp. 42–63, 1971.
7. D. Ward and R. Dutton, “A Charge-Oriented Model for MOS Transistor Capacitances,” *IEEE Journal of Solid-State Circuits*, vol. SC-13, pp. 703–708, 1978.
8. N. Arora, *MOSFET Models for VLSI Circuit Simulation*, Springer-Verlag, 1993.

== 2.11　习题

*P2.1*　表 P2.1 给出一个0.13 μm工艺的典型参数。根据参数求 NMOS 和 PMOS 的阈值电压。

*表P2.1　0.13 μm加工工艺参数*

#table(columns:(2.0fr,1.0fr,1.0fr,1.0fr),inset:(x:2.5pt,y:1.5pt),
 table.header([*参数*],[*符号*],[*NMOS*],[*PMOS*]),
 [栅氧化层厚度],[$t_("ox")$],[22 Å],[22 Å],
 [多晶硅施主掺杂],[$N_D$],[$3 times 10^20$],[—],
 [多晶硅受主掺杂],[$N_A$],[—],[$3 times 10^20$],
 [p型衬底掺杂],[$N_A$],[$3 times 10^17$],[—],
 [n阱掺杂],[$N_D$],[—],[$3 times 10^17$],
 [表面固定电荷数量],[$N_("SS")$],[$6 times 10^11$],[$6 times 10^11$],
)

*P2.1(a)*　计算未注入零偏压阈值 $V_("T0")$，假定氧化层体内无电荷，但在 Si–SiO₂ 界面具有表中面电荷（以 $q N_("SS")$ 计算）。

_表中掺杂浓度单位为cm⁻³，固定电荷单位为cm⁻²；本页参考文献8项已对照扫描重排。_
