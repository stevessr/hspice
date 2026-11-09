# 教材第1—4章原例题索引与解法对照

> **原书例题优先保留。** 本页按用户上传的《数字集成电路分析与设计——深亚微米工艺（第三版）》扫描PDF编排，收录第2章例2.1—2.13、第3章例3.1—3.7、第4章例4.1—4.9，共29个明确编号的教材例题。第1章以逻辑门、噪声、功耗及设计流程图表和章末习题为主；现有校对稿未发现“例1.x”编号，故不杜撰编号。

**如何查原题：** “PDF页”指445页附件中的物理页码；印刷页码=PDF页码−19。例如PDF第134页是印刷第115页。链接指向仓库已有的原生Typst校对选段，供阅读原例题的结构化叙述；完整原文、原图及所有题设仍以你上传的教材PDF为准，选段不冒充已经通过1:1验收。

**先读**：[计算方法专项](/review-1to4/calculation-methods) · [工艺与数据表](/review-1to4/technology-tables) · [前四章学习目录](/review-1to4/)

## 第1章：逻辑门与设计指标的教材图示、习题

第一章的原始内容包括基本逻辑门、组合门真值表、延迟与功耗、互连、电路设计流程，及印刷第27页前后的章末习题。应按顺序查看：

| 对照目标 | PDF原页 | 学习时必须保留的要素 |
|---|---|---|
| 门级功能与布尔表达式 | 第26—32页 | 逻辑符号、输入输出真值表、德摩根律 |
| 深亚微米互连、功耗与延迟 | 第35—41页 | 互连结构、$RC$、功率关系及表1.2 |
| 小结及章末习题 | 第42—46页 | 原题号 P1.1起，题设图和参数 |

[第一章原生编辑片段](https://github.com/stevessr/hspice/tree/main/fullbook/native/web) · [第一章基础12题](/review-1to4/01-exercises) · [第一章进阶8题](/review-1to4/advanced-01-exercises)

## 第2章：原书例2.1—2.13

| 原书编号 | 内容 | 扫描原页 | 对照选段 | 复习时保留的计算主线 |
|---|---|---|---|---|
| 例2.1 | 载流子与费米势 | PDF 56 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/33-page-056.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/33-page-056.typ) | 根据浓度和材料参数估算表面势；温度和浓度单位先统一 |
| 例2.2 | 反向体偏置 | PDF 56 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/33-page-056.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/33-page-056.typ) | 按 $V_{SB}$ 判断阈值变化方向和体效应 |
| 例2.3 | 氧化层电容与体效应 | PDF 57 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/34-page-057.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/34-page-057.typ) | 区分面积电容 $C_{ox}$ 与整体电容 $C_{ox}WL$ |
| 例2.4 | 阈值电压计算 | PDF 58 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/35-page-058.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/35-page-058.typ) | 分解平带电压、耗尽电荷及阈值 |
| 例2.5 | 阈值注入量 | PDF 59 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/36-page-059.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/36-page-059.typ) | 根据目标阈值偏移推导单位面积注入电荷 |
| 例2.6 | 0.18 μm NMOS/PMOS 饱和电压 | PDF 68 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/45-page-068.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/45-page-068.typ) | 短沟道速度饱和边界与长沟道边界比较 |
| 例2.7 | 0.13 μm 饱和电流 | PDF 69 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/46-page-069.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/46-page-069.typ) | 电流按单位宽度比较 NMOS 与 PMOS 驱动 |
| 例2.8 | 0.13 μm 饱和电压与电流比 | PDF 70 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/47-page-070.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/47-page-070.typ) | 结合 $E_cL$ 和过驱动估算电流比 |
| 例2.9 | α 功率定律参数 | PDF 71—72 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/48-page-071.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/48-page-071.typ) | 由两组偏置电流拟合经验模型 |
| 例2.10 | 亚阈值摆幅 | PDF 73 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/50-page-073.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/50-page-073.typ) | 半对数电流与门压增量推算 mV/dec |
| 例2.11 | 氧化层电容的工作区变化 | PDF 75 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/52-page-075.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/52-page-075.typ) | 不同偏置下区分 $C_{gs},C_{gd},C_{gb}$ |
| 例2.12 | 源漏结电容 | PDF 79—80 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/56-page-079.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/56-page-079.typ) | 考虑底面和侧壁结电容及偏置 |
| 例2.13 | 重叠电容 | PDF 81 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/58-page-081.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/58-page-081.typ) | 由重叠长度和宽度求电容量级 |

