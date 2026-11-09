# 按题型速查：选模型、查公式、避易错

这是一份**边做题边回查**的复习导航：先判断题目属于哪类物理或电路模型，找到适用公式，检查符号和单位，再跳转教材相应页。标注的式号、页码来源于现有的[教材公式表](/reference/formula-finder)；判断步骤与习题是复习归纳，不冒充原书公式。

[检索 145 项公式](/reference/formula-finder) · [教材图例图库](/reference/figures) · [术语和参数](/reference/) · [分专题练习](/content/practice/)

## 1. NMOS 计算：先判区域，再选方程

| 解题环节 | 关系式 / 条件 | 教材定位 |
|---|---|---|
| 认清端电压 | $V_{GS}=V_G-V_S$、$V_{DS}=V_D-V_S$、$V_{SB}=V_S-V_B$ | [端口与符号](/reference/formulas-models) |
| 算过驱动 | $V_{OV}=V_{GS}-V_T$；$V_{OV}\le 0$ 通常按截止近似 | [器件模型](/reference/formulas-models) |
| 长沟道线性区 | $V_{OV}>0$ 且 $0\le V_{DS}<V_{OV}$；$I_D=k'(W/L)(V_{OV}V_{DS}-V_{DS}^2/2)$ | 式 (2.17a)，[印刷 42 / PDF 61](/native-workbench?page=61) |
| 长沟道饱和区 | $V_{DS}\ge V_{OV}$；忽略沟道长度调制时，$I_{Dsat}=\frac12 k'(W/L)V_{OV}^2$ | 式 (2.19)，[43 / 62](/native-workbench?page=62) |
| 源体不等电位 | $V_T=V_{T0}+\gamma[\sqrt{2|\phi_{Fp}|+V_{SB}}-\sqrt{2|\phi_{Fp}|}]$ | 式 (2.11)，[38 / 57](/native-workbench?page=57) |

**做题顺序：**确认实际 S/B 接法 → 算 $V_T$ → 算 $V_{OV}$ → 比较 $V_{DS}$ → 选工作区公式。改变任何节点电压后，都要重新判断。

<details>
<summary>自测：$V_{GS}=1.2\,V$、$V_T=0.4\,V$、$V_{DS}=0.2\,V$，长沟道 NMOS 属于哪一区？</summary>

$V_{OV}=1.2-0.4=0.8\,V>0$，$V_{DS}=0.2\,V<0.8\,V$，故为线性区。使用式 (2.17a)。
</details>

[第二章习题](/review-1to4/02-exercises) · [答案解析](/review-1to4/02-answers)

## 2. 碰到器件缩小、阈值漂移：辨认模型

| 现象 / 关键词 | 关键公式或参数 | 教材定位 |
|---|---|---|
| 体效应 | 典型 NMOS 反向体偏，$V_{SB}$ 增大通常使 $V_T$ 增大 | 式 (2.11)，[38 / 57](/native-workbench?page=57) |
| 栅氧厚度 | $C_{ox}=\varepsilon_{ox}/t_{ox}$，单位为 F/m² | 式 (2.5)，[34 / 53](/native-workbench?page=53) |
| 沟道长度调制 | 饱和电流中的 $(1+\lambda V_{DS})$ 修正 | 式 (2.20)，[43 / 62](/native-workbench?page=62) |
| 深亚微米速度饱和 | $V_{Dsat}=\frac{V_{OV}E_cL}{V_{OV}+E_cL}$，不能简单当作 $V_{OV}$ | 式 (2.28)，[48 / 67](/native-workbench?page=67) |
| 亚阈值摆幅 | $S=\frac{nkT}{q}\ln10$，单位为 V/dec | 式 (2.33)，[54 / 73](/native-workbench?page=73) |

**易错：**长沟道平方律、速度饱和模型与亚阈值模型的适用偏置不同，不能拼接成一套万能电流方程。

## 3. 反相器 VTC 与噪声容限

| 提问方式 | 查到的关系 | 教材定位 |
|---|---|---|
| 图上找噪声界限 | 横轴 $V_{in}$、纵轴 $V_{out}$，标出 $V_{IL}$、$V_{IH}$、$V_{OL}$、$V_{OH}$ | [图例关键词：VTC](/reference/figures?q=VTC) |
| 多源高噪声容限 | $NM_H=V_{OH}-V_{IH}$ | 式 (4.3)，[114 / 133](/native-workbench?page=133) |
| 多源低噪声容限 | $NM_L=V_{IL}-V_{OL}$ | 式 (4.3)，[114 / 133](/native-workbench?page=133) |
| 单源噪声容限 | $SSNM_H=V_{OH}-V_S$；$SSNM_L=V_S-V_{OL}$ | 式 (4.2)，[112 / 131](/native-workbench?page=131) |
| CMOS 开关点 | 对 NMOS 和 PMOS 驱动电流列平衡式，注意长/短沟道假设 | 式 (4.14)，[129 / 148](/native-workbench?page=148) |

