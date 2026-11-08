// SOURCE PDF 296 / printed 277. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF296")
#align(center)[#text(size:8pt,weight:"bold")[277　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

#figure8(3)
#align(center)[*图8.3　随机存取存储器的时序参数（时序结构重绘）*]

== 8.2　MOS译码器

存储器的行译码器与列译码器是访问通路的基本部件，其延迟与功耗会直接影响存储器性能。行地址有 $n$ 位时，译码器产生 $2^n$ 个输出，通常在给定地址下仅有对应的一条有效。

图8.4列举与门（AND）译码器与或非门（NOR）译码器。为得到全部最小项，需要各地址变量及其互补信号。可以使用一组较大扇入的逻辑门直接实现，但串联晶体管数增多会增加延迟。

以六位地址为例，产生64条输出线；如果每条输出线直接使用六输入门，串联器件可能太多。因此常将译码拆分成预译码与最终译码两级，图8.5比较两种六输入译码分解方案。
