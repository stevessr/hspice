# 术语速查 II：门电路、存储器、互连、时钟和 HSPICE

> 按《数字集成电路分析与设计——深亚微米工艺（第三版）》第 5—11 章及附录主题组织。术语说明为教学释义，**不冒充原书逐字转写**。HSPICE 命令为补充实用释义，具体支持范围以仿真器版本为准。

[返回总目录](/reference/) · [基础与器件术语](/reference/terms-device-process) · [数据表](/reference/data-tables)

## 第五章：静态 MOS 门电路

**原书位置：** 印刷页 148—188

| 中文专业名词 | 英文／缩写／符号 | 速查释义 |
|---|---|---|
| 静态 CMOS 门 | Static CMOS Gate | 使用互补上拉、下拉网络实现逻辑 |
| 上拉网络 | Pull-Up Network (PUN) | 导通时将输出连接电源的 PMOS 网络 |
| 下拉网络 | Pull-Down Network (PDN) | 导通时将输出连接地的 NMOS 网络 |
| 并联网络 | Parallel Transistor Network | 有任一支路导通即可以形成电流通道 |
| 串联网络 | Series Transistor Network | 全部串联晶体管导通才形成电流通路 |
| 复合门 | Complex Logic Gate | 在一级 CMOS 门中实现多项逻辑表达式 |
| AOI 门 | AND–OR–Invert (AOI) | 与-或结果取反的复合逻辑门 |
| OAI 门 | OR–AND–Invert (OAI) | 或-与结果取反的复合逻辑门 |
| 伪 NMOS 门 | Pseudo-NMOS Logic | 常导通 PMOS 负载、NMOS 网络下拉 |
| 开漏门 | Open-Drain Gate | 仅主动下拉，需外部上拉负载 |
| 多路选择器 | Multiplexer (MUX) | 由选择信号从多路输入中选择一路 |
| 传输门多路器 | Transmission-Gate MUX | 以互补传输门进行信号选通 |
| 组合逻辑 | Combinational Logic | 输出由当前输入决定而无内部历史状态 |
| 时序逻辑 | Sequential Logic | 输出受当前输入和存储状态共同决定 |
| 静态功耗 | Static Dissipation | 稳定输入下的泄漏或直流功耗 |
| 短路功耗 | Short-Circuit Power | 转换期上拉和下拉同时导通的功耗 |
| 负载电容 | Load Capacitance (CL) | 输出节点所驱动的总电容 |
| 驱动能力 | Drive Strength | 门电路对负载节点充放电的能力 |
| 传输延迟 | Propagation Delay | 逻辑信号通过电路所需时间 |
| 扇出负载 | Fanout Load | 由后级输入电容形成的负载 |
| SR 锁存器 | Set–Reset Latch | 置位、复位的双稳态存储单元 |
| D 锁存器 | D Latch | 使能期间对输入电平透明的存储单元 |
| D 触发器 | D Flip-Flop | 在指定时钟边沿采样 D 的存储元件 |
| JK 触发器 | JK Flip-Flop | 具有保持、置位、复位和翻转操作的触发器 |
| 主从结构 | Master–Slave Structure | 以两级锁存器控制数据传递时序 |
| 异步复位 | Asynchronous Reset | 不依赖时钟边沿的复位 |
| 寄存器 | Register | 多个触发器组成的数据存储单元 |

## 第六章：高速 CMOS 逻辑设计

**原书位置：** 印刷页 189—234

