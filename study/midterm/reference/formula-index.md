# 公式速查表 I：数字逻辑、MOS 与 CMOS（第 1—6 章）

> **使用方法**：以教材《数字集成电路分析与设计——深亚微米工艺（第三版）》的**印刷页码为主**，同列给出扫描 PDF 的物理页序（印刷页 + 19）。点击 PDF 页序，可打开仓库内该页的**Typst 在线校对页**；它是参照扫描件的可编辑页面，不等于原扫描图片。**原书式号**与「附近 / 图示 / 教学归纳」严格区分；本表为公式和符号的简明重排，完整推导请回到教材。部分原书原生转写尚未通过逐页 1:1 验收。

[速查首页](/reference/) · [公式第 7—11 章](/reference/formula-index-systems) · [符号与模型条件](/reference/formulas-models) · [教材数据表](/reference/data-tables)

## 教材页码换算

| 教材印刷页 | 扫描 PDF 页序 | 说明 |
|---:|---:|---|
| 1 | 20 | 正文第 1 页 |
| 38 | 57 | 体效应与阈值公式 |
| 48 | 67 | 深亚微米速度饱和 |
| 129 | 148 | CMOS 反相器开关点 |
| 213 | 232 | 反相器链最优化 |

**数学与计量约定**：符号使用教材主体约定，如 $V_{GS}=V_G-V_S$、$V_{DS}=V_D-V_S$、$V_{SB}=V_S-V_B$。PMOS 运算应改用对应端电压幅值，不能把 NMOS 正向偏压直接代入。


## 第 1 章：逻辑、功耗、延迟

<small>教材范围：印刷第 1—27 页</small>

| 公式名称 | 速查表达式 | 原书式号／定位 | 印刷页 | PDF 页序 · Typst 校对 |
|---|---|---|---:|---|
| **德摩根律（与非）**<br>布尔代数，逻辑取反 | $\overline{A\cdot B}=\overline A+\overline B$ | 式 (1.1) 所在组 | 6 | [25](/native-workbench?page=25) |
| **德摩根律（或非）**<br>布尔代数，逻辑取反 | $\overline{A+B}=\overline A\cdot\overline B$ | 式 (1.1) 所在组 | 6 | [25](/native-workbench?page=25) |
| **电源消耗功率**<br>电源端平均电流 | $P=IV_{DD}$ | 式 (1.2) | 12 | [31](/native-workbench?page=31) |
| **总功耗分解**<br>宏观功耗分解 | $P_{\mathrm{total}}=P_{\mathrm{static}}+P_{\mathrm{dynamic}}$ | 式 (1.3) | 12 | [31](/native-workbench?page=31) |
| **静态功耗**<br>直流通路与漏电 | $P_{\mathrm{static}}=(I_{\mathrm{DC}}+I_{\mathrm{leakage}})V_{DD}$ | 式 (1.4) | 12 | [31](/native-workbench?page=31) |
| **动态功耗**<br>原书此处简式，实际活动概率另行计入 | $P_{\mathrm{dynamic}}=CV_{DD}^{2}f$ | 式 (1.5) | 12 | [31](/native-workbench?page=31) |

## 第 2 章：材料与 MOS 阈值

<small>教材范围：印刷第 28—40 页</small>

