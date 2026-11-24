# 术语速查 I：基础、MOS 器件、工艺和反相器

> 来源：《数字集成电路分析与设计——深亚微米工艺（第三版）》扫描教材。**原书术语经教学释义重述，不是逐字引文**。引文位置采用原书印刷页码；扫描 PDF 的对应页一般为印刷页 +19。术语与工艺数字请回到来源核验。

本页覆盖第 1—4 章。第 5—11 章及附录参见[术语速查 II](/reference/terms-circuits-systems)，实际数值见[教材数据表](/reference/data-tables)，公式见[公式与参数](/reference/formulas-models)。

## 第一章：数字集成电路及性能指标

**原书定位：** §1.1—1.6；印刷页 1—24

| 中文专业名词 | 英文／缩写／符号 | 速查释义 |
|---|---|---|
| 集成电路 | Integrated Circuit (IC) | 将器件及互连制作在半导体芯片上的电路 |
| 数字集成电路 | Digital Integrated Circuit | 对逻辑电平进行计算、控制和存储的集成电路 |
| 超大规模集成电路 | Very Large Scale Integration (VLSI) | 集成大量晶体管的芯片技术 |
| 甚大规模系统设计 | System-on-Chip (SoC) | 在单片上集成处理、存储和外设模块 |
| 专用集成电路 | Application-Specific IC (ASIC) | 针对指定应用设计的集成电路 |
| 互补金属氧化物半导体 | Complementary MOS (CMOS) | 以 NMOS/PMOS 互补网络形成逻辑 |
| N 沟道 MOS | NMOS | 由电子反型沟道导电的 MOS 器件 |
| P 沟道 MOS | PMOS | 由空穴反型沟道导电的 MOS 器件 |
| 深亚微米工艺 | Deep Submicron (DSM) | 以深亚微米尺度晶体管设计为主要特征的工艺 |
| 集成度 | Integration Density | 单位面积可集成器件的数量 |
| 工艺节点 | Technology Node | 工艺代际的标称尺寸；不等于所有物理尺寸 |
| 摩尔定律 | Moore's Law | 描述历史集成密度增长趋势的经验规律 |
| 工艺微缩 | Technology Scaling | 缩减器件几何尺寸以提升集成度 |
| 互补逻辑 | Complementary Logic | 上拉与下拉网络互补工作的数字逻辑 |
| 布尔代数 | Boolean Algebra | 用逻辑运算描述二值变量关系 |
| 德摩根定律 | De Morgan's Law | 逻辑取反与与、或互换的规则 |
| 真值表 | Truth Table | 输入组合到输出逻辑值的对应表 |
| 与门 | AND Gate | 全部输入为 1 时输出 1 |
| 或门 | OR Gate | 至少一个输入为 1 时输出 1 |
| 反相器 | Inverter / NOT | 输出为输入逻辑取反 |
| 与非门 | NAND Gate | 与运算取反 |
| 或非门 | NOR Gate | 或运算取反 |
| 异或门 | Exclusive-OR (XOR) | 输入相异时输出 1 |
| 同或门 | Exclusive-NOR (XNOR) | 输入相同时输出 1 |
| 扇入 | Fan-in | 逻辑门直接输入数量 |
| 扇出 | Fan-out | 输出驱动的等效输入负载数量 |
| 逻辑电平 | Logic Level | 由规定电压范围表示的逻辑状态 |
| 电压传输特性 | Voltage Transfer Characteristic (VTC) | 静态输出电压相对输入电压的曲线 |
| 高输出电平 | Output High Voltage (VOH) | 有效逻辑高的输出电平 |
| 低输出电平 | Output Low Voltage (VOL) | 有效逻辑低的输出电平 |
| 输入高电平界限 | Input High Threshold (VIH) | 输入被判定为有效高的边界 |
| 输入低电平界限 | Input Low Threshold (VIL) | 输入被判定为有效低的边界 |
| 噪声容限 | Noise Margin | 电压噪声不致引发逻辑误判的裕量 |
| 上升时间 | Rise Time (tr) | 输出从指定低百分比到高百分比的时间 |
| 下降时间 | Fall Time (tf) | 输出从指定高百分比到低百分比的时间 |
| 高到低传播延迟 | Propagation Delay High-to-Low (tPHL) | 输出下降与输入触发边沿之间的延迟 |
| 低到高传播延迟 | Propagation Delay Low-to-High (tPLH) | 输出上升与输入触发边沿之间的延迟 |
| 平均传播延迟 | Average Propagation Delay (tp) | tPHL 与 tPLH 的算术平均 |
| 动态功耗 | Dynamic Power | 充放电和短路电流造成的开关功耗 |
| 静态功耗 | Static Power | 稳态泄漏或持续导电路径产生的功耗 |
| 寄存器传输级 | Register-Transfer Level (RTL) | 用寄存器及寄存器间逻辑描述系统 |
| 硬件描述语言 | Hardware Description Language (HDL) | 用于数字电路结构与行为描述的语言 |
| 逻辑综合 | Logic Synthesis | 将 RTL 转换为逻辑网表的流程 |
| 静态时序分析 | Static Timing Analysis (STA) | 在给定约束下分析时序路径的方法 |
| 计算机辅助设计 | Computer-Aided Design (CAD) | 计算机辅助电路设计和实现 |
| 电子设计自动化 | Electronic Design Automation (EDA) | 覆盖设计、验证、布图等流程的工具体系 |

