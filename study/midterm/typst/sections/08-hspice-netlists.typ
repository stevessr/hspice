// GENERATED FILE -- edit Markdown and run scripts/sync_typst.py
= HSPICE 网表、扫描与结果判读
<hspice-网表扫描与结果判读>
== 网表的基本构成
<网表的基本构成>
HSPICE 网表通常由标题行、元件及模型声明、电源／激励、分析控制语句与 `.end` 组成。节点名相同即表示电气连接；数字 `0` 通常表示参考地。以 NMOS 的常见独立模型写法为例：

```
NMOS output characteristic
.lib 'c18vmos001.lib' TT
.option post=2
Vd d 0 DC 1.8
Vg g 0 DC 1.2
Mn d g 0 0 N_18_LL L=0.2u W=0.4u
.dc Vd 0 1.8 0.05 Vg 0.6 1.8 0.3
.print dc V(d) V(g) I(Vd)
.end
```

#strong[阅读顺序：];确认模型与工艺角 → 判断元件端口顺序 → 识别电压源的正负端 → 确认 `.dc`／`.tran`／`.ac` → 判读输出。上面是供语法辨识的#emph[示范网表];，具体可运行性取决于实际模型文件与器件实例定义；若模型以 `.subckt` 提供，应使用 `X` 前缀调用，并与子电路的端口顺序一致。

== MOS 器件和子电路的端口顺序
<mos-器件和子电路的端口顺序>
四端 MOS 元件一般采用 $D , G , S , B$ 的顺序，例如 `Mn d g s b N_18_LL ...`。实验三至实验九中的某些 $0.13 thin mu m$ 器件定义为#strong[子电路];（如 `n15ll_mis_ckt`），对应实例以 `X` 开头。`.subckt INV in out vdd gnd` 规定了四个外部端口；`Xinv a b vdd 0 INV` 的四个位置必须逐一对应。

== 直流扫描与瞬态分析
<直流扫描与瞬态分析>
#figure(
align(center)[#table(
  columns: 3,
  align: (col, row) => (left,left,left,).at(col),
  inset: 6pt,
  [#strong[指令];], [#strong[功能与写法];], [#strong[典型用途];],
  [`.dc`],
  [`.dc Vin 0 1.8 0.01`；可再添加一组源及其扫描范围。],
  [VTC、$I_D - V$ 曲线、参数提取。],
  [`.tran`],
  [`.tran 0.1n 100n`，输出时间间隔与停止时间。],
  [电容充电、脉冲、开关电流、锁存时序。],
  [`PWL`],
  [分段线性电压源，按时间—电压点给出激励。],
  [逻辑输入组合、毛刺。],
  [`PULSE`],
  [低电平、高电平、延迟、上升、下降、高电平宽度、周期。],
  [周期性时钟、反相器切换。],
  [`.ic`],
  [指定初始节点电压；与是否采用 `UIC` 有关。],
  [初始放电的电容。],
  [`.measure`],
  [对指定区间的波形提取参数。],
  [平均功耗、延迟、终态电压。],
)]
)

#quote(block: true)[
在 `.tran` 中指定的第一时间参数通常是#emph[期望输出步长];，不能简单等同于仿真器所有内部积分步长。`UIC` 会改变初始工作点求解方式，使用不当可导致与真实上电状态不同的结果。需要精确观测快速边沿时，应检查最大时间步长、数据输出精度与收敛信息。
]

== 双重 DC 扫描的顺序
<双重-dc-扫描的顺序>
```
* Sweep VDS fast; obtain a family parameterized by VGS
.dc Vd 0 1.8 0.05 Vg 0.6 1.8 0.3
* Sweep VGS fast; obtain a family parameterized by VDS
.dc Vg 0 1.8 0.05 Vd 0.3 1.8 0.3
```

上面两条指令是#strong[互相替换的示例];，不是要求在同一个分析块中同时保留两条设置。第一扫描变量的取值逐步变化，第二扫描变量用于形成不同曲线组；在波形查看器中，还需确认横轴和选中的数据族，不能只修改网表而不检查图例。（资料对应：实验一、实验二。）