**易错：**单源 $SSNM$ 以切换点 $V_S$ 为分界；多源 $NM$ 使用斜率界限 $V_{IL}$ 与 $V_{IH}$，两者不是一回事。

[反相器习题](/review-1to4/04-exercises) · [电路图解](/figures)

## 4. 电路功耗、延迟与尺寸链

| 题型 | 关键关系 | 教材定位 |
|---|---|---|
| 电源端功耗 | $P=IV_{DD}$ | 式 (1.2)，[12 / 31](/native-workbench?page=31) |
| 动态功耗 | 原书简式 $P_{dynamic}=CV_{DD}^{2}f$；应用时区分活动因子定义 | 式 (1.5)，[12 / 31](/native-workbench?page=31) |
| 反相器 50% RC 延迟 | $t_{50\%}\approx0.69R_{eff}C_L$，一阶阶跃近似 | 式 (4.22c)，[138 / 157](/native-workbench?page=157) |
| 平均传播延迟 | $t_p=(t_{pLH}+t_{pHL})/2$ | 式 (6.3)，[192 / 211](/native-workbench?page=211) |
| 反相器链级数 | $N=\ln(C_{load}/C_{in})/\ln f$，$f$ 为每级尺寸比 | 式 (6.21)，[213 / 232](/native-workbench?page=232) |
| 最优级努力 | $f^*=F^{1/N}$，适用于相应的均衡级努力模型 | §6.6.3，[226 / 245](/native-workbench?page=245) |

**易错：**延迟 $t_p$、RC 时间常数 $\tau$ 和含门寄生的路径延迟不是同一个量；增大晶体管宽度通常增强驱动，却也增大前级栅负载。

## 5. NAND、NOR 与触发器识图

| 题目 | 先确认什么 | 复习入口 |
|---|---|---|
| 二输入 NAND | NMOS 串联下拉、PMOS 并联上拉 | [电路结构](/figures) |
| 二输入 NOR | NMOS 并联下拉、PMOS 串联上拉 | [电路结构](/figures) |
| 逻辑函数化简 | $\overline{AB}=\bar A+\bar B$、$\overline{A+B}=\bar A\bar B$ | 式 (1.1) 所在组，[6 / 25](/native-workbench?page=25) |
| 锁存器与触发器 | 判断电平敏感或边沿敏感、输入有效电平、允许的状态转移 | [时序逻辑](/content/chapters/07-sequential-logic) |

**易错：**PMOS 上拉与 NMOS 下拉的互补关系由逻辑导通条件决定，不能把一个网络原样复制成另一个。

## 6. 传输门、存储器与电荷共享

| 题型 | 关键关系 | 教材定位 |
|---|---|---|
| 传输门导通电阻 | $R_{TG}=R_N\parallel R_P$ 为简化模型 | §7.3.2，[249 / 268](/native-workbench?page=268) |
| 传输门端电容 | $C_{in}=C_{out}=C_{eff}(W_n+W_p)+\frac12 C_g(W_n+W_p)$ | 式 (7.10)，[250 / 269](/native-workbench?page=269) |
| 电荷分享 | $V^*=\frac{C_1V_1+C_2V_2}{C_1+C_2}$，假定电荷守恒、理想隔离 | §7.6，[266 / 285](/native-workbench?page=285) |
| SRAM 读时尺寸比 | $W_1/W_3\approx1.5$，教材举例中的经验折中 | 式 (8.3)，[285 / 304](/native-workbench?page=304) |
| SRAM 写时尺寸比 | $W_4/W_6\approx1.5$，不是任意工艺都能照搬的设计规则 | 式 (8.4)，[286 / 305](/native-workbench?page=305) |

**易错：**传输门既有电阻又有寄生电容；SRAM 读写尺寸比必须结合偏压、噪声裕量与实际 PDK 验证。

## 7. 长导线、串扰与 Elmore

| 题型 | 关键关系 | 教材定位 |
|---|---|---|
| 互连电阻 | $R=\rho L/(TW)$；$R_{sq}=\rho/T$ | 式 (10.1)、(10.2)，[337 / 356](/native-workbench?page=356) |
| RC 树 | $\tau_i=\sum_k C_kR_{ik}$；$R_{ik}$ 为共同路径电阻 | 式 (10.6)，[340 / 359](/native-workbench?page=359) |
| 均匀 RC 导线 Elmore 延迟 | $\tau_E\approx0.5R_{wire}C_{wire}$ | 式 (10.7)，[341 / 360](/native-workbench?page=360) |
| 同一分布线 50% 延迟 | $t_{50\%}\approx0.38R_{wire}C_{wire}$，与 Elmore 一阶矩不同 | 同页，[341 / 360](/native-workbench?page=360) |
| 邻线同向切换 | $C_L=C_{gnd}$（理想同相等幅） | 式 (10.15)，[353 / 372](/native-workbench?page=372) |
| 邻线反向切换 | $C_L=C_{gnd}+2C_c$（理想反相等幅） | 式 (10.16)，[353 / 372](/native-workbench?page=372) |