| 公式名称 | 速查表达式 | 原书式号／定位 | 印刷页 | PDF 页序 · Typst 校对 |
|---|---|---|---:|---|
| **质量作用定律**<br>热平衡半导体 | $np=n_i^2$ | 式 (2.1) 附近 | 33 | [52](/native-workbench?page=52) |
| **p 型费米势**<br>p 型掺杂，采用原书符号约定 | $\phi_{Fp}=\frac{kT}{q}\ln\frac{n_i}{N_A}$ | 式 (2.4) | 34 | [53](/native-workbench?page=53) |
| **栅氧单位面积电容**<br>平板氧化层近似 | $C_{ox}=\frac{\varepsilon_{ox}}{t_{ox}}$ | 式 (2.5) | 34 | [53](/native-workbench?page=53) |
| **平带电压**<br>表面固定电荷/功函数关系，采用概括写法 | $V_{FB}=\phi_{MS}-\frac{Q_{ox}}{C_{ox}}$ | 式 (2.6) 附近 | 36 | [55](/native-workbench?page=55) |
| **耗尽层宽度**<br>均匀掺杂耗尽近似 | $X_d=\sqrt{\frac{2\varepsilon_{si}\lvert\phi_s-\phi_b\rvert}{qN_A}}$ | 式 (2.7) | 36 | [55](/native-workbench?page=55) |
| **耗尽层电荷**<br>NMOS p 衬底，单位面积电荷 | $Q_B=-\sqrt{2q\varepsilon_{si}N_A\lvert\phi_s-\phi_b\rvert}$ | 式 (2.8) 附近 | 36 | [55](/native-workbench?page=55) |
| **零体偏阈值**<br>NMOS，使用阈值时的耗尽电荷 | $V_{T0}=V_{FB}+2\lvert\phi_{Fp}\rvert+\frac{\lvert Q_{B0}\rvert}{C_{ox}}$ | 式 (2.10) | 38 | [57](/native-workbench?page=57) |
| **体效应阈值**<br>NMOS，反向体偏置 | $V_T=V_{T0}+\gamma[\sqrt{2\lvert\phi_{Fp}\rvert+V_{SB}}-\sqrt{2\lvert\phi_{Fp}\rvert}]$ | 式 (2.11) | 38 | [57](/native-workbench?page=57) |
| **体效应系数**<br>均匀掺杂近似 | $\gamma=\frac{\sqrt{2q\varepsilon_{si}N_A}}{C_{ox}}$ | 式 (2.12) | 38 | [57](/native-workbench?page=57) |

## 第 2 章：MOS 电流与工作区域

<small>教材范围：印刷第 41—54 页</small>