| 中文专业名词 | 英文／缩写／符号 | 速查释义 |
|---|---|---|
| 门尺寸优化 | Gate Sizing | 调整晶体管尺寸以权衡速度和面积 |
| 临界路径 | Critical Path | 决定电路最大时延的路径 |
| 扇出四倍延迟 | FO4 Delay | 反相器驱动四倍等效输入电容的延迟 |
| 反相器链 | Inverter Chain | 由逐级放大的反相器形成的缓冲驱动器 |
| 缓冲器 | Buffer | 提供信号驱动而不改变逻辑极性的电路 |
| 逻辑努力 | Logical Effort | 比较逻辑门与基准反相器输入电容效率 |
| 电气努力 | Electrical Effort | 负载电容与输入电容之比 |
| 分支努力 | Branching Effort | 关键路径与全部分支负载的比值 |
| 路径努力 | Path Effort | 门数量和各级逻辑、电气努力的组合 |
| 寄生延迟 | Parasitic Delay | 门内部扩散结等寄生带来的延迟 |
| 等效导通电阻 | Effective On-Resistance (Req) | 用于延迟估算的等效充放电电阻 |
| RC 时间常数 | RC Time Constant | 电阻与电容乘积 |
| 电路级缓冲 | Buffer Insertion | 在长路径中插入驱动级以减小总延迟 |
| 上升沿转换速率 | Slew Rate | 输出电平变化速度 |
| 静态电流 | Static Current | 稳态工作时流动的电流 |
| 功耗延迟积 | Power–Delay Product (PDP) | 平均功耗与传播延迟的乘积 |
| 能量延迟积 | Energy–Delay Product (EDP) | 开关能耗与传播延迟的乘积 |
| 逻辑路径 | Logic Path | 从驱动端到终端经过的门级序列 |
| 关键输出负载 | Critical Output Load | 限制关键路径传播速度的输出电容 |
| 尺寸渐增 | Tapering | 缓冲链尺寸按级数递增 |
| 晶体管堆叠 | Transistor Stacking | 多个串联晶体管共同影响驱动阻抗 |

## 第七章：传输门和动态逻辑设计

**原书位置：** 印刷页 235—272

| 中文专业名词 | 英文／缩写／符号 | 速查释义 |
|---|---|---|
| 传输晶体管 | Pass Transistor | 利用 MOS 导通态直接传递信号 |
| NMOS 传输开关 | NMOS Pass Switch | 强传 0、传高电平存在阈值损失的开关 |
| PMOS 传输开关 | PMOS Pass Switch | 强传 1、传低电平存在阈值损失的开关 |
| CMOS 传输门 | CMOS Transmission Gate (TG) | NMOS 与 PMOS 并联形成的信号开关 |
| 传输门逻辑 | Transmission Gate Logic | 使用传输门构建的组合逻辑 |
| 阈值损失 | Threshold Loss | 单极 MOS 传输造成的输出电平衰减 |
| 双向开关 | Bidirectional Switch | 允许两个方向传送信号的开关 |
| 动态节点 | Dynamic Node | 通过存储电荷保持瞬时电压状态的节点 |
| 预充电 | Precharge | 在计算前将动态节点置于预定电压 |
| 评估 | Evaluation | 输入驱动动态节点改变电压以实现逻辑 |
| 时钟相位 | Clock Phase | 用于安排预充和求值的时序区间 |
| 电荷分享 | Charge Sharing | 节点相连时电容之间的电荷重新分配 |
| 电荷泄漏 | Charge Leakage | 动态存储电荷通过漏电通路逐渐流失 |
| 电荷注入 | Charge Injection | 开关切换时沟道电荷进入信号节点 |
| 时钟馈通 | Clock Feedthrough | 控制时钟通过寄生电容耦合到信号节点 |
| 保持器 | Keeper | 维持动态节点电平的小驱动晶体管 |
| 多米诺逻辑 | Domino Logic | 动态逻辑级后接静态反相器的级联方式 |
| 单调性 | Monotonicity | 动态逻辑在求值相位对输入变化的约束 |
| 动态逻辑级联 | Dynamic Logic Cascading | 多个动态门之间的连接 |
| 竞争 | Race Condition | 信号到达先后导致的不确定求值 |
| 噪声敏感性 | Noise Sensitivity | 动态节点对漏电和耦合干扰的敏感程度 |

## 第八章：半导体存储器的设计

**原书位置：** 印刷页 273—302