== 电流正负号、单位与模型角
<电流正负号单位与模型角>
电压源的 `I(Vd)` 通常按#strong[流入电压源正端];为正定义。在一个电源向 NMOS 提供漏电流的简单电路中，常有 $I_D = - I (V d)$，因此画面上的负电流未必是错误。电源输出功率通常可用 $- V_(D D) I (V D D)$ 表示，但需先核对激励和电流方向。

SPICE 缩写应特别注意：`m` 表示 $10^(- 3)$，`u` 表示 $10^(- 6)$，`n` 表示 $10^(- 9)$，`p` 表示 $10^(- 12)$，`f` 表示 $10^(- 15)$，`meg` 才表示 $10^6$。工艺模型的 `TT` 通常表示典型工艺角，但可用角名称须由模型库实际定义。#strong[切勿混用 0.13 与 0.18 $mu$m 模型中的实例名称和名义电源条件。]

== 逐行读懂一份 NMOS 网表
<逐行读懂一份-nmos-网表>
以下例子沿用实验一的 `N_18_LL` 模型。先把模型库放在网表所在目录，再核对库内的模型名称与 `TT` 段。节点 `d`、`g` 是人为命名；`Vdrain`、`Vgate` 是电压源实例名，扫描指令必须引用实例名。

```text
NMOS IDS-VGS sweep
* Model and output control
.lib './c18vmos001.lib' TT
.option list node post=2 probe
.temp 25
.param LCH=0.2u WCH=0.4u

* Drain, gate, source, bulk
Mn d g 0 0 N_18_LL L='LCH' W='WCH'
Vdrain d 0 DC 0.9
Vgate  g 0 DC 0

* First source: horizontal axis; second source: curve family
.dc Vgate 0 1.8 0.02 Vdrain 0.9 1.8 0.45
.probe dc V(d) V(g) I(Vdrain)
.print dc V(d) V(g) I(Vdrain)
.end
```

#figure(
align(center)[#table(
  columns: 3,
  align: (col, row) => (left,left,left,).at(col),
  inset: 6pt,
  [语句], [逐项解释], [读图时的对应关系],
  [第一行],
  [网表标题；独立网表应保留标题行],
  [不在这一行放必须执行的器件定义],
  [`* ...`],
  [整行注释],
  [用于记录电路目的、端口与实验条件],
  [`.lib './c18vmos001.lib' TT`],
  [加载指定文件中名为 `TT` 的库段],
  [决定器件模型与工艺角],
  [`.option list node post=2 probe`],
  [`list` 列出输入网表；`node` 列出节点信息；`post=2` 请求后处理波形文件；`probe` 配合 `.probe` 选择输出],
  [输出控制不改变电路连接],
  [`.temp 25`],
  [仿真温度为 25 摄氏度],
  [比较结果时温度须一致],
  [`.param LCH=0.2u WCH=0.4u`],
  [定义沟道长度与宽度参数],
  [参数名不是节点或电源名],
  [`Mn d g 0 0 ...`],
  [漏端 d、栅端 g、源端地、体端地],
  [本例中 `V(d)=VDS`、`V(g)=VGS`],
  [`L='LCH' W='WCH'`],
  [以参数表达式指定尺寸],
  [不要把 W 与 L 的位置或意义混淆],
  [`Vdrain d 0 DC 0.9`],
  [规定 `V(d)-V(0)=0.9 V`],
  [DC 扫描此电源时，扫描值替代其固定值],
  [`.dc Vgate ... Vdrain ...`],
  [内层扫栅压，外层扫漏压],
  [生成三组转移特性数据],
  [`.probe dc ...`],
  [选择保存的直流波形],
  [供波形查看器使用],
  [`.print dc ...`],
  [输出直流数值表],
  [可在列表文件中核对具体采样点],
  [`.end`],
  [结束整个网表],
  [后续电路内容应放在它之前],
)]
)

本例外层 `Vdrain` 的值依次为 0.9、1.35、1.8 V；每个漏压下，栅压从 0 扫到 1.8 V，共 91 个点。三条曲线共 273 个扫描点。绘制正向漏电流时，在查看器中选用 `-I(Vdrain)`；网表保存的原始量仍为 `I(Vdrain)`。

