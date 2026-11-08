// SOURCE PDF PAGE 278 / PRINTED 259. Scan-backed editable excerpt, not 1:1 accepted.
#import "../figures/ch7-domino-continuation-native.typ": fig-example77
#set document(title:"第7章·多米诺门级联与例7.7加法器·PDF278")
#align(center)[#text(size:8pt,weight:"bold")[第7章　传输门和动态逻辑设计　　　　　　　　　　　　259]]
#line(length:100%,stroke:.55pt)

高电平足够长的时间以使逻辑电平能够通过整个电路链。因此，多米诺逻辑使用的是一个不对称的时钟，该时钟有较大的占空比（时钟为高的比例）。传播延迟是每一个动态块延迟和反相器延迟的总和。动态块的下降沿和反相器输出的上升沿是决定电路速度时关注的转换。

事实上，设计多米诺级时应该使动态门具有较强的下拉能力且使静态反相器具有较强的上拉能力。对于动态门，应增加 NMOS 器件尺寸；对于反相器，为了加速输出上升沿，可以增加 PMOS 器件尺寸。尺寸调整会使反相器的转换阈值相对于传统反相器有所偏斜，也有利于第一个节点较早越过转换阈值。

多米诺逻辑同时节省功耗，只在预充与求值阶段切换电路内部节点；由于从 $V_("DD")$ 到地之间没有直接的通路，不存在短路电流功耗。此外，输入只由低电平转换到高电平，可有效消除毛刺。

多米诺逻辑的一个缺点是只能实现非反相的功能，因为反相器输出在求值阶段只可能由低升高。实现反相功能时可以将某个所需输出变为输入的非反相信号，或通过互补输入与预充门形成对应的逻辑。

*例7.7　用多米诺逻辑实现加法器功能*

*问题：* 在多米诺逻辑中实现功能 $"sum"=a xor b xor c$。设 $a,overline(a),b,overline(b)$ 可以作为门的稳定输入。

*解答：* 需要用多米诺门产生 $a$ 与 $b$ 的异或和同或逻辑，并把它们加入第三个异或门。为了实现这些功能，需要 $X$ 的正值及其反值。

#align(center)[$X=a overline(b)+overline(a)b$]
#align(center)[$overline(X)=a b+overline(a)overline(b)$]
#align(center)[$"sum"=c overline(X)+overline(c) X$]

#fig-example77()
#align(center)[*例7.7　两级互补逻辑与末级求和（可编辑结构图）*]