## 第二章：MOS 结构、偏置与电流模型

**原书定位：** §2.2—2.7；印刷页 29—54

| 中文专业名词 | 英文／缩写／符号 | 速查释义 |
|---|---|---|
| MOS 场效应晶体管 | MOS Field-Effect Transistor (MOSFET) | 栅极电场控制沟道导电的器件 |
| 栅极 | Gate (G) | 控制沟道表面势的电极 |
| 漏极 | Drain (D) | 沟道的一端，电流定义多以漏电流为正 |
| 源极 | Source (S) | 沟道另一端，常作为端电压参考 |
| 体端 | Bulk / Body (B) | 衬底或阱的电气端子 |
| 衬底 | Substrate | 承载有源器件的半导体材料 |
| 阱区 | Well | 用掺杂形成器件体区的局部半导体区 |
| 栅氧化层 | Gate Oxide | 栅极与沟道之间的绝缘薄层 |
| 氧化层厚度 | Oxide Thickness (tox) | 栅介质的物理厚度 |
| 单位面积氧化层电容 | Oxide Capacitance Density (Cox) | Cox = εox/tox |
| 有效沟道长度 | Effective Channel Length (Leff) | 考虑工艺偏差后的实际有效长度 |
| 沟道宽度 | Channel Width (W) | 控制总沟道电流的几何宽度 |
| 沟道长度 | Channel Length (L) | 源漏之间的栅控制长度 |
| 栅源电压 | Gate-to-Source Voltage (VGS) | VG − VS |
| 漏源电压 | Drain-to-Source Voltage (VDS) | VD − VS |
| 源体电压 | Source-to-Body Voltage (VSB) | VS − VB |
| 阈值电压 | Threshold Voltage (VT) | 产生显著强反型时的控制电压 |
| 零体偏阈值 | Zero-Bias Threshold (VT0) | VSB 为零时的阈值电压 |
| 过驱动电压 | Overdrive Voltage (VOV) | VGS − VT |
| 强反型 | Strong Inversion | 表面反型载流子占主导的状态 |
| 弱反型 | Weak Inversion | 低于强反型阈值仍可产生扩散电流 |
| 截止区 | Cutoff Region | 长沟道开关近似中低于阈值的区域 |
| 线性区 | Triode / Linear Region | 低 VDS 时电流近似按 VDS 增长 |
| 饱和区 | Saturation Region | 高 VDS 下受夹断或速度饱和控制的区域 |
| 漏源电流 | Drain Current (IDS) | 流经漏极与源极之间的电流 |
| 沟道电荷 | Channel Charge (Qch) | 栅极下的反型载流子总电荷 |
| 耗尽层 | Depletion Region | 移动载流子被排空的空间电荷区 |
| 耗尽宽度 | Depletion Width (Xd) | 空间电荷区的纵向尺度 |
| 平带电压 | Flat-Band Voltage (VFB) | 半导体能带平直时的栅压 |
| 费米势 | Fermi Potential (φF) | 由掺杂和温度决定的能带参考电势 |
| 表面势 | Surface Potential (φs) | 表面与体内的电势差 |
| 体效应 | Body Effect | 源体偏置改变阈值电压 |
| 体效应系数 | Body Effect Coefficient (γ) | 体偏置影响阈值的系数 |
| 表面电荷 | Surface Charge | 半导体表面固定或陷阱电荷 |
| 沟道电子迁移率 | Electron Mobility (μn) | 电子漂移速度与电场之比 |
| 沟道空穴迁移率 | Hole Mobility (μp) | 空穴漂移速度与电场之比 |
| 跨导参数 | Transconductance Parameter (k′) | 通常定义为 μCox，单位 A/V² |
| 器件强度因子 | Gain Factor (β) | β = k′(W/L)，与 k′ 不应混淆 |
| 电流跨导 | Transconductance (gm) | ∂ID/∂VGS 的小信号导数 |
| 输出电导 | Output Conductance (gds) | ∂ID/∂VDS 的小信号导数 |
| 沟道长度调制 | Channel-Length Modulation (CLM) | 有效沟道随漏压变化，引起饱和区斜率 |
| 沟道长度调制系数 | Channel-Length Modulation Parameter (λ) | 简单模型中表示饱和电流的漏压依赖 |
| 速度饱和 | Velocity Saturation | 高横向电场下漂移速度受限 |
| 临界电场 | Critical Electric Field (Ec) | 速度饱和显著开始的特征电场 |
| 迁移率退化 | Mobility Degradation | 高垂直电场减小有效迁移率 |
| 短沟道效应 | Short-Channel Effects (SCE) | 短沟道中二维电场引起的一组非理想行为 |
| 漏致势垒降低 | Drain-Induced Barrier Lowering (DIBL) | 漏电压降低源端势垒，增强关断泄漏 |
| 阈值滚降 | Threshold Roll-Off | 沟道缩短导致阈值降低的趋势 |
| α 次方律 | Alpha-Power Law | 用 (VGS−VT)^α 近似高场电流依赖 |
| 亚阈值电流 | Subthreshold Current | 弱反型区由扩散机制主导的漏电流 |
| 亚阈值摆幅 | Subthreshold Swing (S) | 漏电流每增加十倍所需的 VGS 增量 |
| 指数斜率因子 | Subthreshold Slope Factor (n) | 表征次阈值斜率的系数 |
| 关断电流 | Off-State Current (Ioff) | 器件处于关断偏置时的漏电流 |
| 导通电流 | On-State Current (Ion) | 指定导通偏置条件下的电流 |

