// SOURCE PDF 297 / printed 278. Partial source-guided editable transcription.
// Figures and complete text are not 1:1 accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8
#set document(title:"第8章·半导体存储器设计·PDF297")
#align(center)[#text(size:8pt,weight:"bold")[278　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

#figure8(4)
#align(center)[*图8.4　(a)与门及(b)或非门译码器（逻辑结构草图）*]

图8.4的译码器同时需要原变量与反变量，并对不同输入编码输出对应的独热（one-hot）信号。左侧地址线沿列方向分配，右侧对应译码门分别驱动输出。

#figure8(5)
#align(center)[*图8.5　六输入门的两级译码结构（可编辑图元）*]

图8.5(a)使用三个二输入子门构成预译码，再由三级输入逻辑组合；图8.5(b)使用两个三输入预译码支路及相应二输入末级。两种方案需要同时比较门的逻辑强度、分支强度、驱动负载和布线延迟。原书的每个门输入极性及连接位置仍待逐线复核。