| 中文专业名词 | 英文／缩写／符号 | 速查释义 |
|---|---|---|
| 存储器阵列 | Memory Array | 规则重复的存储单元矩阵 |
| 存储单元 | Memory Cell | 保存一位或多位数据的基本单元 |
| 静态随机存取存储器 | Static RAM (SRAM) | 利用双稳态电路静态保持位值 |
| 动态随机存取存储器 | Dynamic RAM (DRAM) | 主要以电容电荷保存数据信息 |
| SRAM 六管单元 | 6T SRAM Cell | 双反相器与两个访问晶体管构成的位单元 |
| 交叉耦合反相器 | Cross-Coupled Inverters | 形成双稳态存储的反馈结构 |
| 访问晶体管 | Access Transistor | 把位单元连接到位线的开关晶体管 |
| 字线 | Word Line (WL) | 选择一行存储单元的控制线 |
| 位线 | Bit Line (BL) | 读写数据的列信号线 |
| 互补位线 | Bit-Line Pair (BL/BLB) | 差分读写使用的一对位线 |
| 行译码器 | Row Decoder | 将行地址映射到字线 |
| 列译码器 | Column Decoder | 选取读写列位置 |
| 地址译码 | Address Decoding | 将二进制地址映射到选通行列 |
| 灵敏放大器 | Sense Amplifier | 检测并放大读出的小电压差 |
| 读操作 | Read Operation | 感测并输出存储位状态 |
| 写操作 | Write Operation | 将新状态强制写入存储单元 |
| 位线预充 | Bit-Line Precharge | 读出前设定位线初始电位 |
| 读稳定性 | Read Stability | 读过程中存储节点不被错误翻转的能力 |
| 写裕量 | Write Margin | 写入电路覆盖原有位值的能力 |
| 静态噪声容限 | Static Noise Margin (SNM) | SRAM 双稳态抗扰能力的指标 |
| 读扰动 | Read Disturb | 读取使内部节点偏移造成的风险 |
| 单元比 | Cell Ratio | 拉低晶体管与访问晶体管驱动能力之比 |
| 上拉比 | Pull-Up Ratio | 上拉负载与访问晶体管能力之比 |
| 存储器时序 | Memory Timing | 访问、感测、恢复等操作的时序约束 |

## 第九章：存储器设计中的其他课题

**原书位置：** 印刷页 303—334

| 中文专业名词 | 英文／缩写／符号 | 速查释义 |
|---|---|---|
| 只读存储器 | Read-Only Memory (ROM) | 主要用于读取固定或预置数据的存储器 |
| 掩模 ROM | Mask ROM | 在制造阶段确定数据的只读存储器 |
| 可编程 ROM | Programmable ROM (PROM) | 制成后可以编程的只读存储器 |
| 可擦可编程 ROM | EPROM | 可编程、可通过特定方式擦除的非易失存储器 |
| 电可擦可编程 ROM | EEPROM | 通过电信号擦写的非易失存储器 |
| 闪存 | Flash Memory | 可按块擦除、可电编程的非易失存储器 |
| 浮栅晶体管 | Floating-Gate Transistor | 在绝缘浮栅中保持电荷的器件 |
| 隧穿 | Tunneling | 载流子通过势垒的量子过程 |
| 存储器刷新 | Refresh | 对动态存储单元周期性恢复电荷 |
| 感测放大 | Sensing Amplification | 放大小读出信号以判定逻辑状态 |
| 静态列选择 | Column Multiplexing | 对多个位线按列地址进行选择 |
| 内容寻址存储器 | Content-Addressable Memory (CAM) | 由数据内容检索匹配位置 |
| 匹配线 | Match Line (ML) | CAM 中汇聚匹配结果的线 |
| 铁电存储器 | Ferroelectric RAM (FRAM) | 利用铁电材料极化状态存储信息 |
| 可编程逻辑阵列 | Programmable Logic Array (PLA) | 通过可编程与或阵列实现逻辑 |
| 现场可编程门阵列 | Field-Programmable Gate Array (FPGA) | 由可配置逻辑资源和互连构成的器件 |
| 查找表 | Look-Up Table (LUT) | 以存储真值表实现组合逻辑的组件 |