原书例题的题设数值、图形、解题步骤和结论以原PDF为准；这里将所有已有例题保留在**可定位、可追溯**的索引中，并链接已有的教材Typst整理稿。不要把自编S题和A题当作教材原题。

[第2章基础12题](/review-1to4/02-exercises) · [第2章进阶8题](/review-1to4/advanced-02-exercises) · [逐步计算方法](/review-1to4/calculation-methods)

## 第3章：原书例3.1—3.7

| 原书编号 | 内容 | 扫描原页 | 对照选段 | 复习时保留的计算主线 |
|---|---|---|---|---|
| 例3.1 | 铝与铜互连电阻比较 | PDF 97 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/74-page-097.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/74-page-097.typ) | 按截面、长度、电阻率求电阻并比较 |
| 例3.2 | SPICE MOS 器件规格 | PDF 102 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/79-page-102.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/79-page-102.typ) | 核对 D-G-S-B 顺序、尺寸与模型引用 |
| 例3.3 | SPICE LEVEL 1 模型规格 | PDF 105 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/82-page-105.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/82-page-105.typ) | 从模型参数解释长沟道电流 |
| 例3.4 | 0.18 μm BSIM3 I–V 特性 | PDF 109—110 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/86-page-109.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/86-page-109.typ) | 从网表、偏置扫描与曲线读取电流 |
| 例3.5 | 单位宽度 SPICE 电流 | PDF 111 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/88-page-111.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/88-page-111.typ) | 电流归一化与尺寸变化比较 |
| 例3.6 | 亚阈值 SPICE 电流曲线 | PDF 112 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/89-page-112.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/89-page-112.typ) | 理解半对数坐标及关断电流 |
| 例3.7 | 温度改变的 SPICE 结果 | PDF 114—115 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/91-page-114.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/91-page-114.typ) | 比较强反型和亚阈值电流的温度趋势 |

原书例题的题设数值、图形、解题步骤和结论以原PDF为准；这里将所有已有例题保留在**可定位、可追溯**的索引中，并链接已有的教材Typst整理稿。不要把自编S题和A题当作教材原题。

[第3章基础12题](/review-1to4/03-exercises) · [第3章进阶8题](/review-1to4/advanced-03-exercises) · [逐步计算方法](/review-1to4/calculation-methods)

## 第4章：原书例4.1—4.9