| 公式名称 | 速查表达式 | 原书式号／定位 | 印刷页 | PDF 页序 · Typst 校对 |
|---|---|---|---:|---|
| **局部沟道电荷密度**<br>强反型长沟道电荷模型 | $Q_n(y)=C_{ox}[V_{GS}-V(y)-V_T]$ | 式 (2.13) | 41 | [60](/native-workbench?page=60) |
| **漏电流与漂移速度**<br>沟道截面电流 | $I_{DS}=WQ_n\,v$ | 式 (2.14) | 41 | [60](/native-workbench?page=60) |
| **横向场与漂移速度**<br>低电场 | $v=\mu_nE_y,\quad E_y=\frac{dV}{dy}$ | 式 (2.15) | 41 | [60](/native-workbench?page=60) |
| **工艺电流参数**<br>不包含 $W/L$ | $k'=\mu_n C_{ox}=\frac{\mu_n\varepsilon_{ox}}{t_{ox}}$ | 式 (2.16) | 41 | [60](/native-workbench?page=60) |
| **线性区漏电流**<br>长沟道；$0\le V_{DS}<V_{GS}-V_T$ | $I_{DS}=k'\frac WL[(V_{GS}-V_T)V_{DS}-\frac{V_{DS}^{2}}2]$ | 式 (2.17a) | 42 | [61](/native-workbench?page=61) |
| **长沟道饱和漏压**<br>低场平方律模型 | $V_{Dsat}=V_{GS}-V_T$ | 式 (2.18) | 42 | [61](/native-workbench?page=61) |
| **长沟道饱和电流**<br>$k=k'W/L$；忽略沟道长度调制 | $I_{DS}=\frac{k}{2}(V_{GS}-V_T)^2$ | 式 (2.19) | 43 | [62](/native-workbench?page=62) |
| **沟道长度调制修正**<br>长沟道饱和区近似 | $I_{DS}=\frac{k}{2}(V_{GS}-V_T)^2(1+\lambda V_{DS})$ | 式 (2.20) | 43 | [62](/native-workbench?page=62) |
| **迁移率退化**<br>高垂直电场经验模型 | $\mu_e=\frac{\mu_0}{1+[(V_{GS}-V_T)/(\theta t_{ox})]^\eta}$ | 式 (2.21) | 46 | [65](/native-workbench?page=65) |
| **电子／空穴临界场**<br>教材所用历史器件估值 | $E_{cn}=6\times10^4,\quad E_{cp}=24\times10^4\ \mathrm{V/cm}$ | 式 (2.22) | 46 | [65](/native-workbench?page=65) |
| **速度饱和漂移速度**<br>教材简化高场近似 | $v=\frac{\mu_e E}{1+E/E_c}$ | 式 (2.23) 附近 | 47 | [66](/native-workbench?page=66) |
| **短沟道饱和漏压**<br>速度饱和模型，非长沟道边界 | $V_{Dsat}=\frac{(V_{GS}-V_T)E_cL}{V_{GS}-V_T+E_cL}$ | 式 (2.28) | 48 | [67](/native-workbench?page=67) |
| **短沟道饱和电流**<br>教材高场近似，导电方向采用 NMOS | $I_{Dsat}=Wv_{sat}C_{ox}\frac{(V_{GS}-V_T)^2}{V_{GS}-V_T+E_cL}$ | 式 (2.29) | 48 | [67](/native-workbench?page=67) |
| **α 幂律饱和电流**<br>参数 $K_s,\alpha$ 需经拟合 | $I_{Dsat}=K_s\frac WL(V_{GS}-V_T)^\alpha$ | 式 (2.30a) | 51 | [70](/native-workbench?page=70) |
| **α 幂律低压线性电流**<br>小 $V_{DS}$ 近似 | $I_{DS}=K_L\frac WL(V_{GS}-V_T)V_{DS}$ | 式 (2.30b) | 52 | [71](/native-workbench?page=71) |
| **α 幂律饱和漏压**<br>同一组经验参数 | $V_{Dsat}=\frac{K_s}{K_L}(V_{GS}-V_T)^{\alpha-1}$ | 式 (2.31) | 52 | [71](/native-workbench?page=71) |
| **亚阈值电流**<br>弱反型；参数 $n$ 为斜率因子 | $I_{sub}=I_s\exp[\frac{q(V_{GS}-V_T-V_{offset})}{nkT}]$ | 式 (2.32) | 53 | [72](/native-workbench?page=72) |
| **亚阈值摆幅**<br>单位 V/dec；常温极限近似 60 mV/dec | $S=\frac{nkT}{q}\ln(10)$ | 式 (2.33) | 54 | [73](/native-workbench?page=73) |

## 第 2 章：寄生电容

<small>教材范围：印刷第 55—63 页</small>