## 第二章：MOS 寄生电容

**原书定位：** §2.8；印刷页 54—64

| 中文专业名词 | 英文／缩写／符号 | 速查释义 |
|---|---|---|
| 栅电容 | Gate Capacitance | 栅极与各端之间的等效电容 |
| 栅源电容 | Gate–Source Capacitance (Cgs) | 栅对源的电容 |
| 栅漏电容 | Gate–Drain Capacitance (Cgd) | 栅对漏的电容 |
| 栅体电容 | Gate–Bulk Capacitance (Cgb) | 栅对体端的电容 |
| 沟道电容 | Channel Capacitance | 反型沟道电荷变化引起的电容 |
| 栅重叠电容 | Gate Overlap Capacitance | 栅与源漏几何重叠所产生的电容 |
| 覆盖电容 | Fringing Capacitance | 电场边缘扩散形成的寄生电容 |
| PN 结电容 | Junction Capacitance (Cj) | 源漏 PN 结的耗尽电容 |
| 结底面积电容 | Bottom Junction Capacitance | 源漏扩散区底面积对应的结电容 |
| 侧壁结电容 | Sidewall Junction Capacitance (Cjsw) | 源漏侧壁形成的结电容 |
| 结面积 | Junction Area (AD/AS) | 用于确定漏/源结电容与漏电 |
| 结周长 | Junction Perimeter (PD/PS) | 用于确定漏/源侧壁结电容 |
| 耗尽电容 | Depletion Capacitance | 由耗尽宽度随偏压变化而形成的电容 |
| 米勒效应 | Miller Effect | 跨接输入输出的反馈电容在电压增益下放大等效输入负载 |

## 第三章：制造工艺与版图

**原书定位：** §3.2—3.3；印刷页 69—80

