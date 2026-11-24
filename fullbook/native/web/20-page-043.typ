// SOURCE PDF PAGE 043 / printed page 24
// Scan-based SOC text, chapter conclusion, and full references 1–4.
#import "../figures/chapter1-ending.typ": soc-blocks
#set document(title: "第1章 · SOC实例、小结及参考文献 1–4 · PDF043")
#set text(lang: "zh")

= 第1章 · 印刷第24页

理器（DSP，digital signal processing）核、用户定义的逻辑（UDL）、一些编译存储器（ROM、RAM）和一个模拟的 IP 核。因为这些核都是预设计块，并且逻辑和存储器部分是自动综合的，所以这个设计可以获得比前几代设计更高的生产力来构造。

#soc-blocks()

*图 1.24　SOC 设计的实例。* 原扫描页是一幅芯片显微照片，标注 MCU、ROM、DSP、RAM、UDL 和模拟功能区；此图用可编辑 Typst 功能方框标注，不冒充原始芯片照片。

当然，任何一种新方法都必须具有一套新的与之相关的 CAD 工具、标准和设计流程。设计师们必须采用这种设计芯片的新方法。当然，存在“制造和购买”、许可证、学习时间、成本、命名等商业问题，这些都是 SOC 设计取得成功的障碍。这些问题的解决需要时间，而工业界已经积极着手研究解决方案。这样或那样的 SOC 设计体系一定会出现，并将半导体产业推向能够在一块芯片上利用数十亿只晶体管的未来。

== 1.7　小结

20 世纪 70 年代，门级设计技术允许设计师在更高的层次上开始思考数字电路。在 VLSI 时代，芯片设计师成了系统级设计师，他们使用 ASIC 设计流程实现芯片（通常使用第三方流程）。随着工艺继续按比例缩小，深亚微米的问题涌现出来，需要系统级设计和物理设计团队之间密切结合，才能生产出能够工作的电路。随着系统芯片技术的到来，芯片设计师继续转向越来越高的抽象级别。然而，本章中提到的关于深亚微米问题的总体看法将迫使设计师们回到硅的层次。未来的设计师们必须能够在上面描述的所有问题都出现的情况下，以成本和时间可以接受的方式设计出能够工作的芯片。

如今存在着一个设计差距，这是因为设计趋势转向越来越高水平的抽象，而问题实际上却仍然存在于更低的层次。本书讨论电路设计的基本原理，作为缩小设计差距的桥梁。希望未来的集成电路设计师们能够通过学习和研究本书的资料，精心准备，迎接即将面临的挑战。

== 1.8　参考文献

1. J. Rabaey, A. Chandrakasan, and B. Nikolic, *Digital Integrated Circuits—A Design Perspective*, 2nd ed., Prentice-Hall, New Jersey, 2003.

2. N. Weste and K. Eshraghian, *Principles of CMOS VLSI Design*, Addison-Wesley, Reading, MA, 1993.

3. H. Veendrick, *Deep-Submicron CMOS ICs*, 2nd ed., Kluwer Academic Publishers, Boston, 2000.

4. M. Keating and P. Bricaud, *Reuse Methodology Manual*, 3rd ed., Kluwer Academic Publishers, Boston, 2002.

#text(size: 7pt, fill: gray)[参考文献 1–4 的书名、作者、版次、出版地和年份已按 PDF043 恢复；其余 5–9 项接 PDF044。原图1.24照片和排印几何尚待严格验收。]
