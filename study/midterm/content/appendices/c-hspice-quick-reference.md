# HSPICE 指令及模板速查

## 常用语法对照

| **关键字**     | **说明**                                                 |
|:---------------|:---------------------------------------------------------|
| `.lib`         | 引入工艺模型库及工艺角，如 `.lib 'path/to/model.lib' TT` |
| `.param`       | 定义参数，如 `.param VDDVAL=1.2`                         |
| `.option`      | 设置输出及求解选项，如 `post=2`                          |
| `M...`         | 四端 MOS 实例，顺序 D G S B，随后为模型名称与尺寸        |
| `X...`         | 子电路实例；端口顺序严格遵守对应 `.subckt` 声明          |
| `V...`         | 独立电压源，节点依次为正端和负端                         |
| `R... / C...`  | 电阻／电容，给出两端节点和阻值／容值                     |
| `.dc`          | 直流扫描，可嵌套第二组源的扫描                           |
| `.tran`        | 瞬态分析，观测随时间变化的波形                           |
| `PWL`          | 时间点与电压值依次列出，点间线性插值                     |
| `PULSE`        | `PULSE(V1 V2 TD TR TF PW PER)`                           |
| `.ic`          | 设定节点初始值，如 `.ic V(x)=0`                          |
| `.measure`     | 自动提取波形指标；具体语法参照所用版本手册               |
| `.print/.plot` | 输出所选电流、电压数据；波形可交由 AvanWaves 等查看      |
| `.end`         | 结束网表                                                 |

## 模板：反相器的 VTC 与瞬态分析

此处使用实验六中的 $0.18\,\mu\mathrm m$ 器件族写出**结构示例**，不代替真实模型文件。将库路径修改为实际位置，并检查库中是否定义所列器件子电路。

```
CMOS inverter - DC VTC
.lib 'ms018g_v1p16.lib' TT
.option post=2
Xmp out in vdd vdd p18_ckt L=0.2u W=0.8u
Xmn out in 0   0   n18_ckt L=0.2u W=0.4u
VDD vdd 0 DC 1.8
VIN in 0 DC 0
.dc VIN 0 1.8 0.01
.print dc V(in) V(out)
.end
```

**改为瞬态分析时**，将 `VIN` 改为方波 `PULSE`，将 `.dc` 替换为 `.tran`，必要时输出 `I(VDD)`。例如：

```
VIN in 0 PULSE(0 1.8 0 0.1n 0.1n 10n 20n)
CL out 0 1f
.tran 0.05n 100n
.print tran V(in) V(out) I(VDD)
```

**两段代码代表不同实验配置，不能在同一个文件里保留重名的两个 `VIN` 源。**在上述瞬态模板中，电源电流的参考方向需按仪器／SPICE 定义检查。

## 模板：带初始条件的 NMOS 充电

```
NMOS capacitor charging
.lib 'c18vmos001.lib' TT
.option post=2
Vd d 0 1.0
Vg g 0 1.2
Mn d g x 0 N_18_LL L=0.2u W=0.4u
Cx x 0 1f
.ic V(x)=0
.tran 0.1n 100n UIC
.print tran V(x) I(Vd)
.end
```

分析时先检查节点 x 的波形趋于稳定的时间与终态值，再对照 $V_G-V_X$ 和阈值模型解释。**若结果与实验资料不一致，首先检查工艺库路径、模型名、尺寸、体端、初始条件、仿真停止时间及模型角。**


## 读写网表时的快速检查

- 第一行保留标题；`*` 开头为整行注释，`+` 开头为续行。
- `V(a,b)` 表示 `V(a)-V(b)`；源端不接地时用差分电压计算 VGS 与 VDS。
- `.dc` 第一组为内层扫描，第二组形成曲线族。
- `m` 与 `M` 均表示毫；兆使用 `meg`。
- `M` 调用 `.model`，`X` 调用 `.subckt`，X 的端口顺序看声明。
- `.probe` 选择波形，`.print` 输出数值表，`.measure` 提取指标。
- `.measure tran VX FIND V(x) AT=20n` 读取 20 ns 节点电压。
- 延迟测量先配对同一次逻辑翻转的输入与输出边沿，再选阈值与计数。

逐行讲解、完整充电模板、PULSE 时序及功耗测量见[HSPICE 网表、扫描与结果判读](../chapters/08-hspice-netlists.md)。