| 公式名称 | 速查表达式 | 原书式号／定位 | 印刷页 | PDF 页序 · Typst 校对 |
|---|---|---|---:|---|
| **强反型线性区栅电容分配**<br>仅理想沟道项，重叠电容另加 | $C_{GS}\approx C_{GD}\approx\frac12 C_{ox}WL$ | 图 2.18 / 小结 | 56 | [75](/native-workbench?page=75) |
| **强反型饱和区栅电容分配**<br>沟道项，非总 $C_{GD}$ | $C_{GS}\approx\frac23 C_{ox}WL,\quad C_{GD,\mathrm{ch}}\approx0$ | 图 2.18 / 小结 | 56 | [75](/native-workbench?page=75) |
| **二极管结电流**<br>pn 结，$V_{th}$ 指热电压 | $I_D=I_s[\exp(V_j/V_{th})-1]$ | 式 (2.35) | 56 | [75](/native-workbench?page=75) |
| **反向偏置结电流**<br>反偏且未击穿 | $I_D\approx-I_s$ | 式 (2.36) | 57 | [76](/native-workbench?page=76) |
| **内建结电势**<br>突变 pn 结热平衡 | $\phi_B=\frac{kT}{q}\ln\frac{N_AN_D}{n_i^2}$ | 式 (2.37) | 57 | [76](/native-workbench?page=76) |
| **偏压相关结电容**<br>耗尽结电容模型 | $C_j=\frac{C_{j0}A}{(1-V_j/\phi_B)^m}$ | 式 (2.38) | 57 | [76](/native-workbench?page=76) |
| **零偏结电容密度**<br>突变结模型 | $C_{j0}=\sqrt{\frac{q\varepsilon_{si}}{2\phi_B}\frac{N_AN_D}{N_A+N_D}}$ | 式 (2.39) | 57 | [76](/native-workbench?page=76) |
| **等效结电容**<br>大信号电容的割线定义 | $C_{eq}=\frac{Q(V_2)-Q(V_1)}{V_2-V_1}$ | 式 (2.42) 附近 | 59 | [78](/native-workbench?page=78) |
| **偏压下单位宽度结电容**<br>特定结几何及等效系数 | $C_j=K_{eq}C_{jb}(Y+x_j)W$ | 式 (2.45) | 60 | [79](/native-workbench?page=79) |
| **栅边缘覆盖电容**<br>重叠与边缘项 | $C_{ol}=C_{ov}+C_f$ | 式 (2.46) | 61 | [80](/native-workbench?page=80) |

## 第 3 章：制造、版图与 SPICE

<small>教材范围：印刷第 68—107 页</small>

| 公式名称 | 速查表达式 | 原书式号／定位 | 印刷页 | PDF 页序 · Typst 校对 |
|---|---|---|---:|---|
| **方块电阻**<br>薄膜片阻 | $R_\square=\frac{\rho}{t}$ | §3.2 / 例 3.1 | 78 | [97](/native-workbench?page=97) |
| **版图导线电阻**<br>均匀宽度、厚度 | $R=R_\square\frac LW$ | §3.2 / 例 3.1 | 78 | [97](/native-workbench?page=97) |
| **BSIM3 体效应模型中的阈值项**<br>只列关键体效应项，不是 BSIM3 完整阈值式 | $V_T\supset K_1(\sqrt{\Phi-V_{BS}}-\sqrt{\Phi})$ | §3.6.2 | 90 | [109](/native-workbench?page=109) |
| **BSIM3 临界电场参数**<br>速度饱和模型中参数关系 | $E_c=\frac{2\,VSAT}{\mu_v}$ | 式 (3.20) | 90 | [109](/native-workbench?page=109) |
| **迁移率随温度变化**<br>教材近似温度依赖 | $\mu(T)=\mu_0(\frac T{300\,\mathrm K})^{-1.5}$ | 式 (3.24) | 95 | [114](/native-workbench?page=114) |

## 第 4 章：MOS 反相器

<small>教材范围：印刷第 108—147 页</small>