| 中文专业名词 | 英文／缩写／符号 | 速查释义 |
|---|---|---|
| 氧化工艺 | Oxidation | 形成绝缘氧化物薄层 |
| 光刻 | Photolithography | 通过曝光与显影转移掩模图形 |
| 光刻胶 | Photoresist | 感光的图形转移材料 |
| 掩模版 | Photomask | 光刻中定义图形的模板 |
| 刻蚀 | Etching | 去除不需要的材料 |
| 干法刻蚀 | Dry Etching | 使用等离子体等实现材料去除 |
| 湿法刻蚀 | Wet Etching | 通过化学液体反应去除材料 |
| 离子注入 | Ion Implantation | 向硅晶体注入掺杂离子 |
| 掺杂 | Doping | 调节硅材料的导电类型和浓度 |
| 退火 | Annealing | 修复晶格并激活掺杂 |
| 化学气相沉积 | Chemical Vapor Deposition (CVD) | 通过气相化学反应沉积薄膜 |
| 物理气相沉积 | Physical Vapor Deposition (PVD) | 通过物理方式沉积材料 |
| 化学机械抛光 | Chemical Mechanical Polishing (CMP) | 实现晶圆表面平坦化 |
| 浅沟槽隔离 | Shallow Trench Isolation (STI) | 用绝缘沟槽隔离器件 |
| 局部氧化隔离 | Local Oxidation of Silicon (LOCOS) | 传统硅器件隔离工艺 |
| 硅栅 | Polysilicon Gate | 利用多晶硅形成的 MOS 栅电极 |
| 有源区 | Active Area | 形成源漏及沟道的版图区域 |
| 扩散区 | Diffusion Region | 源漏及体接触等掺杂区域 |
| 源漏延伸区 | Lightly Doped Drain (LDD) | 降低漏端局部高电场的掺杂结构 |
| 接触孔 | Contact | 器件区域连接到金属层的通孔 |
| 通孔 | Via | 相邻金属层之间的连接结构 |
| 互连金属 | Interconnect Metal | 连接芯片器件与模块的导电布线 |
| 版图 | Layout | 电路在不同制造层上的几何表示 |
| 设计规则 | Design Rules | 约束图形线宽、间距和包围关系 |
| 最小线宽 | Minimum Width | 指定层可制造的最小图形宽度 |
| 最小间距 | Minimum Spacing | 同层或异层形状间的最小间距 |
| 包围规则 | Enclosure Rule | 一层必须包围另一层的最小距离 |
| 版图单位 λ | Lambda Layout Rule (λ) | 抽象版图尺寸基准，不等于沟道调制 λ |
| 设计规则检查 | Design Rule Check (DRC) | 几何版图是否满足工艺约束的检查 |
| 版图原理图对比 | Layout Versus Schematic (LVS) | 检查器件和连接是否匹配 |
| 寄生参数提取 | Parasitic Extraction (PEX) | 将版图布线转成 R/C 等寄生网络 |
| 方块电阻 | Sheet Resistance (R□) | 薄膜单位方块的等效电阻 |
| 电阻率 | Resistivity (ρ) | 材料对电流流动阻碍程度 |
| 厚度 | Thickness (t) | 决定薄膜片阻的重要几何量 |
| 工艺角 | Process Corner | 工艺参数变化范围中的代表性组合 |

## 第三章：SPICE 与器件模型

**原书定位：** §3.4—3.9；印刷页 81—104

