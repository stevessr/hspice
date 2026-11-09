# 数字集成电路专业名词与数据速查

本专题以《数字集成电路分析与设计——深亚微米工艺（第三版）》为基础，将教材中的**专业术语、模型参数、原书工艺数据、关键公式**整理为 VitePress 可搜索的专题页。

**目前收录：379 条术语、9 组专题数据表、145 项带教材页码的公式与公式组、自动更新的图例图录，以及 HSPICE 参数对照。** 数据表特别标注「原书表」「例题给定」「公式归纳」或「工程补充」；**原书扫描共 445 页**，教材印刷页码与 PDF 页序相差约 19 页。

## 选择你要查的内容

| 专题页面 | 内容 | 检索示例 |
|---|---|---|
| [术语速查 I：基础、MOS 与工艺](/reference/terms-device-process) | 第 1—4 章，193 条；物理器件、版图工艺、SPICE 模型、反相器 | VTC、$V_T$、DIBL、BSIM3、LVS |
| [术语速查 II：电路、存储与系统](/reference/terms-circuits-systems) | 第 5—11 章与附录，186 条；高速 CMOS、动态逻辑、SRAM、互连、时钟 | FO4、SRAM、PDN、PLL、.TRAN |
| [教材公式速查 I：第 1—6 章](/reference/formula-index) | 97 项；式号、印刷页、PDF 页序、适用条件 | (2.11)、(2.17)、(4.3)、(5.13)、(6.23) |
| [教材公式速查 II：第 7—11 章](/reference/formula-index-systems) | 48 项；传输门、SRAM、Elmore、耦合与时钟 | (7.10)、(8.4)、(10.7)、(11.6) |
| [教材图例速查图库](/reference/figures) | 全书图号、图注、章节与印刷/PDF 页码；可筛选整页图形预览 | 图2.14、CMOS、SRAM、VTC、Elmore |
| [完整图号文字索引](/reference/figures-catalog) | 从现有 445 页 Typst 重排稿自动抽取，支持 VitePress 全站检索 | 图6.13、图10.7、图11.1 |
| [教材数据表与参数总表](/reference/data-tables) | ITRS 表 1.2、P2.1、例 2.7/2.8、SPICE LEVEL 1、BSIM3v3、区域和电容对照 | 0.13 μm、KP、VTH0、工艺预测 |
| [公式、物理量及 HSPICE 参数](/reference/formulas-models) | MOS 电流、体效应、VTC、时序、耗散功率、网表参数 | $V_{DSat}$、$P_{dyn}$、AD/AS |

## 按原书章节定位

| 章节 | 原书印刷页 | 快速入口 |
|---|---:|---|
| 1 深亚微米数字集成电路设计 | 1—27 | [数字逻辑与性能术语](/reference/terms-device-process) |
| 2 MOS 晶体管 | 28—67 | [器件和工作区](/reference/terms-device-process) · [数值例题](/reference/data-tables) |
| 3 制造、版图和模拟 | 68—107 | [工艺与模型术语](/reference/terms-device-process) · [SPICE 参数](/reference/data-tables) |
| 4 MOS 反相器电路 | 108—147 | [反相器和噪声](/reference/terms-device-process) |
| 5 静态 MOS 门电路 | 148—188 | [门电路与时序元件](/reference/terms-circuits-systems) |
| 6 高速 CMOS 逻辑设计 | 189—234 | [延迟与尺寸优化](/reference/terms-circuits-systems) |
| 7 传输门和动态逻辑设计 | 235—272 | [预充电与动态逻辑](/reference/terms-circuits-systems) |
| 8 半导体存储器的设计 | 273—302 | [SRAM 和存储阵列](/reference/terms-circuits-systems) |
| 9 存储器设计中的其他课题 | 303—334 | [ROM、Flash、CAM](/reference/terms-circuits-systems) |
| 10 互连设计 | 335—366 | [寄生、串扰、RC](/reference/terms-circuits-systems) |
| 11 电源网络和时钟设计 | 367—399 | [IR Drop、skew、PLL](/reference/terms-circuits-systems) |
| 附录 A / B | 400 起 | [SPICE 网表术语](/reference/terms-circuits-systems) |

## 如何查

- **站内搜索**：直接输入中英文术语、模型参数名（如 GAMMA、VTH0、FO4、NML）。
- **复习时做公式题**：先从[公式与 HSPICE 参数](/reference/formulas-models)检查模型/适用区，再查[原书数据表](/reference/data-tables)确定输入量。
- **结合实验验证**：使用[六组 HSPICE 仿真](/review-1to4/simulations)或[第八章 HSPICE 网表讲义](/content/chapters/08-hspice-netlists)重做曲线。

**来源边界**：第 1—11 章是教材自身的内容结构；页面释义为学习型整理，不应与逐字原生 Typst 转录混淆。特定工艺或软件支持情况以所用模型库和仿真器版本为准。