| 原书编号 | 内容 | 扫描原页 | 对照选段 | 复习时保留的计算主线 |
|---|---|---|---|---|
| 例4.1 | 缓冲器 VTC 与噪声容限 | PDF 134 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/111-page-134.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/111-page-134.typ) | 区分同相缓冲器正增益与反相器负增益 |
| 例4.2 | 电阻负载反相器噪声容限 | PDF 138—139 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/115-page-138.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/115-page-138.typ) | 按输出 KCL 求特性与两个斜率边界 |
| 例4.3 | 手算与 SPICE 的 VTC 对照 | PDF 139—140 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/116-page-139.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/116-page-139.typ) | 区分长沟道近似与工艺模型 |
| 例4.4 | 增强型 NMOS 负载高电平 | PDF 143 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/120-page-143.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/120-page-143.typ) | 考虑阈值损失与体效应自洽迭代 |
| 例4.5 | 饱和 NMOS 负载尺寸 | PDF 144—145 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/121-page-144.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/121-page-144.typ) | 反推尺寸比并检验输出逻辑电平 |
| 例4.6 | 0.13 μm CMOS 开关点 | PDF 149 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/126-page-149.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/126-page-149.typ) | 从 NMOS/PMOS 电流平衡求切换点 |
| 例4.7 | 0.18 μm CMOS SPICE/手算比较 | PDF 151—153 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/128-page-151.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/128-page-151.typ) | VTC、噪声裕量、尺寸与模型比较 |
| 例4.8 | 0.18 μm 伪 NMOS 反相器 | PDF 155—156 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/132-page-155.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/132-page-155.typ) | 权衡器件尺寸、输出低电平与功耗 |
| 例4.9 | CMOS 与伪 NMOS 设计对比 | PDF 158—159 | [打开网页例题/公式预览](https://stevessr.github.io/hspice/native-typst/135-page-158.html) · [Typst源文件](https://github.com/stevessr/hspice/blob/main/fullbook/native/web/135-page-158.typ) | 速度、面积、静态功耗与逻辑电平综合比较 |

原书例题的题设数值、图形、解题步骤和结论以原PDF为准；这里将所有已有例题保留在**可定位、可追溯**的索引中，并链接已有的教材Typst整理稿。不要把自编S题和A题当作教材原题。

[第4章基础12题](/review-1to4/04-exercises) · [第4章进阶8题](/review-1to4/advanced-04-exercises) · [逐步计算方法](/review-1to4/calculation-methods)

## 原例题与自编题怎么配套

按“**原书例题 → 复盘公式条件 → 自编基础题 → 进阶题 → 在线实验/HSPICE波形**”学习。对扫描页尚未完成校对的部分，应优先核对原书图示、参数和单位，避免未验证的Typst转写导致误差。

## 经原书扫描和既有校对稿核验的代表性数值

下表用于**复做原书例题时的数值自查**，不是新的自编题，也不替代原扫描页中的完整解题步骤、插图和题设。

| 原书例题 | 教材中出现的条件/结果 | 自查重点 |
|---|---|---|
| 例2.4 | $N_A=3\times10^{17}\,\mathrm{cm^{-3}}$，$t_{ox}=22$ Å，算得 $V_{T0}\approx+0.08$ V | 平带、耗尽和氧化层电荷的正负号 |
| 例2.5 | 希望阈值从 $+0.08$ V 到 $+0.40$ V，$\Delta V_T=0.32$ V | $Q_I=C_{ox}\Delta V_T$，再除以电子电荷 |
| 例2.6 | 0.18 μm工艺示例：NMOS约0.6 V、PMOS约1.0 V的速度饱和边界 | $V_{Dsat}$ 与长沟道$V_{OV}$比较 |
| 例2.7 | 0.13 μm示例：NMOS约585、PMOS约256 μA/μm | 单位沟道宽度的驱动电流 |
| 例2.8 | NMOS约0.34 V、PMOS约0.60 V的饱和电压 | 使用相同的历史工艺模型参数 |
| 例2.9 | 两组饱和电流130、220 μA，拟合得$\alpha\approx1.25$ | 对数取值及指数拟合 |
| 例2.10 | 亚阈值摆幅$S\approx72$ mV/dec | 以$\log_{10}I_D$为横/纵变化依据 |
| 例2.11 | 饱和区栅源电容约0.43 fF | $C_{gs,int}\approx2C_{ox}WL/3$ |
| 例3.1 | 铝铜导线比较中出现0.2 Ω、10 Ω、11 Ω等结果 | 长、宽、厚、接触项的组合 |
| 例3.3 | LEVEL 1参数示例：VTO=0.5 V，$k'\approx300\,\mu A/V^2$ | $KP$、$VTO$、$GAMMA$、$PHI$的定义 |
| 例4.2 | 电阻负载：$V_{OL}\approx0.08$ V、$V_{IL}\approx0.46$ V、$V_{IH}\approx0.77$ V | $NM_L\approx0.38$ V，$NM_H\approx0.43$ V |
| 例4.4 | 增强型NMOS负载，体效应迭代得$V_{OH}\approx0.73$ V | 输出作为源极时必须自洽求阈值 |
| 例4.6 | $W_P=400$ nm时开关点约0.60 V，$W_P=100$ nm时约0.53 V | 缩小PMOS宽度使VTC左移 |
| 例4.9 | CMOS尺寸示例中得到$W_N\approx0.875\,\mu m$、$W_P\approx2.1\,\mu m$ | 延迟、负载与静态功率的联合约束 |

这些数字只用于它们所在的原书历史工艺示例，**不得迁移为所有0.13/0.18 μm工艺的通用参数**。
