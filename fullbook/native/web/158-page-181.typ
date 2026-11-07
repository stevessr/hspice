// SOURCE PDF PAGE 181 / printed 162
#import "../figures/ch5-complex-sequential-native.typ": xor-xnor
#set document(title:"第5章 · 异或与同或门图5.14 · PDF181")
= 第5章 · 印刷第162页
== 5.4　异或门和同或门
数字集成电路中重要的异或XOR与同或XNOR逻辑函数：
$ f_("XOR")=bar(a) b+a bar(b) $
$ f_("XNOR")=bar(a) bar(b)+a b $
XOR当两输入不同输出1，XNOR当两输入相同输出1。
#xor-xnor()
*图5.14*　(a)异或门、(b)同或门的静态实现；原图以各类晶体管的串并联结构体现两条导通路径。
静态CMOS实现通常需要同时提供a、b及其互补信号。在某些实现中，附加PMOS连线是冗余的，设计可以在不改变逻辑功能的条件下优化布局；但必须进一步确认器件尺寸、导通路径和寄生电容。
本页的布尔逻辑及功能可编辑，晶体管级原图连线仍需重绘与源页核对。