| 公式名称 | 速查表达式 | 原书式号／定位 | 印刷页 | PDF 页序 · Typst 校对 |
|---|---|---|---:|---|
| **反相器直流增益**<br>VTC 的带符号斜率 | $A_v=\frac{dV_{out}}{dV_{in}}$ | 式 (4.1) | 109 | [128](/native-workbench?page=128) |
| **单源高噪声容限**<br>以切换点 $V_S$ 为判别界限 | $SSNM_H=V_{OH}-V_S$ | 式 (4.2) | 112 | [131](/native-workbench?page=131) |
| **单源低噪声容限**<br>同上 | $SSNM_L=V_S-V_{OL}$ | 式 (4.2) | 112 | [131](/native-workbench?page=131) |
| **多源高噪声容限**<br>斜率为 −1 的 VTC 输入界限 | $NM_H=V_{OH}-V_{IH}$ | 式 (4.3) | 114 | [133](/native-workbench?page=133) |
| **多源低噪声容限**<br>斜率为 −1 的 VTC 输入界限 | $NM_L=V_{IL}-V_{OL}$ | 式 (4.3) | 114 | [133](/native-workbench?page=133) |
| **电阻负载电流平衡**<br>直流输出低电平 | $I_{DS}=I_R=\frac{V_{DD}-V_{OL}}{R_L}$ | 式 (4.4) | 116 | [135](/native-workbench?page=135) |
| **电阻负载输出高**<br>输入低、下拉截止 | $V_{OH}=V_{DD}$ | 式 (4.5) | 117 | [136](/native-workbench?page=136) |
| **电阻负载静态功率**<br>输出低电平状态 | $P=\frac{V_{DD}-V_{OL}}{R_L}V_{DD}$ | 式 (4.7) | 117 | [136](/native-workbench?page=136) |
| **电阻负载 $V_{IL}$**<br>长沟道一阶推导 | $V_{IL}=V_T+\frac1{kR_L}$ | 式 (4.8b) | 118 | [137](/native-workbench?page=137) |
| **CMOS 开关点**<br>教材简化短沟道双饱和电流平衡 | $V_S=\frac{V_{DD}-\lvert V_{TP}\rvert+\chi V_{TN}}{1+\chi}$ | 式 (4.14) | 129 | [148](/native-workbench?page=148) |
| **开关点尺寸系数**<br>教材短沟道近似中使用 | $\chi=\sqrt{\frac{W_N/(E_{cN}L_N)}{W_P/(E_{cP}L_P)}}$ | 式 (4.15) 附近 | 129 | [148](/native-workbench?page=148) |
| **伪 NMOS 输出高**<br>PMOS 常导通，上拉稳定态 | $V_{OH}=V_{DD}$ | 式 (4.20) | 136 | [155](/native-workbench?page=155) |
| **反相器下降指数响应**<br>等效电阻 + 一阶 RC | $V_{out}(t)=V_{DD}e^{-t/(R_NC_L)}$ | 式 (4.22a) | 138 | [157](/native-workbench?page=157) |
| **反相器上升指数响应**<br>等效电阻 + 一阶 RC | $V_{out}(t)=V_{DD}(1-e^{-t/(R_PC_L)})$ | 式 (4.22b) | 138 | [157](/native-workbench?page=157) |
| **反相器 50% 延迟**<br>一阶 RC 的阈值传播时间 | $t_{50\%}\approx0.69R_{eff}C_L$ | 式 (4.22c) | 138 | [157](/native-workbench?page=157) |

## 第 5 章：静态 MOS 门与功耗

<small>教材范围：印刷第 148—188 页</small>