<details>
<summary>自测：同一均匀 RC 线，0.5RC 和 0.38RC 为什么都出现？</summary>

$0.5RC$ 是均匀线的 Elmore 一阶矩；$0.38RC$ 是该线达到 50% 电压的传播延迟近似。两者定义不同，不能互换。
</details>

## 8. 电源网络和时钟时序

| 题型 | 公式 / 条件 | 教材定位 |
|---|---|---|
| 目标供电阻抗 | $Z_{target}=V_{DD}\delta/I_{DD}$ | 式 (11.1)，[368 / 387](/native-workbench?page=387) |
| 回路压降 | $V=IR+L\,di/dt$ | 式 (11.2)，[368 / 387](/native-workbench?page=387) |
| 建立时间约束 | $T_{cycle}=T_{clk-q}+T_{DMAX}+T_{setup}+T_{skew}$ | 式 (11.6)，[381 / 400](/native-workbench?page=400) |
| 保持时间约束 | $T_{skew}+T_{hold}<T_{clk-q}+T_{DMIN}$ | 式 (11.7)，[381 / 400](/native-workbench?page=400) |

**易错：**上面时序公式**沿用原书偏斜正负约定**。不能脱离参考时钟方向死记偏斜加号或减号。

## 9. HSPICE 网表与曲线诊断

| 检查项 | 核心要点 | 入口 |
|---|---|---|
| MOS 节点 | 原生 MOS 实例端子按 D、G、S、B 顺序连接 | 第 3 章实例，[82 / 101](/native-workbench?page=101) |
| 模型调用 | M 开头为原生 MOS 实例、X 开头为子电路实例，须看模型库定义 | [HSPICE 速查](/content/appendices/c-hspice-quick-reference) |
| DC 扫描 | 扫 $V_{DS}$ 的输出特性与扫 $V_{GS}$ 的转移特性不是同一组曲线 | [仿真讲义](/content/chapters/08-hspice-netlists) |
| 电流方向 | 电源供电时电压源电流读数可能为负，需按流入正端的方向判断 | [HSPICE 参数与示例](/reference/formulas-models) |
| 寄生几何 | W、L 为长度；AD、AS 为面积；PD、PS 为周长 | [参数表](/reference/formulas-models) |

## 10. 十组不能混的概念

| 容易混淆 | 一句话区分 |
|---|---|
| $k'$ 与 $k$ | $k'=\mu C_{ox}$ 不含尺寸，$k=k'W/L$ 才含尺寸因子 |
| 工艺 $\lambda$ 与沟道长度调制 $\lambda$ | 一个是版图长度基准，一个通常是 V⁻¹ 的模型系数 |
| 长沟道与短沟道饱和 | 工作区边界必须对应同一器件模型 |
| $SSNM$ 与 $NM$ | 切换点与 VTC 斜率界限不同 |
| $t_p$ 与 $\tau$ | 一阶响应的 $t_{50\%}\approx0.69RC$，不是 RC 本身 |
| 0.5RC 与 0.38RC | Elmore 一阶矩 vs 均匀线 50% 延迟 |
| SRAM 尺寸比与工艺设计规则 | 1.5 是书中经验例子，不是通用 DRC 约束 |
| $C_{ox}$ 与 $C_{ox}WL$ | 单位面积电容 vs 理想面积电容 |
| AD/AS 与 PD/PS | m² 与 m，不能直接相加 |
| PMOS 与 NMOS 电压 | 须明确 $V_{SG}$、$V_{SD}$、阈值符号及所用偏压方向 |

## 11. 三分钟回忆题

<details>
<summary>① 为什么 $V_{GS}>V_T$ 不等于“必定饱和”？</summary>

长沟道模型还需比较 $V_{DS}$ 和 $V_{GS}-V_T$；当 $0\le V_{DS}<V_{GS}-V_T$ 时仍处于线性区。短沟道时要用对应高场模型。
</details>

<details>
<summary>② 增大晶体管宽度为何不保证整个逻辑路径更快？</summary>

宽度增大一般增强本级驱动，但也增加上一级输入负载及自身寄生电容；延迟必须从完整路径评估。
</details>

<details>
<summary>③ 多源噪声容限的两个表达式？</summary>

$NM_H=V_{OH}-V_{IH}$，$NM_L=V_{IL}-V_{OL}$，见式 (4.3)。
</details>

<details>
<summary>④ 为什么 HSPICE 的 I(Vdrain) 会出现负值？</summary>

电压源电流以流入其正端为正，给器件供电时常读到负值；应核对接法及电源定义，有时绘制 -I(Vdrain) 才得到正的漏电流。
</details>

---

**页码规则：**教材印刷页 $n$ 对应本 445 页扫描 PDF 第 $n+19$ 页；链接打开**对应页的可编辑 Typst 重排稿**，并非扫描图片。本页模型选择步骤、易错整理和小题是基于教材的学习归纳；原书式号与数值以对应页为准。
