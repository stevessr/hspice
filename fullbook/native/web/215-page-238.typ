// SOURCE PDF PAGE 238, printed 219. Figure6.27 and derivations.
#import "../figures/ch6-logical-effort-native.typ": fig627
#set document(title:"第6章 · 逻辑强度两种计算方法 · PDF238")
#align(center)[#text(size:8pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　　219]]
#line(length:100%,stroke:.5pt)

也可以用另一种方法来计算LE。如果把 $tau$ 的定义和 $C_("load")$ 相乘，可以得到：

#align(center)[$tau times C_("load")=R_("eff") C_("in") C_("load")=R_("eff") C_("load") C_("in")$]

#align(center)[$therefore "LE"=((R_("eff") C_("load") C_("in"))_("gate"))/((R_("eff") C_("load") C_("in"))_("inv"))$]

使用这种形式，就有了另外两种计算逻辑强度的方法：

+ 设置反相器的延迟和逻辑门的延迟相等，然后取输入电容比。
+ 设置相同的输入电容值，然后取延迟比。

第一种方法借助图6.27来说明。其中，为了方便忽略了宽度值。为了与反相器有相同的延迟，与非门和或非门的尺寸进行了调整。因此，可以使用输入电容比。考虑输入A：

对于与非门：

#align(center)[$"LE" = ((C_("in"))_("nand"))/((C_("in"))_("inv")) = (2+2)/3 = 4/3$]

对于或非门：

#align(center)[$"LE" = ((C_("in"))_("nor"))/((C_("in"))_("inv")) = (4+1)/3 = 5/3$]

#fig627()
#align(center)[*图6.27　延迟相等时各个门的逻辑强度的计算*]

第二种方法借助图6.28来说明。其中，图6.27中器件的尺寸按相同的比例进行了调整，以使三个门的输入电容都相等。这是可以做到的，因为如果所有器件的尺寸按相同的比例进行调整，则一个门的LE不会改变。因为具有相同的输入电容，所以可以用延迟比来获得LE的值。

对于与非门，串联的两个下拉器件的尺寸均为3/2。合起来相当于一个尺寸为3/4的等效器件。等效电阻为$(4/3)R_("eff")$。因此，

#align(center)[$"LE"_("nand")=((4/3)R_("eff") C_("out"))/(R_("eff") C_("out"))=4/3$]

对于或非门，尺寸为3/5的下拉器件的等效电阻是$(5/3)R_("eff")$。因此，

#align(center)[$"LE"_("nor")=((5/3)R_("eff") C_("out"))/(R_("eff") C_("out"))=5/3$]

实际上，现在计算的是有相同输入电容的门的驱动电阻之比。这种方法比第一种方法稍微复杂一些，但是可以在已知两个门的输入电容相等的情况下使用。