| 公式名称 | 速查表达式 | 原书式号／定位 | 印刷页 | PDF 页序 · Typst 校对 |
|---|---|---|---:|---|
| **复合门 AOI22**<br>PUN/PDN 互补 | $F=\overline{AB+CD}$ | §5.3 / 例 5.3 | 161 | [180](/native-workbench?page=180) |
| **SR 锁存器延迟**<br>例题的一阶门延迟估算 | $t_{PHL}\approx0.7R_{eq}C_L$ | 例 5.4 | 166 | [185](/native-workbench?page=185) |
| **稳态电源功率**<br>电源端瞬时/平均电流口径要一致 | $P=I_DV_{DD}$ | 式 (5.7) | 173 | [192](/native-workbench?page=192) |
| **平均开关电流**<br>电容充放电平均电流 | $I_{D,avg}=C_LV_{DD}f_{avg}$ | 式 (5.8) | 173 | [192](/native-workbench?page=192) |
| **开关功率**<br>按每单位时间有效充电次数计 | $P_{switching}=C_LV_{DD}^{2}f_{avg}$ | 式 (5.9) | 173 | [192](/native-workbench?page=192) |
| **短路功率**<br>过渡期间上下管短暂同时导通 | $P_{SC}=\Delta t_{sc}I_{SC,avg}V_{DD}f_{clk}$ | 式 (5.11) | 176 | [195](/native-workbench?page=195) |
| **短路功率等效因子**<br>等效活动因子表示 | $P_{SC}=\alpha_{sc}C_LV_{DD}^{2}f_{clk}$ | 式 (5.12) | 176 | [195](/native-workbench?page=195) |
| **总动态功率**<br>此处 $\alpha$ 已合并切换及短路效应 | $P_{dynamic}=\alpha C_LV_{DD}^{2}f_{clk}$ | 式 (5.13) | 176 | [195](/native-workbench?page=195) |
| **动态与漏电功率**<br>忽略额外直流通路时 | $P=\alpha CV_{DD}^{2}f_{clk}+I_{leak}V_{DD}$ | 式 (5.17) | 180 | [199](/native-workbench?page=199) |
| **含直流通路功率**<br>原书特定活动假定下的 1/2 系数 | $P=\alpha CV_{DD}^{2}f_{clk}+I_{leak}V_{DD}+\frac12 I_{DC}V_{DD}$ | 式 (5.18) | 180 | [199](/native-workbench?page=199) |

## 第 6 章：高速 CMOS 与逻辑努力

<small>教材范围：印刷第 189—234 页</small>

