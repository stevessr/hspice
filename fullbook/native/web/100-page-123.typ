// SOURCE PDF PAGE 123 / printed 104. Chapter 3 original references and exercise 3.1.
#import "../figures/ch3-end-native.typ": spice-nmos-iv-test
#set document(title:"第3章 · 参考文献和P3.1 NMOS参数提取 · PDF123")
#set text(lang:"zh")
= 第3章 · 印刷第104页

== 3.10　参考文献

1. R. C. Jaeger, *Introduction to Microelectronic Fabrication*, 2nd ed. Prentice-Hall, Upper Saddle River, NJ, 2002.
2. H. Veendrick, *Deep-Submicron CMOS ICs*, 2nd ed. Kluwer Academic Publishers, Boston, MA, 2000.
3. D. Foty, *MOSFET Modeling with SPICE: Principles and Practice*, Prentice-Hall PTR, 1997.
4. N. Arora, *MOSFET Models for VLSI Circuit Simulation*, Springer-Verlag, 1993.
5. L. W. Nagel, “SPICE2, A Computer Program to Simulate Semiconductor Circuits,” *ERL Memorandum ERL-M520*, University of California, Berkeley, May 1975.
6. G. Massobrio and P. Antognetti, *Semiconductor Device Modeling with SPICE*, McGraw-Hill, 1993.
7. W. Liu, *MOSFET Models with SPICE Simulation including BSIM3v3 and BSIM4*, Wiley-Interscience, New York, 2001.
8. A. Vladimirescu, *The SPICE Book*, John Wiley and Sons, 1994.
9. *HSPICE User's Manual*, Synopsys Inc., Sunnyvale, CA, 1999.
10. K. Bernstein and N. Rohrer, *SOI Circuit Design Concepts*, Kluwer Academic Publishers, Boston, MA, 2000.
11. J. Plummer, M. Deal, P. Griffen, *Silicon VLSI Technology*, Prentice-Hall, Upper Saddle River, NJ, 2000.
12. J. E. Meyer, “MOS Models and Circuit Simulation,” *RCA Review*, Vol. 32, March 1971, pp. 42–63.

== 3.11　习题

对于下面给出的SPICE问题，根据可利用的条件，使用0.18 μm或0.13 μm工艺的BSIM3模型库文件。为方便，对于0.18 μm工艺，使用 $L=200 " nm"$；对于0.13 μm工艺，使用 $L=100 " nm"$。

*P3.1*　图P3.1给出一个在室温下用于长沟道NMOS晶体管LEVEL 1模型参数提取的装置。

#spice-nmos-iv-test()

*图P3.1　测量NMOS晶体管I–V特性的实验装置。*

通过该装置，测量的许多不同操作条件下的电流如表P3.1所示，数据与相关求解要求见下一页。

_本页12条参考文献按原印刷排列；实验示意保留栅、漏、体偏置及共同源接地，原图元几何尚未逐线验收。_
