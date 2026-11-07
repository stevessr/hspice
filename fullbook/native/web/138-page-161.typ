// SOURCE PDF PAGE 161 / printed 142
#set document(title:"第4章 · 参考文献与习题P4.1 · PDF161")
= 第4章 · 印刷第142页

== 4.11　参考文献

1. S. M. Kang and Y. Leblebici, *CMOS Digital Integrated Circuits, Analysis and Design*, 3rd ed., McGraw-Hill, New York, NY, 2003.
2. J. Rabaey, *Digital Integrated Circuits: A Designer Perspective*, 2nd ed., Prentice-Hall, Upper Saddle River, NJ, 2003.
3. H. Veendrick, *Deep-Submicron CMOS ICs*, 2nd ed., Kluwer Academic Publishers, Boston, MA, 2000.
4. J. P. Uyemura, *CMOS Logic Circuit Design*, Kluwer Academic Publishers, Boston, MA, 1999.

== 4.12　习题

所有习题使用0.13 μm工艺参数，适当修改后也可以使用0.18 μm工艺。

*P4.1*　图P4.1展示反相器的不同实现方式，每种输出端均有一个电容负载。

(a) 当输入为高电平时，哪个电路消耗静态功耗？

(b) 当输入为低电平时，哪个电路消耗静态功耗？

(c) 哪些电路的 $V_("OH")$ 为1.2 V？

(d) 哪些电路的 $V_("OL")$ 为0 V？

(e) 哪些电路的性能取决于器件的尺寸？

#table(columns:(.8fr,1.7fr,1.8fr),
table.header([*图P4.1*],[*上拉负载*],[*下拉器件*]),
[(i)],[10 kΩ电阻，1.2V供电],[NMOS，W=1 μm，L=0.1 μm],
[(ii)],[栅漏短接的NMOS，W=0.1 μm，L=0.1 μm],[NMOS，W=1.2 μm，L=0.1 μm],
[(iii)],[独立1.6V栅偏NMOS，W=0.1 μm，L=0.1 μm],[NMOS，W=1 μm，L=0.1 μm],
[(iv)],[PMOS互补上拉（CMOS结构）],[NMOS，W=0.1 μm，L=0.1 μm],
)

*图P4.1* 四幅器件连接图需按原扫描的上拉门极接线进一步逐元重绘；这里保留问题条件和器件参数的可编辑表格，不将表格冒充原图。

_本页四条参考文献逐项对照；习题只录原题，不添加解答。_