| 公式名称 | 速查表达式 | 原书式号／定位 | 印刷页 | PDF 页序 · Typst 校对 |
|---|---|---|---:|---|
| **低到高延迟（电流模型）**<br>平均充电电流近似 | $t_{pLH}=\frac{C_L(V_{DD}/2)}{I_{LH}}$ | 式 (6.1) | 192 | [211](/native-workbench?page=211) |
| **高到低延迟（电流模型）**<br>平均放电电流近似 | $t_{pHL}=\frac{C_L(V_{DD}/2)}{I_{HL}}$ | 式 (6.2) | 192 | [211](/native-workbench?page=211) |
| **平均传播延迟**<br>电压中点定义 | $t_p=\frac{t_{pLH}+t_{pHL}}2$ | 式 (6.3) | 192 | [211](/native-workbench?page=211) |
| **NMOS 等效电阻**<br>把电流模型折算为 RC 模型 | $R_N=\frac{V_{DD}/2}{0.7 I_{Dsat,n}}$ | 式 (6.4b) | 192 | [211](/native-workbench?page=211) |
| **PMOS 等效电阻**<br>同上 | $R_P=\frac{V_{DD}/2}{0.7 I_{Dsat,p}}$ | 式 (6.5b) | 192 | [211](/native-workbench?page=211) |
| **宽长比下的电阻**<br>固定工艺下的简化缩放 | $R_N=R_{eqn}\frac{L_n}{W_n}$ | 式 (6.6) | 193 | [212](/native-workbench?page=212) |
| **输出总负载**<br>自身、连线、扇出三部分 | $C_{load}=C_{self}+C_{wire}+C_{fanout}$ | 式 (6.7) | 196 | [215](/native-workbench?page=215) |
| **门扇出电容**<br>各后级输入电容求和 | $C_{fanout}=\sum_i C_{G,i}$ | §6.3.1 / 式 (6.8) | 196 | [215](/native-workbench?page=215) |
| **CMOS 自身电容**<br>特定反相器近似 | $C_{self}=C_{eff}(W_n+W_p)$ | 式 (6.10) | 198 | [217](/native-workbench?page=217) |
| **连线电容**<br>单位长度线电容 | $C_{wire}=C_{int}L_W$ | 式 (6.12) | 203 | [222](/native-workbench?page=222) |
| **输出电流与电压斜率**<br>注意原书电流方向约定 | $i_{out}=C_L\frac{dV_{out}}{dt}$ | 式 (6.13) | 203 | [222](/native-workbench?page=222) |
| **斜坡输入的延迟修正**<br>书中线性上升电流近似 | $t_{pHL,ramp}\approx t_{pHL,step}+\frac{t_r}{4}$ | §6.4 / 推导 | 206 | [225](/native-workbench?page=225) |
| **反相器输入电容**<br>平衡尺寸的逻辑努力分析 | $C_{in}=C_g(W_n+W_p)$ | 式 (6.16) | 211 | [230](/native-workbench?page=230) |
| **反相器等效输出电阻**<br>简化下拉导通电阻 | $R_{eff}=R_{eqn}\frac{L_n}{W_n}$ | 式 (6.17) | 211 | [230](/native-workbench?page=230) |
| **反相器固有时间常数**<br>原书基准 $W_p=2W_n$ | $\tau_{inv}=3R_{eqn}C_gL_n$ | 式 (6.18) | 211 | [230](/native-workbench?page=230) |
| **反相器寄生系数**<br>相对输入电容 | $\gamma_{inv}=\frac{C_{self}}{C_{in}}$ | 式 (6.20) | 212 | [231](/native-workbench?page=231) |
| **反相器链级数**<br>每级等比尺寸比 $f$ | $N=\frac{\ln(C_{load}/C_{in})}{\ln f}$ | 式 (6.21) | 213 | [232](/native-workbench?page=232) |
| **反相器链总延迟**<br>各级等电气扇出 | $D=N\tau_{inv}(f+\gamma_{inv})$ | 式 (6.22) | 213 | [232](/native-workbench?page=232) |
| **反相器链延迟-扇出关系**<br>确定最佳级间尺寸比 | $D=\frac{\ln(C_{load}/C_{in})}{\ln f}\tau_{inv}(f+\gamma_{inv})$ | 式 (6.23) | 213 | [232](/native-workbench?page=232) |
| **逻辑努力归一化**<br>逻辑努力、电气扇出、寄生 | $D=\sum_i(LE_i\cdot FO_i+P_i)$ | §6.6.1 | 218 | [237](/native-workbench?page=237) |
| **NAND2 逻辑努力**<br>相同驱动的反相器为 1 | $LE_{NAND2}=\frac43$ | §6.6.1 | 218 | [237](/native-workbench?page=237) |
| **NOR2 逻辑努力**<br>按教材尺寸假设 | $LE_{NOR2}=\frac53$ | §6.6.1 | 218 | [237](/native-workbench?page=237) |
| **路径努力**<br>逻辑、分支、电气因素 | $F=\prod_i(LE_i\cdot BE_i\cdot FO_i)$ | §6.6.3 | 226 | [245](/native-workbench?page=245) |
| **最优级努力**<br>级努力均衡时 | $f^*=F^{1/N}$ | §6.6.3 | 226 | [245](/native-workbench?page=245) |


## 使用公式前的检查

- **器件工作区**：确认 $V_{GS}$、$V_{DS}$、$V_{SB}$ 和阈值，并区分式 (2.18) 的长沟道条件与式 (2.28) 的速度饱和条件。
- **模型来源**：式 (2.17)—(2.20) 的平方律模型不能代替 BSIM3v3 的完整数值仿真；需真实工艺角数据时查[模型及数据表](/reference/data-tables)。
- **负载与电容**：$C_{ox}$ 是单位面积电容，$C_{GS}$、$C_{GD}$ 和结电容还与偏置及几何尺寸有关。
- **功率中的活动因子**：式 (1.5) 使用简化频率口径，式 (5.13)/(5.17) 使用 $\alpha$；不能机械重复计入短路功耗。
- **公式编号中的“附近”**：用于原书该页的定律或相邻式推导，非伪造独立编号。


本页共有 **97 项**公式和公式组；继续查看[第 7—11 章公式速查](/reference/formula-index-systems)。