#strong[源端不接地时必须使用差分电压。];例如 `Mn d g x 0 ...` 中，`VGS=V(g,x)`、`VDS=V(d,x)`，不能直接把 `V(g)` 当作 VGS。体端接地时，`VSB=V(x,0)`，随源端电压升高而改变。

== 书写规则、数量级与表达式
<书写规则数量级与表达式>
元件行以实例名前缀分类：`V` 为独立电压源，`R` 为电阻，`C` 为电容，`M` 为 MOS 元件，`X` 为子电路实例。一个分析配置中，实例名应唯一；节点名可以重复，用重复名称表达导线连接。节点 `0` 是参考地，名为 `gnd` 的普通节点不会仅因名称而自动成为节点 0。

```text
* A continuation line belongs to the preceding statement
Mn d g s b N_18_LL L=0.2u W=0.4u
+ AD=0.2p AS=0.2p PD=0.4u PS=0.4u
.param SCALE=2 WBASE=0.4u
.param WIDE='SCALE*WBASE'
```

行首 `+` 把本行接到上一条语句。`AD/AS` 是漏／源扩散区面积，单位为平方米；`PD/PS` 是对应周长，单位为米。例如 `AD=0.2p` 表示 $0.2 times 10^(- 12) thin upright(m^2) = 0.2 thin mu upright(m^2)$；`PD=0.4u` 表示 $0.4 thin mu upright(m)$。面积与周长影响结电容等寄生效应，不能把它们当作沟道 W、L 的替代值。

#figure(
align(center)[#table(
  columns: 3,
  align: (col, row) => (left,left,left,).at(col),
  inset: 6pt,
  [写法], [数值], [使用示例],
  [`1k`],
  [$10^3$],
  [`R1 a 0 1k` 为 1 kΩ],
  [`1meg`],
  [$10^6$],
  [`R1 a 0 1meg` 为 1 MΩ],
  [`1m` 或 `1M`],
  [$10^(- 3)$],
  [大写 M 也不是“兆”],
  [`1u`],
  [$10^(- 6)$],
  [`W=0.4u` 为 0.4 μm],
  [`1n`],
  [$10^(- 9)$],
  [`10n` 为 10 ns],
  [`1p`],
  [$10^(- 12)$],
  [`C1 a 0 1p` 为 1 pF],
  [`1f`],
  [$10^(- 15)$],
  [`C1 a 0 1f` 为 1 fF],
)]
)

参数算式采用单引号，例如 `W='2*WBASE'`。参数名宜用 `VDDVAL`、`LCH` 等明确名称，避免与 `VDD` 电源或节点混淆。文件路径也使用引号，例如 `.include './cells/inverter.sp'`；`.include` 插入文件内容，`.lib 'file' TT` 则选择库段。两者应根据模型文件的组织方式使用。

== M 实例与 X 实例：先查看模型声明
<m-实例与-x-实例先查看模型声明>
```text
* If the library declares: .model N_18_LL NMOS ...
Mn d g s b N_18_LL L=0.2u W=0.4u

* If the library declares:
* .subckt n15ll_mis_ckt d g s b ...
XN1 d g s b n15ll_mis_ckt L=100n W=200n
```

`M` 调用 MOS 模型，`X` 调用 `.subckt` 子电路。X 实例的端口顺序由对应 `.subckt` 那一行决定；只有声明确实为 d、g、s、b 时才能按这个顺序连接。子电路还可能定义附加端口或参数，因此不能仅凭名字含有 NMOS 就替换前缀。

例如实验中的 `XP1 x a vdd vdd p15ll_mis_ckt ...`，在确认声明端口为 D、G、S、B 后，才能解释为漏端 x、栅端 a、源端与体端均接 vdd。观察 X 实例的支路电流时，优先测量串接的电压源电流；`I(XN1)` 不能直接当作所有子电路都支持的漏电流表达式。

== 用零伏电压源测量指定支路电流
<用零伏电压源测量指定支路电流>
电源总电流与单个器件的支路电流并不总是相同。例如多个门共用 `VDD` 时，`I(VDD)` 是所有供电支路的合计。需要观察其中一条支路时，可在该支路串接零伏电压源：

```text
VSENSE vdd vdd_local DC 0
Xmp out in vdd_local vdd_local p18_ckt L=0.2u W=0.8u
.probe tran I(VSENSE)
```

