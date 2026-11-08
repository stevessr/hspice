// SOURCE PDF 304 / printed 285. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF304")
#align(center)[#text(size:8pt,weight:"bold")[285　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

*例8.2（续）*

原书继续依据工艺模型与电流平衡反推下拉管和存取管的具体宽度。扫描中的尺寸与经验比值存在排版下标，待复核原图后录入为正式公式。本例说明：仅满足速度约束可能导致晶体管宽度对大容量SRAM来说过大，因此实际设计要把单元面积作为主要约束，重新协调读稳定性和延迟。

教材在式（8.3）给出了单元晶体管比例的经验规则，随后优化尺寸以获得合理的噪声容限。

=== 8.3.3　写操作

写操作由输入数据将一条位线预先拉低，字线随后升高，使存取晶体管与单元内上拉器件形成竞争。写驱动必须把内部节点压到反相器转换点以下，交叉耦合反馈才会再生、翻转并保持新的存储值。

#figure8(11)
#align(center)[*图8.11　6T SRAM单元的写操作与时序图（可编辑框图）*]

写器件比（write ratio）与单元比的要求可能相互制约，因而应同时校验读稳定性和可写性。
