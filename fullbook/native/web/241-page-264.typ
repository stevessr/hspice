// SOURCE PDF PAGE 264 · PRINTED 245. MUX contentions and gate logic.
#import "../figures/ch7-transmission-mux-native.typ": fig712, fig713
#set document(title:"第7章 传输门多路器错误与AND/OR门 · PDF264")
#align(center)[#text(size:8pt,weight:"bold")[第7章　传输门和动态逻辑设计　　　　　　　　　　　245]]
#line(length:100%,stroke:.55pt)

#fig712()
#align(center)[*图 7.12　多路器形式逻辑的错误情况*]

为了用传输门构造一般的逻辑功能，第一步是选择输入信号并为所有可能的组合情况建立一个真值表。然后，可以通过对真值表的每一行产生电路中的一个信号路径从而把真值表转化成一种多路器形式的设计。下一步，把真值表中指定的所需要的输出值从数据输入端口到输出进行布线。任何需要的或操作和与操作都可以通过使用图 7.13 所示的并联和串联传输门来实现。最后，可以通过合并路径或者去除不需要的晶体管对设计进行优化。

#fig713()
#align(center)[*图 7.13　使用 CMOS 传输门实现或功能和与功能*]