此处用 `Xmp` 替换原 PMOS 实例；子电路及其端口顺序沿用附录模型。`VSENSE` 两端电压为零，因此 vdd\_local 与 vdd 等电位。正电流方向由其正端 vdd 指向负端 vdd\_local，所以此处向 PMOS 支路供电时 `I(VSENSE)` 通常为正。串联测流源须插入原支路，不能并联在电源两端；每个实例名仍须唯一。

== PULSE、PWL 与时间参数
<pulsepwl-与时间参数>
```text
VIN in 0 PULSE(0 1.2 1n 0.1n 0.1n 4n 10n)
```

七个参数依次是初始电平、脉冲电平、延迟、上升时间、下降时间、高电平持续时间、周期。本例在 1 ns 开始上升，1.1 ns 到达 1.2 V，保持 4 ns，5.1 ns 开始下降，5.2 ns 回到 0 V，下一次上升从 11 ns 开始。`PW` 是到达高电平后的保持时间；有限边沿时间也占用周期。

```text
VIN in 0 PWL(0 0 1n 0 1.1n 1.2 5n 1.2 5.1n 0)
```

`PWL` 按“时间、电压”成对给出折点，相邻点之间线性插值。需要保持电平时，应在区间两端给出相同电压；只写起点与终点会得到斜坡。PWL 本例没有设置重复，不能将它按周期波形理解。

```text
.tran 0.1p 20n
```

第一项是瞬态时间步长控制参数，第二项是停止时间。HSPICE 会根据误差控制调整内部积分步长，不能把两者之比直接当作实际求解步数。比较 5 ns 与 20 ns 的充电结果时，可统一运行到 20 ns，再分别测量 5 ns 与 20 ns 的值；快速边沿与测量窗口还需要足够的时间分辨率。

== 初始条件：区分 .ic 与 UIC
<初始条件区分-.ic-与-uic>
`.ic V(x)=0` 给出节点 x 的初始电压条件。是否同时使用 `UIC`，决定瞬态开始前如何处理直流工作点：带 `UIC` 时跳过通常的初始直流工作点求解，从给定初始条件启动；不带 `UIC` 时，`.ic` 会参与初始工作点的建立。两种设置不能在比较实验结果时随意互换。

下面将实验二的 NMOS 充电条件写成完整模板：

```text
NMOS charging - initially discharged capacitor
.lib './c18vmos001.lib' TT
.option post=2 probe
.temp 25
Vdrain d 0 DC 1.0
Vgate g 0 DC 1.2
Mn d g x 0 N_18_LL L=0.2u W=0.4u
+ AS=0.2p PS=0.4u AD=0.2p PD=0.4u
Cx x 0 1f
.ic V(x)=0
.tran 0.1p 20n UIC
.probe tran V(x) V(g,x) V(d,x) I(Vdrain)
.print tran V(x) I(Vdrain)
.measure tran VX_5NS FIND V(x) AT=5n
.measure tran V20NS_A FIND V(x) AT=20n
.measure tran I20NS_A FIND I(Vdrain) AT=20n
.end
```

`FIND ... AT=...` 读取指定时刻的波形值。这里 `I20NS_A` 保留电压源电流的参考方向；若需正向漏电流，取它的相反数。充电过程中源端 x 升高，VGS 逐渐减小，同时 VSB 增大产生体效应，因此终态不能简单等同于栅压，也不能只用固定阈值估算后就认为仿真必须完全吻合。

== 用 .measure 测量反相器延迟与功耗
<用-.measure-测量反相器延迟与功耗>
使用以下配置替换附录反相器中原有的 `VIN` 与 `.tran` 行，将测量语句放在 `.end` 之前。设电源为 1.8 V、输入延迟为 1 ns、上升／下降时间为 0.1 ns、高电平宽度为 10 ns、周期为 20 ns：