## 第十章：互连设计

**原书位置：** 印刷页 335—366

| 中文专业名词 | 英文／缩写／符号 | 速查释义 |
|---|---|---|
| 芯片互连 | On-Chip Interconnect | 连接电路单元的导电路径 |
| 布线电阻 | Wire Resistance | 布线材料及几何形状决定的电阻 |
| 布线电容 | Wire Capacitance | 互连与地或相邻导线之间的电容 |
| 分布式 RC | Distributed RC | 分段或连续描述长线电阻电容 |
| RC 延迟 | RC Delay | 由于线电阻和线电容产生的传播延迟 |
| Elmore 延迟 | Elmore Delay | RC 树网络的一阶传播延迟估算 |
| 片上电感 | On-Chip Inductance | 互连电流变化引发的磁储能效应 |
| 传输线 | Transmission Line | 传播效应不可忽略时的分布参数线路 |
| 特征阻抗 | Characteristic Impedance (Z0) | 无损线中行波电压与电流之比 |
| 波形反射 | Reflection | 阻抗不连续引起反向传播的信号 |
| 耦合电容 | Coupling Capacitance (Cc) | 两条邻近导线之间的寄生电容 |
| 串扰 | Crosstalk | 邻近导线信号切换引发的干扰 |
| 攻击线 | Aggressor Net | 对邻近受害线造成耦合的切换导线 |
| 受害线 | Victim Net | 受到其他网络耦合影响的导线 |
| 过冲 | Overshoot | 波形暂时超出目标高电平 |
| 下冲 | Undershoot | 波形暂时低于目标低电平 |
| 缓冲分段 | Buffer Repeater Insertion | 在长互连中加中继以降低传播延迟 |
| 互连分层 | Metal Hierarchy | 多层金属用于不同长度和用途的布线 |
| 金属间介质 | Inter-Metal Dielectric (IMD) | 隔离不同金属线路的绝缘层 |
| 天线效应 | Antenna Effect | 制造时互连积电可能损伤栅绝缘层 |
| 双镶嵌 | Dual Damascene | 铜互连图形与通孔的加工工艺 |

## 第十一章：电源网络和时钟设计

**原书位置：** 印刷页 367—399

| 中文专业名词 | 英文／缩写／符号 | 速查释义 |
|---|---|---|
| 电源分布网络 | Power Distribution Network (PDN) | 在芯片内分配电源和地 |
| 电源网格 | Power Grid | 网格化电源金属互连结构 |
| IR 压降 | IR Drop | 电源电流穿过金属阻抗引起的电位差 |
| 瞬态电压降 | L di/dt Noise | 快速电流变化在电感上引起的供电扰动 |
| 地弹噪声 | Ground Bounce | 快速电流变化引起局部地电位跳动 |
| 去耦电容 | Decoupling Capacitor (Decap) | 缓解电源瞬态波动的电容 |
| 电迁移 | Electromigration (EM) | 高电流密度造成金属原子迁移的现象 |
| 时钟分布 | Clock Distribution | 将时钟信号送至多个顺序单元 |
| 时钟树 | Clock Tree | 分支化分配时钟的缓冲网络 |
| 时钟树综合 | Clock Tree Synthesis (CTS) | 自动构建时钟分布网络的过程 |
| 时钟偏斜 | Clock Skew | 时钟到达不同接收端的时间差 |
| 时钟抖动 | Clock Jitter | 实际时钟边沿时间相对理想位置的波动 |
| 建立时间 | Setup Time (tsetup) | 采样边沿前数据需稳定的最短时间 |
| 保持时间 | Hold Time (thold) | 采样边沿后数据需保持稳定的最短时间 |
| 时钟周期 | Clock Period (Tclk) | 相邻指定时钟边沿的间隔 |
| 最大时钟频率 | Maximum Clock Frequency (fmax) | 满足时序约束的最高工作频率 |
| 触发器时钟到输出延迟 | Clock-to-Q Delay (tCQ) | 触发时钟边沿到 Q 输出变化的延迟 |
| 时钟门控 | Clock Gating | 按条件关闭无用时钟切换以降低功耗 |
| 时序约束 | Timing Constraint | 对电路路径延时、建立和保持的限制 |
| 锁相环 | Phase-Locked Loop (PLL) | 利用反馈调整振荡器相位与频率 |
| 延迟锁定环 | Delay-Locked Loop (DLL) | 利用可调延迟锁定输入输出相位关系 |
| 环形振荡器 | Ring Oscillator | 奇数级反相器闭环形成的振荡电路 |
| 压控振荡器 | Voltage-Controlled Oscillator (VCO) | 以控制电压调节频率的振荡器 |
| 时钟缓冲 | Clock Buffer | 为时钟分布提供足够驱动能力的单元 |
| 占空比 | Duty Cycle | 时钟高电平持续时间占周期的比例 |

