// SOURCE PDF PAGE 422 / printed page 403
// Scan-guided editorial syntax and native table reconstruction.
#set document(title:"附录A SPICE .param .lib .opt scale · PDF422")
= 附录 A · 印刷第403页
== A.3.2　各种全局参数的设置（续）
=== 参数

#table(columns:(1fr,3fr),inset:3pt,
table.header([*字段*],[*含义*]),
[`.param`],[参数声明的指令前缀],
[`paramname`],[参数名称，如 Supply、Length、Delay],
[`realnumber`],[参数数值，如 1.2、0.1u、10n],
)

#raw(".param Supply=1.8", block: true)

参数值 1.8 本身不附单位；若把它赋给电压源，数值按 V 解释，赋给电感则按 H 解释。

=== 模型库

模型库保存工艺相关的 MOS 参数。原书提示用户检查模型库是否与模拟条件一致，不应随意修改代工提供的模型参数。

#raw(".lib '<filepath>filename'\n.lib '../bsim3v3.cmos.18um'", block: true)

调用路径取决于网表、库文件在本地的相对位置；路径与文件名按原书语法使用引号。

=== 用 λ 单位说明器件尺寸

#raw(".opt scale=0.1um\nMn 3 2 0 0 nmos L=2 W=4 as=20 ps=4 ad=20 pd=4", block: true)

上述语句把几何长度尺度设为 $0.1 " μm"$。因而 $L=2 lambda=0.2 " μm"$、$W=4 lambda=0.4 " μm"$，面积参数的量纲是面积而不是长度。

_原书本页给出另一行按物理单位展开的等效 MOS 描述，接续在下一扫描页。_
