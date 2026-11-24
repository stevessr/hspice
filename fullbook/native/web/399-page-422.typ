// SOURCE PDF PAGE 422 / printed page 403
// Scan-backed native transcription: .param, .lib, lambda/scale and MOS geometry (2026-11-08).
// Editable semantics checked against scan, original line breaks and glyph positions not yet 1:1.
#set document(title:"附录A · 参数／库／尺度完整语法 · PDF422")
= 附录 A · 印刷第403页

== A.3.2　各种全局参数的设置（续）

=== 参数

#table(columns:(1.2fr,3.3fr),inset:(x:4pt,y:2pt),stroke:none,
 [*param（参数）*],[所有参数声明必须以此开头],
 [*paramname（参数名）*],[参数的名称（例如 Supply、Length 和 Delay）],
 [*realnumber（实数）*],[参数的值（例如 1.2、0.1u、10n）],
)

下面的例子声明了一个叫“Supply”的参数，其值为 1.8。注意，赋值没有单位。如果 Supply 被赋予一个电压源，那么该电压源的值是 1.8 V；如果 Supply 被赋予一个电感，那么该电感的值是 1.8 H。

#raw(".param Supply=1.8",block:true)

=== 库

库中包括了设计电路时使用的特定工艺的 MOS 模型的所有参数值。过去，用户可以设置模型参数，例如栅氧化层的厚度、结电容和掺杂水平等。然而，一个模型有非常多的参数，并且与代工服务紧密相关，现在都保存在库文件里。用户不应该调整这些值，但是应该通过生成典型的电流—电压（I-V）曲线检查模型以确保模型库的一致性。

库的声明用 .lib 命令，对库的调用句法是：

#raw(".lib    '<filepath> filename'",block:true)

#table(columns:(1.35fr,3.7fr),inset:(x:4pt,y:2pt),stroke:none,
 [*.lib*],[所有的库调用必须以此开头],
 [*filepath（文件路径）*],[库文件所在的位置；相对路径可使用 ./ 表示当前目录或 ../ 表示上级目录],
 [*filename（文件名）*],[库文件的名字；路径和名字放在单引号里],
)

下面的例子包含了一个叫做 bsim3v3.cmos.18um 的库，位于当前卡片组的父目录里：

#raw(".lib '../bsim3v3.cmos.18um'",block:true)

=== 用 λ 单位说明器件尺寸

SPICE 提供了一个 .opt 比例命令，从而可以更方便地用 $lambda$ 单位表示 MOS 晶体管的物理尺寸。该尺寸将用如下所示的值进行等比缩放：

#raw(".opt scale = length",block:true)

#table(columns:(1.1fr,3.9fr),inset:(x:4pt,y:2pt),stroke:none,
 [*.opt scale*],[描述声明必须以此开头],
 [*length*],[公制 $mu$ 单位的值],
)

下面的例子设置 $lambda$ 的值为 0.1 μm：

#raw(".opt scale=0.1um",block:true)

在后面的描述中如果使用如下的一行：

#raw("Mn 3 2 0 0 nmos L=2 W=4 as=20 ps=4 ad=20 pd=4",block:true)

将会解释为一个晶体管的 $L=2lambda$、$W=4lambda$、$"AS"=20lambda^2$、$"PS"=4lambda$、$"AD"=20lambda^2$，并且 $"PD"=4lambda$。因为 scale = 0.1 μm，所以和下一扫描页以物理尺寸直接给出的写法等效。