## 附录：SPICE/HSPICE 与网表表达

**原书位置：** 附录 A；印刷页 400—413（指令行为须以实际仿真器版本为准）

| 中文专业名词 | 英文／缩写／符号 | 速查释义 |
|---|---|---|
| 网表标题 | Title Card | SPICE 文件的标题说明 |
| 实例名称 | Instance Name | 电阻、电容、源、MOS 等器件的唯一实例名 |
| 节点标号 | Node Identifier | 不同元件端子之间的连接关系 |
| 地节点 | Ground Node (0) | SPICE 的全局参考节点 |
| MOS 实例 | M Element | 以 M 开头的 MOS 原生器件语法 |
| 子电路调用 | X Element | 以 X 开头的 .SUBCKT 实例调用 |
| 电阻 | Resistor (R) | 线性电阻器件实例 |
| 电容 | Capacitor (C) | 集总电容器件实例 |
| 电感 | Inductor (L) | 集总电感器件实例 |
| 独立电压源 | Independent Voltage Source (V) | 指定直流或时变电压 |
| 独立电流源 | Independent Current Source (I) | 指定直流或时变电流 |
| 模型定义 | .MODEL | 声明器件数学模型与参数 |
| 子电路定义 | .SUBCKT | 定义可重复调用的电路模块 |
| 库文件 | .LIB | 载入模型库或指定工艺角（语法依方言） |
| 包含文件 | .INCLUDE | 将其他网表文件内容包含进来 |
| 直流分析 | .DC | 指定直流源或参数的扫描范围 |
| 瞬态分析 | .TRAN | 指定时域仿真 |
| 交流分析 | .AC | 指定交流小信号扫描 |
| 初始条件 | .IC | 指定时域求解起点状态 |
| 初始节点条件 | .NODESET | 提供求解初始猜测值 |
| 工作点 | .OP | 计算电路的静态工作点 |
| 温度 | .TEMP | 指定仿真温度 |
| 仿真选项 | .OPTION | 配置数值算法与结果输出方式 |
| 波形输出 | .PRINT / .PROBE | 定义要记录的电压电流结果 |
| 测量命令 | .MEASURE | 对波形进行定量测量 |
| 脉冲激励 | PULSE | 定义方波或脉冲时域激励 |
| 分段线性激励 | PWL | 定义由多个时间电压点连接的波形 |
| 正弦激励 | SIN | 定义正弦时间函数的源 |
| 参数 | .PARAM | 定义可复用表达式参数 |
| 仿真终止 | .END | 结束网表 |

---

本页合计 **186** 条，加上[第 1—4 章术语](/reference/terms-device-process)的 193 条，总计 **379** 条。不同产品、工艺及模型的具体数值应查 PDK／模型库，不可用本手册说明代替。
