// SOURCE PDF PAGE 422; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第422页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("HERA SPICE 的简要介绍               403")

#text("param ( 参数)                         所有参数声明必须以此开头\nparanname ( 参数名)                参数的名称 ! 例如 Supply. Length A Delay)\nealnumber ( 实数)                 参数的值 ( 例如12，0tu，iOn )")

#text("下面的例子访明了一个叫“Supply”的参数,其值为 18 注意,赋值没有单位如果 Supply\n被赋予一个电压源，那么该电压源的值是 1.8 V; 如果 Supply 被赋予一个电感， 那么该电感的值\n是18H")

#text("-param          Supply=1.8")

#text("库")

#text("库中包括了设计电路时使用的特定工艺的 MOS 模型的所有参数值，过去用户可以设羊模\n型参数、例如栅氧化层的厚度 、结电容和挫杂水平等，然而，一个模型有非常多的参数，并且与\n代工服务紧密相关，现在都保存在库文件里、用户不应该调整这些值，但是应该通过生成典型的\n电流-电压 ( /Y) 曲线检查模型以确保模型库的一致性")

#text("库的声明用.lib 命令“对库的调用的句法是:")

#text(".lib         ‘<filepath> filename'")

#text("Lib                         所有的库调用必须以此开头")

#text("得lepach ! 文件路径 ) 这是库文件所在的位置，如果库文件与卡片组进行编译的文件炎不相同则应\n该输入此路径”如果库文件在父日录中之一时可以使用\"六，如上所示、 必须把\n路径和名字放在单引号里")

#text("Filename ( 文件名)    这是库文件的名字- 如果库文件在父目孙中之一则可以用\".广，如上所未,必须\n把路径和名字放在单引号里")

#text("下面的例子包含了一个叫做 bsim3v3.cmos.18um 的库，位于当前卡片组的父日录里")

#text("lib *../bsim3v3.cmos.18um’\n用和单位说明器件尺寸")

#text("SPICE 提供了一个.opt 比例命令，从而可以更方便地用A单位表示 MOS 唱体管的物理尺寸\n该尺寸将用如下所示的值进行等比缩放")

#text("opt scale = length")

#text("opt scale        摘述声明必须以此开头\nLength            公制人单位的什\n下面的例子设置人的值为 0.1 hm，")

#text("opt scale=0.1um")

#text("在后面的撒述中如果使用如下的一行，\nMn 3 2 0 0 nmos L=2 W=4 as=20 ps=4 ad=20 pd=4")

#text("A522 BEY — ARIE HYL = 2A,        IA, AS= 2047, PS= 4A, AD= 20° 3E PD = 4A,\n为scale = 0.1 Hm，所以将和下面一行的效果相同，")