```text
* Replace the original VIN; do not add a second VIN
VIN in 0 PULSE(0 1.8 1n 0.1n 0.1n 10n 20n)
.tran 0.05n 100n
.measure tran TPHL TRIG V(in) VAL=0.9 TD=20n RISE=1
+ TARG V(out) VAL=0.9 TD=20n FALL=1
.measure tran TPLH TRIG V(in) VAL=0.9 TD=20n FALL=1
+ TARG V(out) VAL=0.9 TD=20n RISE=1
.measure tran TPD PARAM='(TPHL+TPLH)/2'
.measure tran IAVG AVG I(VDD) FROM=20n TO=100n
.measure tran PAVG PARAM='-1.8*IAVG'
```

`TRIG` 指定起点事件，`TARG` 指定终点事件，结果为终点时刻减去起点时刻。`RISE=1`、`FALL=1` 分别表示满足时间限制后的第一次上穿、下穿阈值事件。反相器的输入上升对应输出下降，因此 TPHL 使用输入 RISE、输出 FALL；TPLH 则相反。这里在触发和目标两侧都设 `TD=20n`，排除启动过程，减少初始输出跳变被误计为目标事件的可能。

恒定电源下，平均供电功率为 $P_(a v g) = - V_(D D) I_(a v g)$。20—100 ns 覆盖四个完整输入周期；如果改动周期，应同步检查平均窗口。`PAVG` 的单位为 W，TPHL、TPLH 和 TPD 的单位为 s。该功率包含模型与电路所产生的供电消耗，不能直接把它全部称为负载电容动态功耗。若测量值为负或显示失败，应先检查事件次序、阈值是否被跨越、仿真是否覆盖目标事件，以及电流参考方向。

== 从输出文件判断仿真状态
<从输出文件判断仿真状态>
#figure(
align(center)[#table(
  columns: 2,
  align: (col, row) => (left,left,).at(col),
  inset: 6pt,
  [文件或现象], [应检查的内容],
  [`.lis`],
  [输入列表、错误／警告、工作点、`.print` 表格及测量信息],
  [`.st0`],
  [运行状态；仅生成这个文件不能证明分析已经完成],
  [`.sw0`],
  [常见的直流扫描波形文件，供后处理查看],
  [`.tr0`],
  [常见的瞬态波形文件，供后处理查看],
  [`.mt0`],
  [常见的瞬态测量结果文件],
  [能看到曲线但符号相反],
  [核对 `I(Vdrain)` 的参考方向与实际支路连接],
  [曲线数量不对],
  [核对外层扫描端点、步长及查看器的数据族选择],
  [电容一开始就有电压],
  [核对 `.ic`、UIC 与初始工作点设置],
  [找不到模型／子电路],
  [核对路径、库段、声明名称与 M／X 前缀],
)]
)

文件后缀与编号会随分析、输出选项和运行方式改变。排查顺序是：确认运行实际使用的网表 → 阅读 `.lis` 的首个错误 → 核对模型与节点 → 确认分析配置 → 核对波形和测量结果。调整求解容差应建立在电路与激励正确的基础上。

== 语法阅读练习
<语法阅读练习>
+ 将转移特性网表改为输出特性，要求 VDS 从 0 到 1.8 V、步长 0.02 V，VGS 分别为 0.6、0.9、1.2、1.5、1.8 V。
+ 对 `Mn d g x 0 ...`，当 `V(d)=1.0 V`、`V(g)=1.2 V`、`V(x)=0.7 V` 时，写出 VDS、VGS、VSB。
+ 为什么 `W=400n` 与 `W=0.4u` 相同，而 `W=0.4m` 不同？
+ 延迟测量使用输入 RISE 和输出 RISE 时，对反相器是否对应同一次逻辑翻转？

答案：① `.dc Vdrain 0 1.8 0.02 Vgate 0.6 1.8 0.3`；② VDS\=0.3 V、VGS\=0.5 V、VSB\=0.7 V；③前两者均为 0.4 μm，第三者为 400 μm；④不对应，反相器同一次翻转的输入与输出边沿方向相反。

== 参考与版本核对
<参考与版本核对>
指令说明依据 Synopsys《HSPICE Reference Manual: Commands and Control Options》的网表、瞬态分析与测量章节；可查阅#link("https://cseweb.ucsd.edu/classes/wi10/cse241a/assign/hspice_cmdref.pdf")[厂商手册公开副本（B-2008.09）];。实际课程使用 L-2016.06-SP1 时，以安装目录中的同版本手册及工艺库声明核对选项细节。
