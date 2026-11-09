# 电路图解总览

本页集中展示复习资料中的器件结构、逻辑网络及特性曲线。图示均用于**教学解释和阅读识别**：曲线为定性示意，并非从指定工艺库提取的仿真测量结果；以功能方框表示的 MOS 管及逻辑单元，不应误认为可直接制造的晶体管版图。

## MOS 器件与特性

### 常用元器件和供电节点

![常用无源元件、独立电压源及地](./assets/figures/05-components.svg)

对应 [MOS 基础与电压定义](./content/chapters/02-mos-basics.md)。阅读电路图时应先识别参考地，再核对器件连接关系。

### NMOS 与 PMOS 四端节点

![MOS 的 D G S B 节点](./assets/figures/06-mos-terminals.svg)

**教材对照：**图 2.1（印刷第 30 页）的 NMOS 无栅极反相圆圈，D 在上、S 在下；图 2.2（印刷第 31 页）的 PMOS 栅极有圆圈，S 在上、D 在下。两种器件均标出右侧体端 B。HSPICE 独立四端 MOS 实例按 D、G、S、B 排列；子电路接口顺序以 `.subckt` 定义为准。

### NMOS 输出特性族

![NMOS 输出特性族](./assets/figures/01-nmos-output.svg)

横轴为 $V_{DS}$、不同曲线对应不同 $V_{GS}$ 时是输出特性族。课程中还要求区分扫描 $V_{GS}$ 所得的转移特性。

### 电阻负载反相器的负载线

![电阻负载反相器负载线](./assets/figures/02-load-line.svg)

负载线与器件特性曲线交点决定直流工作点。参见 [反相器与噪声容限](./content/chapters/04-inverters-noise.md)。

## CMOS 反相器与逻辑门

### CMOS 反相器

![CMOS 反相器的节点拓扑](./assets/figures/07-cmos-inverter.svg)

依据教材图 1.11（印刷第 14 页）和图 4.12（印刷第 128 页）重绘：上方 PMOS 的 S、B 接 VDD，下方 NMOS 的 S、B 接 GND；两管栅极共同接 Vin，两管漏极共同接 Vout，输出并联负载电容。PMOS 栅极反相圆圈不可省略。

### CMOS 电压传输曲线

![CMOS 电压传输曲线](./assets/figures/03-cmos-vtc.svg)

VTC 可用于识别输入高低电平、转换区以及噪声容限。

### 静态逻辑网络与功能门

![课程逻辑门网络](./assets/figures/04-gate-networks.svg)

![二输入 NAND 与 NOR 网络](./assets/figures/08-nand-nor-networks.svg)

NAND2 的 NMOS 串联、PMOS 并联；NOR2 的 NMOS 并联、PMOS 串联。现已改用教材式晶体管电路图符，而非 P(A)、N(A) 功能方框。同名 A、B 栅端代表相同输入信号；逻辑网络图省略了体端连线，PMOS 体端接 VDD、NMOS 体端接 GND。

### XOR 与 2:1 选择器

![异或门与二选一选择器](./assets/figures/12-xor-mux.svg)

本文采用 $S=1$ 选 A、$S=0$ 选 B 的约定，故选择器函数为 $F=AS+B\overline{S}$。参见 [组合逻辑](./content/chapters/06-combinational-logic.md)。

## 时序逻辑与动态特性

### SR 锁存器

![交叉反馈 NAND 型锁存器](./assets/figures/09-sr-latch.svg)

交叉反馈的两只 NAND 门组成低有效 SR 锁存器。判断时应分别检查输入有效电平和输出互补关系。

### 主从 JK 触发器

![两级锁存器主从结构](./assets/figures/10-jk-master-slave.svg)

图示强调主、从级联和互补时钟，不包含内部所有门级反馈路径；外部触发沿必须结合实际结构判断。

### RC 延迟近似

![等效 RC 模型](./assets/figures/11-rc-delay.svg)

在一阶等效模型中，传播延迟随输出等效电阻及总负载电容增大而增长；真实 CMOS 延迟还需由器件模型验证。

---

**建议下一步：**先完成 [专题实践题](./content/practice/index.md)，再使用 [在线自测](./quiz.md)检查核心概念；需查看课程原始记录时可进入 [PDF 资料页](./pdf.md)。