| 中文专业名词 | 英文／缩写／符号 | 速查释义 |
|---|---|---|
| 电路网表 | Netlist | 定义元件连接、模型及仿真命令的文本 |
| SPICE | Simulation Program with Integrated Circuit Emphasis | 电路级仿真程序体系 |
| HSPICE | HSPICE | 兼容 SPICE 的工业电路仿真软件 |
| 模型库 | Model Library | 存储晶体管数学模型及参数的文件 |
| 器件实例 | Device Instance | 网表中连接到节点并带参数的器件 |
| 模型卡 | Model Card | .MODEL 等定义的模型记录 |
| LEVEL 1 | Shichman–Hodges Level 1 Model | 长沟道一阶 MOS 行为模型 |
| BSIM3 | Berkeley Short-channel IGFET Model 3 | 考虑多种深亚微米非理想效应的模型 |
| BSIM3v3 | BSIM3 Version 3 | 本书详细讨论的 BSIM3 版本 |
| 直流扫描 | DC Sweep (.DC) | 扫描电压、电流或参数以计算直流特性 |
| 瞬态分析 | Transient Analysis (.TRAN) | 随时间求解节点电压与支路电流 |
| 交流小信号分析 | AC Analysis (.AC) | 求解线性化频域响应 |
| 静态工作点 | Operating Point (.OP) | 计算不随时间变化的偏置点 |
| 电源电压 | Supply Voltage (VDD) | 提供电路电能的正电源电位 |
| 温度效应 | Temperature Dependence | 器件参数随温度的变化 |
| 工艺－电压－温度 | Process–Voltage–Temperature (PVT) | 器件、电源、环境变化的联合覆盖 |
| TT 工艺角 | Typical–Typical (TT) | 典型 NMOS 与 PMOS 的模型组合 |
| FF 工艺角 | Fast–Fast (FF) | 两种器件都为相对快的代表组合 |
| SS 工艺角 | Slow–Slow (SS) | 两种器件都为相对慢的代表组合 |
| FS／SF | Fast–Slow / Slow–Fast | 用于评价 NMOS/PMOS 失配的交叉角 |
| 参数抽取 | Parameter Extraction | 通过实测数据拟合器件模型参数 |
| 热载流子效应 | Hot-Carrier Effect (HCE) | 高能载流子对器件可靠性的影响 |
| 闩锁效应 | Latch-up | 寄生晶闸管通路引起的异常大电流状态 |
| 绝缘体上硅 | Silicon-on-Insulator (SOI) | 薄硅层下带绝缘层的器件工艺 |
| 部分耗尽 SOI | Partially Depleted SOI (PD-SOI) | 工作时硅薄膜并未全部耗尽 |
| 完全耗尽 SOI | Fully Depleted SOI (FD-SOI) | 工作时薄硅膜完全耗尽 |

## 第四章：MOS 反相器与噪声

**原书定位：** §4.2—4.6；印刷页 108—134

| 中文专业名词 | 英文／缩写／符号 | 速查释义 |
|---|---|---|
| 负载线 | Load Line | 用 KCL 与负载特性求反相器静态工作点 |
| 电阻负载反相器 | Resistive-Load Inverter | 用电阻做上拉、NMOS 做下拉 |
| 增强型 NMOS 负载 | Enhancement-Load NMOS | 以增强型 NMOS 形成反相器负载 |
| 耗尽型 NMOS 负载 | Depletion-Load NMOS | 以耗尽型 NMOS 做上拉负载 |
| 二极管连接 | Diode-Connected MOS | 栅极与漏极短接的 MOS 结构 |
| 互补 CMOS 反相器 | Complementary CMOS Inverter | PMOS 上拉、NMOS 下拉组成的反相器 |
| 静态传输曲线 | Static VTC | 稳定输入时输出电压的函数关系 |
| 逻辑翻转电平 | Switching Threshold (VM) | 满足 Vin = Vout 的电压 |
| 高电平噪声容限 | High Noise Margin (NMH) | VOH − VIH |
| 低电平噪声容限 | Low Noise Margin (NML) | VIL − VOL |
| 单源噪声容限 | Single-Source Noise Margin (SSNM) | 仅单一噪声源扰动时的静态裕量 |
| 多源噪声容限 | Multiple-Source Noise Margin (MSNM) | 多个噪声源共同扰动下的裕量 |
| 反相器转换增益 | VTC Slope / DC Gain | ∂Vout/∂Vin，过渡区其绝对值可大于 1 |
| 等效负载电阻 | Equivalent Load Resistance | 以线性化电阻近似输出充放电能力 |
| 晶体管尺寸比 | Sizing Ratio (Wp/Wn) | 决定 CMOS 开关点与升降延迟平衡的重要因素 |
| β 比 | Beta Ratio (βp/βn) | N/P 设备强度对比，涉及 μ 和 W/L |
| 比率型逻辑 | Ratioed Logic | 稳态输出依赖负载与驱动管尺寸之比 |
| 无比率逻辑 | Ratioless Logic | 理想静态 CMOS 逻辑电平不依赖精确尺寸比 |

---

共收录 **193** 条术语。对于引号中的参数和符号，应优先对照原书表 3.1、3.2；其中 **版图 λ** 与 **沟道长度调制 λ** 含义不同。
