# 48题交互式复习

先独立作答，再展开解析；完成后勾选掌握情况。

<script setup lang="ts">
import { ref, computed } from 'vue'
const done = ref<Record<string, boolean>>({})
const score = computed(() => Object.values(done.value).filter(Boolean).length)
function clearAll() { done.value = {} }
</script>

<div class="review-quiz-progress" role="status">掌握 {{ score }} / 48 题 <button type="button" @click="clearAll">重置</button></div>

## 第1章 深亚微米数字集成电路设计

### S1-01

**S1-01〔基础·逻辑代数〕** 运用德摩根律化简 $F=\overline{AB+C}$，并写成仅包含非、与、或的表达式。

::: details 点击展开本题解析

$$F=\overline{AB+C}=\overline{AB}\cdot\overline C=(\overline A+\overline B)\overline C.$$

第一步对整个或项取反，第二步对乘积 $AB$ 取反。**易错：** $\overline{AB}$ 不是 $\overline A\,\overline B$，而是 $\overline A+\overline B$。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S1-01']" /> 已掌握 S1-01</label>

### S1-02

**S1-02〔基础·门级实现〕** 只允许使用**2输入NAND**门，构造 $F=AB+CD$，至少写出每级中间节点的布尔表达式。

::: details 点击展开本题解析

令 $X=\overline{AB}=\operatorname{NAND}(A,B)$，$Y=\overline{CD}=\operatorname{NAND}(C,D)$，则

$$F=\overline{XY}=\operatorname{NAND}(X,Y)=AB+CD.$$

因此共用3个2输入NAND门。以德摩根律检验最后一步可知输出确实为两个积项的或。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S1-02']" /> 已掌握 S1-02</label>

### S1-03

**S1-03〔基础·真值判断〕** 输入 $A=1,B=0$ 时，分别写出 $A\oplus B$、$\overline{A+B}$、$\overline{AB}$ 三个逻辑函数的结果。

::: details 点击展开本题解析

$A\oplus B=1$；$\overline{A+B}=\overline1=0$；$\overline{AB}=\overline0=1$。依次为 **1、0、1**。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S1-03']" /> 已掌握 S1-03</label>

### S1-04

**S1-04〔进阶·真值表〕** 为 $F=A\overline B+BC$ 写出按 $ABC=000,001,010,011,100,101,110,111$ 顺序排列的8位输出序列。

::: details 点击展开本题解析

$$F=A\overline B+BC.$$

| $A$ | $B$ | $C$ | $A\overline B$ | $BC$ | $F$ |
|:--:|:--:|:--:|:--:|:--:|:--:|
| 0 | 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 | 1 | 1 |
| 1 | 0 | 0 | 1 | 0 | 1 |
| 1 | 0 | 1 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 0 | 0 |
| 1 | 1 | 1 | 0 | 1 | 1 |

所以8位输出序列为 **00011101**。可用“$B=0$时$F=A$；$B=1$时$F=C$”快速复查。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S1-04']" /> 已掌握 S1-04</label>

### S1-05

**S1-05〔基础·电平定义〕** 一反相器满足 $V_{OH}=1.2\,V$、$V_{OL}=0.06\,V$、$V_{IL}=0.38\,V$、$V_{IH}=0.79\,V$。求 $NM_L$ 与 $NM_H$，判断哪一个更小。

::: details 点击展开本题解析

$$NM_L=V_{IL}-V_{OL}=0.38-0.06=\boxed{0.32\,V}.$$

$$NM_H=V_{OH}-V_{IH}=1.20-0.79=\boxed{0.41\,V}.$$

低电平噪声容限更小，低电平侧更敏感。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S1-05']" /> 已掌握 S1-05</label>

### S1-06

**S1-06〔理解·VTC〕** 某VTC图上出现三个特殊位置：输出与输入相等的点；斜率为$-1$的左侧点和右侧点。它们分别定义哪个参数？为何不能全部叫作开关阈值？

::: details 点击展开本题解析

$V_{out}=V_{in}$ 的点定义为 **开关电压 $V_M$**。左侧和右侧斜率为$-1$的点分别给出 **$V_{IL}$** 与 **$V_{IH}$**。三者的定义条件不同。前者反映输入/输出的交点；后两者定义保证逻辑电平、计算静态噪声容限时使用的输入区间边界。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S1-06']" /> 已掌握 S1-06</label>

### S1-07

**S1-07〔计算·级联延迟〕** 连续串联4个反相器，每级 $t_{pHL}=40\,ps$、$t_{pLH}=60\,ps$，输入发生一次上升沿。求第4级输出上升沿相对输入上升沿的总延迟。

::: details 点击展开本题解析

输入上升→第1级下降（40ps）→第2级上升（60ps）→第3级下降（40ps）→第4级上升（60ps）：

$$t_{path}=40+60+40+60=\boxed{200\,ps}.$$

最终输出为**上升沿**，因为4次逻辑反相恢复原信号极性。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S1-07']" /> 已掌握 S1-07</label>

### S1-08

**S1-08〔计算·RC延迟〕** 原书P1.8关联知识点。电阻 $R=12.5\,k\Omega$ 驱动电容 $C=100\,fF$，若作为一阶RC过程，求时间常数 $RC$ 与50%延迟 $0.69RC$。

::: details 点击展开本题解析

$$\tau=RC=(12.5\times10^3)(100\times10^{-15})=1.25\times10^{-9}\,s=\boxed{1.25\,ns}.$$

$$t_{50\%}\approx0.69RC=0.69\times1.25=\boxed{0.8625\,ns}.$$

不要把时间常数与50%响应时间等同；$0.69$来自 $-\ln(0.5)=\ln2$。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S1-08']" /> 已掌握 S1-08</label>

### S1-09

**S1-09〔计算·动态功率〕** 一个门的平均充电次数因子 $\alpha=0.18$，$C_L=30\,fF$、$V_{DD}=1.0\,V$、$f=400\,MHz$。求动态功率。

::: details 点击展开本题解析

$$P=\alpha C_LV_{DD}^2f=0.18\times30\times10^{-15}\times(1.0)^2\times400\times10^6,$$

$$\boxed{P=2.16\times10^{-6}\,W=2.16\,\mu W}.$$

其中 $\alpha$ 按题目明确定义为每个周期0→1充电次数的平均值。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S1-09']" /> 已掌握 S1-09</label>

### S1-10

**S1-10〔计算·静态功率〕** 一数字单元在稳定输入时的漏电流为 $10\,\mu A$，供电 $1.2\,V$。求静态泄漏功率。

::: details 点击展开本题解析

$$P_{leak}=V_{DD}I_{leak}=1.2\times10\times10^{-6}=\boxed{12\,\mu W}.$$

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S1-10']" /> 已掌握 S1-10</label>

### S1-11

**S1-11〔综合·扇出与延迟〕** 一个门的输出驱动3个同类门，每个输入栅电容 $2\,fF$，另有走线和结电容合计 $4\,fF$。若等效输出电阻 $8\,k\Omega$，求 $C_L$ 和一阶RC传播延迟。

::: details 点击展开本题解析

$$C_L=3\times2\,fF+4\,fF=\boxed{10\,fF}.$$

$$t_p\approx0.69R_{eq}C_L=0.69\times8\times10^3\times10\times10^{-15}=\boxed{55.2\,ps}.$$

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S1-11']" /> 已掌握 S1-11</label>

### S1-12

**S1-12〔理解·功耗权衡〕** 其他条件不变，供电电压从 $0.8\,V$ 提高至 $1.6\,V$。按动态功耗公式，动态功率如何变化？同时指出这一公式未考虑的至少一种实际效应。

::: details 点击展开本题解析

在 $\alpha,C,f$ 不变时

$$\frac{P_{dyn,new}}{P_{dyn,old}}=\left(\frac{1.6}{0.8}\right)^2=\boxed{4}.$$

现实中改变电源电压还可能影响延迟、短路电流、漏电以及能否处于器件额定工作范围。故公式结论对应**指定量不变**的理想化比较。

# 第2章答案

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S1-12']" /> 已掌握 S1-12</label>

## 第2章 MOS 晶体管

### S2-01

**S2-01〔基础·工作区〕** NMOS阈值 $V_T=0.40\,V$，$V_{GS}=0.80\,V$，$V_{DS}=0.15\,V$。写出过驱动电压并判定工作区。

::: details 点击展开本题解析

$$V_{OV}=V_{GS}-V_T=0.80-0.40=\boxed{0.40\,V}.$$

因 $V_{GS}>V_T$ 且 $0<V_{DS}=0.15<0.40=V_{OV}$，属于 **线性（三极管）区**。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S2-01']" /> 已掌握 S2-01</label>

### S2-02

**S2-02〔计算·线性区〕** NMOS具有 $k'_n=200\,\mu A/V^2$，$W/L=4$，$V_T=0.4\,V$，$V_{GS}=1.0\,V$，$V_{DS}=0.2\,V$。求 $I_D$。

::: details 点击展开本题解析

先算 $\beta=k'_nW/L=200\times4=800\,\mu A/V^2$。$V_{OV}=1.0-0.4=0.6\,V$；$V_{DS}=0.2<0.6$，线性区成立。

$$I_D=800\left(0.6\times0.2-\frac{0.2^2}{2}\right)=800(0.12-0.02)=\boxed{80\,\mu A}.$$

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S2-02']" /> 已掌握 S2-02</label>

### S2-03

**S2-03〔计算·饱和区〕** 保持S2-02器件和 $V_{GS}$ 不变，将 $V_{DS}$ 提高到 $0.8\,V$。判断工作区，求 $I_D$。

::: details 点击展开本题解析

$V_{DS}=0.8\,V\geq V_{OV}=0.6\,V$，所以饱和。

$$I_D=\frac{800}{2}(0.6)^2=\boxed{144\,\mu A}.$$

电压继续升高并不适合再使用线性区公式；本题按忽略沟道长度调制求解。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S2-03']" /> 已掌握 S2-03</label>

### S2-04

**S2-04〔进阶·源极不接地〕** NMOS的 $V_G=1.2\,V$、$V_D=1.2\,V$、$V_S=0.7\,V$、$V_B=0.7\,V$，阈值 $0.4\,V$。判断导通与工作区。此题不能把 $V_G$ 当作 $V_{GS}$。

::: details 点击展开本题解析

$$V_{GS}=V_G-V_S=1.2-0.7=0.5\,V>V_T=0.4\,V,$$

$$V_{OV}=0.1\,V,\qquad V_{DS}=V_D-V_S=1.2-0.7=0.5\,V.$$

因此NMOS导通且 **饱和区**（$0.5\geq0.1$）。体端与源端同为0.7V，此题 $V_{SB}=0$，无需额外体效应修正。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S2-04']" /> 已掌握 S2-04</label>

### S2-05

**S2-05〔基础·PMOS〕** PMOS源极 $V_S=1.2\,V$，栅极 $V_G=0.2\,V$，漏极 $V_D=0.8\,V$，$|V_{Tp}|=0.4\,V$。用 $V_{SG}$、$V_{SD}$ 判断工作区。

::: details 点击展开本题解析

$$V_{SG}=1.2-0.2=1.0\,V,\qquad V_{SD}=1.2-0.8=0.4\,V.$$

PMOS过驱动为 $V_{SG}-|V_{Tp}|=1.0-0.4=0.6\,V$。因为 $V_{SD}=0.4<0.6$，器件在线性区。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S2-05']" /> 已掌握 S2-05</label>

### S2-06

**S2-06〔计算·体效应〕** $V_{T0}=0.40\,V$、$\gamma=0.45\,V^{1/2}$、$2\phi_F=0.70\,V$、$V_{SB}=0.50\,V$。计算体效应后的阈值。

::: details 点击展开本题解析

$$V_T=0.40+0.45(\sqrt{0.70+0.50}-\sqrt{0.70})$$

$$=0.40+0.45(1.09545-0.83666)\approx\boxed{0.516\,V}.$$

体效应使阈值比原来的0.4V高约0.116V。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S2-06']" /> 已掌握 S2-06</label>

### S2-07

**S2-07〔计算·单位面积栅氧化层电容〕** 氧化层相对介电常数3.9，真空介电常数 $8.85\times10^{-12}\,F/m$，氧化层厚度 $t_{ox}=5\,nm$。求单位面积 $C_{ox}$，分别用 $F/m^2$ 和 $fF/\mu m^2$ 表示。

::: details 点击展开本题解析

$$C_{ox}=\frac{\varepsilon_{ox}}{t_{ox}}=\frac{3.9(8.85\times10^{-12})}{5\times10^{-9}}=\boxed{6.903\times10^{-3}\,F/m^2}.$$

因为 $1F/m^2=1000fF/\mu m^2$，得

$$\boxed{C_{ox}\approx6.90\,fF/\mu m^2}.$$

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S2-07']" /> 已掌握 S2-07</label>

### S2-08

**S2-08〔计算·几何栅电容尺度〕** 已知 $C_{ox}=6.9\,fF/\mu m^2$、$W=1.5\,\mu m$、$L=0.20\,\mu m$。求 $C_{ox}WL$。

::: details 点击展开本题解析

$$C_{ox}WL=6.9\times1.5\times0.20=\boxed{2.07\,fF}.$$

这只是本征栅氧化层的总面积电容尺度，并不表示任意偏置下 $C_{gs}$ 必然等于2.07fF。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S2-08']" /> 已掌握 S2-08</label>

### S2-09

**S2-09〔理解·宽度缩放〕** 长沟道近似下，保持 $L$ 与偏置条件不变，把晶体管宽度 $W$ 加倍。饱和驱动电流和本征栅面积电容分别如何变化？说明为何不能无代价地无限放大器件。

::: details 点击展开本题解析

在 $L,V_{GS},V_{DS},V_T$ 和有效迁移率等都不变的理想长沟道模型中，$I_{D,sat}\propto W/L$，故**饱和电流约加倍**。$C_{ox}WL\propto W$，故**本征栅面积电容约加倍**。这会增加前级负载，并可能提高面积和扩散寄生；因此尺寸增大并非没有代价。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S2-09']" /> 已掌握 S2-09</label>

### S2-10

**S2-10〔计算·亚阈值〕** 某器件亚阈值摆幅 $S=80\,mV/dec$，在相同 $V_{DS}$ 条件下提高 $V_{GS}$ 共160mV。按局部指数模型，漏电流约增大多少倍？

::: details 点击展开本题解析

$$\Delta\log_{10}I_D=\frac{\Delta V_{GS}}S=\frac{160}{80}=2.$$

$$\frac{I_{new}}{I_{old}}=10^2=\boxed{100\text{倍}}.$$

这是在局部摆幅 $S$ 近似不变时的结论。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S2-10']" /> 已掌握 S2-10</label>

### S2-11

**S2-11〔进阶·速度饱和〕** 教材短沟道近似 $V_{Dsat}\approx V_{OV}E_cL/(V_{OV}+E_cL)$。若 $V_{OV}=0.6\,V$ 且 $E_cL=0.3\,V$，估算 $V_{Dsat}$；与长沟道分界比较。

::: details 点击展开本题解析

$$V_{Dsat}\approx\frac{0.6\times0.3}{0.6+0.3}=\boxed{0.20\,V}.$$

长沟道模型的饱和边界为0.60V，而该短沟道近似预测更早进入速度饱和相关的工作状态。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S2-11']" /> 已掌握 S2-11</label>

### S2-12

**S2-12〔综合·NMOS传输高电平〕** 增强型NMOS用作传输器件，栅极固定 $1.2\,V$，阈值暂按常数 $0.4\,V$。输出端从0V充电时，忽略体效应，输出高电平的近似上限是多少？如果体端固定接地，体效应趋向让这个上限升高还是降低？

::: details 点击展开本题解析

当输出向高电平上升时，$V_{GS}=1.2-V_{out}$ 逐渐减小；接近关断条件时 $V_{GS}\approx V_T$，得到

$$V_{out,max}\approx V_G-V_T=1.2-0.4=\boxed{0.8\,V}.$$

若体端接地，输出作为源端升高使 $V_{SB}$ 增加，NMOS阈值通常上升，故实际高电平上限倾向于**低于0.8V**（不考虑其他特殊效应）。

# 第3章答案

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S2-12']" /> 已掌握 S2-12</label>

## 第3章 制造、版图和模拟

### S3-01

**S3-01〔基础·工艺〕** 对一次典型图形转移，说明“沉积—光刻—刻蚀”分别做什么；它们是否意味着整个芯片制造过程中只执行一次？

::: details 点击展开本题解析

**沉积：** 在基底上形成所需材料薄膜；**光刻：** 利用掩模、曝光与显影形成特定图案的光刻胶；**刻蚀：** 选择性移去暴露区域材料，将图案转移进下层结构。芯片制造要反复经历多个此类循环，另外还有离子注入、退火、氧化、平坦化、互连与封装工序。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S3-01']" /> 已掌握 S3-01</label>

### S3-02

**S3-02〔基础·CMOS结构〕** 在常见p型衬底/n阱CMOS工艺中，NMOS与PMOS分别所在的掺杂区域是什么？为什么需要给阱和体端提供合理电位？

::: details 点击展开本题解析

在常见p型衬底/n阱CMOS工艺中，NMOS形成于p型区域，PMOS位于n阱。合理连接体端和阱电位是为了使源漏—体PN结通常处于合适偏置，控制阈值及隔离，并避免寄生结错误导通等问题。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S3-02']" /> 已掌握 S3-02</label>

### S3-03

**S3-03〔计算·版图比例规则〕** 某示例版图规则令 $\lambda=0.05\,\mu m$。最小线宽 $3\lambda$、最小间距 $2\lambda$，求实际的线宽与间距。

::: details 点击展开本题解析

$$W_{min}=3\lambda=3(0.05)=\boxed{0.15\,\mu m}.$$

$$S_{min}=2\lambda=2(0.05)=\boxed{0.10\,\mu m}.$$

此处 $\lambda$ 是版图比例尺度，不是模型里的沟道长度调制系数。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S3-03']" /> 已掌握 S3-03</label>

### S3-04

**S3-04〔计算·方块电阻〕** 某金属层方块电阻 $R_\square=0.10\,\Omega/\square$。一段长度 $60\,\mu m$、宽度 $0.50\,\mu m$ 的走线，忽略接触电阻，求其电阻。

::: details 点击展开本题解析

方块数 $N=\ell/W=60/0.50=120$。

$$R=R_{\square}N=0.10\times120=\boxed{12\,\Omega}.$$

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S3-04']" /> 已掌握 S3-04</label>

### S3-05

**S3-05〔计算·平行板电容〕** 绝缘介质介电常数 $\varepsilon=3.45\times10^{-11}\,F/m$，电极有效重叠面积 $10\,\mu m\times2\,\mu m$，间距 $0.5\,\mu m$。按平行板近似求电容。

::: details 点击展开本题解析

面积 $A=10\times2\,\mu m^2=20\times10^{-12}\,m^2$；间距 $d=0.5\times10^{-6}\,m$。

$$C\approx\frac{\varepsilon A}d=\frac{3.45\times10^{-11}\times20\times10^{-12}}{0.5\times10^{-6}}$$

$$=1.38\times10^{-15}\,F=\boxed{1.38\,fF}.$$

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S3-05']" /> 已掌握 S3-05</label>

### S3-06

**S3-06〔基础·网表解析〕** 解读网表 `M1 out in 0 0 NMOD L=0.2u W=1u` 中的器件名、四个电路节点、模型名、$L$ 与$W$。写明哪一项是漏极。

::: details 点击展开本题解析

`M1` 是器件实例名；`out` 是漏极D；`in` 是栅极G；第一个`0`是源极S；第二个`0`是体端B；`NMOD`是MOS模型名；`L=0.2u`为沟道长度0.2μm；`W=1u`为宽度1μm。**顺序必须是D G S B。**

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S3-06']" /> 已掌握 S3-06</label>

### S3-07

**S3-07〔理解·电流符号〕** HSPICE中漏极连接理想直流电压源 `VDS d 0 1.2`，扫描时显示 $I(VDS)=-120\,\mu A$。在典型NMOS从该源取电的连接方式下，物理漏电流的正幅值是多少？

::: details 点击展开本题解析

HSPICE理想电压源 `I(VDS)` 按流入该电压源正端为正的约定报告。NMOS从该电源吸收漏电流时，电源电流往往是负的：

$$I_D\approx-I(VDS)=\boxed{120\,\mu A}.$$

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S3-07']" /> 已掌握 S3-07</label>

### S3-08

**S3-08〔排错·模型与子电路〕** 某工艺库仅提供 `.SUBCKT NM18 D G S B ...`，学生却以 `M1 d g s b NM18 L=... W=...` 调用。指出最直接的错误和修复方向。

::: details 点击展开本题解析

`.SUBCKT NM18 ...` 定义的是**子电路**，不能仅凭同名把它作为原生`.MODEL`使用。一般要改成 `X1 d g s b NM18 ...`，并核对 `.SUBCKT` 的引脚声明、参数名称与库的真实语法；不能只把M改成X却不看实际参数规则。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S3-08']" /> 已掌握 S3-08</label>

### S3-09

**S3-09〔基础·分析选择〕** 分别选用 `.op`、`.dc`、`.tran` 中最适合的命令完成：(a) 某偏置点的直流工作点；(b) 扫 $V_{GS}$ 观察 $I_D$；(c) 测输出电压随时间的充放电过程。

::: details 点击展开本题解析

(a) 稳态直流工作点：`.op`；(b) 扫栅电压得到 $I_D$ 曲线：`.dc`；(c) 随时间充放电：`.tran`。如果还要在DC扫描外叠加不同偏置条件，需按照HSPICE版本的双重扫描语法设置。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S3-09']" /> 已掌握 S3-09</label>

### S3-10

**S3-10〔理解·模型比较〕** 为什么同一尺寸和偏置条件下，MOS LEVEL 1与BSIM3可能得到不同的 $I_D$？举出至少三项BSIM3可更详细反映的物理效应或因素。

::: details 点击展开本题解析

LEVEL 1使用较简单的强反型方程和参数；BSIM3考虑更多偏置、几何与物理相关修正。例子：**短沟道阈值变化、迁移率退化、速度饱和、亚阈值漏电、DIBL、寄生电阻/电容**。因此器件的工作区边界和电流不必与平方律一致。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S3-10']" /> 已掌握 S3-10</label>

### S3-11

**S3-11〔理解·PVT〕** 解释PVT三个字母的含义。若从TT切换到FF或SS工艺角，能否只凭字母断言所有电路延迟一定按同一个比例变化？说明理由。

::: details 点击展开本题解析

P=Process工艺，V=Voltage电源/偏置，T=Temperature温度。FF、TT、SS分别表示某种工艺角定义，但**不能单靠标签断言所有电路延迟按同一比例变化**：PMOS/NMOS的相对变化、负载、输入斜率、器件偏置和温度都会影响不同路径。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S3-11']" /> 已掌握 S3-11</label>

### S3-12

**S3-12〔综合·寄生延迟〕** 某节点抽取的等效电阻 $R=2\,k\Omega$，负载总电容 $C=30\,fF$。按集中RC一阶近似求50%延迟；再说出一种导致实际仿真偏离该近似的因素。

::: details 点击展开本题解析

$$t\approx0.69RC=0.69(2\times10^3)(30\times10^{-15})=\boxed{41.4\,ps}.$$

实际偏差的原因包括分布RC、驱动晶体管非线性等效电阻、耦合电容、输入波形斜率和工艺模型差异。

# 第4章答案

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S3-12']" /> 已掌握 S3-12</label>

## 第4章 MOS 反相器电路

### S4-01

**S4-01〔基础·电阻负载〕** 一电阻负载NMOS反相器，$V_{DD}=1.2\,V$。理想下拉NMOS截止、无漏电且无其他负载通路时，求 $V_{OH}$。

::: details 点击展开本题解析

当下拉NMOS截止且没有其他静态通路时，电阻没有电流，因而不存在直流压降：

$$V_{OH}\approx V_{DD}=\boxed{1.2\,V}.$$

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S4-01']" /> 已掌握 S4-01</label>

### S4-02

**S4-02〔计算·KCL求低电平〕** 电阻负载反相器：$V_{DD}=1.2\,V$、$R_L=20\,k\Omega$、$V_T=0.4\,V$、$\beta_n=0.5\,mA/V^2$。当 $V_{in}=1.2\,V$，假定下拉管在线性区，联立KCL求 $V_{OL}$，并核对工作区。

::: details 点击展开本题解析

电阻电流等于下拉管的线性区电流：

$$\frac{1.2-V_{OL}}{20\times10^3}=0.0005\left[(1.2-0.4)V_{OL}-\frac{V_{OL}^2}{2}\right].$$

两边乘以 $20\times10^3$：

$$1.2-V_{OL}=10(0.8V_{OL}-0.5V_{OL}^2)=8V_{OL}-5V_{OL}^2.$$

整理：$5V_{OL}^2-9V_{OL}+1.2=0$。

$$V_{OL}=\frac{9\pm\sqrt{81-24}}{10}=\frac{9\pm\sqrt{57}}{10}.$$

两根约 $0.145\,V$ 与 $1.655\,V$。后者高于电源电压，不符合物理约束；取

$$\boxed{V_{OL}\approx0.145\,V}.$$

核对下拉管：$V_{GS}=1.2\,V$，$V_{OV}=0.8\,V$，$V_{DS}=V_{OL}\approx0.145<0.8$，**线性区假设成立**。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S4-02']" /> 已掌握 S4-02</label>

### S4-03

**S4-03〔计算·静态功耗〕** 沿用S4-02，求输出低电平时的静态电流和电源静态功耗。

::: details 点击展开本题解析

$$I_{DD}=\frac{1.2-0.145}{20\times10^3}=\boxed{52.7\,\mu A}.$$

$$P_{static}=V_{DD}I_{DD}=1.2\times52.7\,\mu A\approx\boxed{63.3\,\mu W}.$$

这说明电阻负载NMOS反相器在输出为低时有持续的直流上拉—下拉通路。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S4-03']" /> 已掌握 S4-03</label>

### S4-04

**S4-04〔理解·增强型NMOS负载〕** 栅极接 $V_{DD}=1.2\,V$ 的增强型NMOS上拉器件，忽略体效应并采用固定阈值 $V_T=0.4\,V$。为什么输出高电平可能止于约0.8V？若考虑正向增加的 $V_{SB}$，估计结果的变化趋势。

::: details 点击展开本题解析

当NMOS上拉接近关断时，$V_{GS}=V_{DD}-V_{out}$ 降至 $V_T$，因此理想上限约

$$V_{OH}\approx V_{DD}-V_T=1.2-0.4=\boxed{0.8\,V}.$$

输出上升同时可能增大 $V_{SB}$，体效应提高阈值，因而输出上限可能进一步**下降**。反之，如果栅极有比VDD更高的专门偏置，计算应依据具体题设重新判断。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S4-04']" /> 已掌握 S4-04</label>

### S4-05

**S4-05〔计算·尺寸平衡〕** CMOS反相器 $k'_n=300\,\mu A/V^2$、$k'_p=100\,\mu A/V^2$，两管沟道长度相同，$W_n=0.20\,\mu m$。要满足 $\beta_n=\beta_p$，$W_p$ 应是多少？

::: details 点击展开本题解析

要 $\beta_n=\beta_p$，且 $L_n=L_p$：

$$k_n'W_n=k_p'W_p\quad\Longrightarrow\quad W_p=\frac{k_n'}{k_p'}W_n.$$

$$W_p=\frac{300}{100}\times0.20=\boxed{0.60\,\mu m}.$$

由于PMOS驱动系数较小，它需要更宽才能达到相近驱动强度。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S4-05']" /> 已掌握 S4-05</label>

### S4-06

**S4-06〔计算·开关点〕** CMOS反相器 $V_{DD}=1.2\,V$，$V_{Tn}=|V_{Tp}|=0.4\,V$，且 $\beta_n=\beta_p$。按长沟道双管饱和近似求 $V_M$。

::: details 点击展开本题解析

定义 $r=\sqrt{\beta_p/\beta_n}=1$，

$$V_M=\frac{V_{Tn}+r(V_{DD}-|V_{Tp}|)}{1+r}=\frac{0.4+(1.2-0.4)}2=\boxed{0.60\,V}.$$

对称阈值与平衡 $\beta$ 下开关点位于半电源电压。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S4-06']" /> 已掌握 S4-06</label>

### S4-07

**S4-07〔计算·不平衡开关点〕** 保持S4-06电压和阈值，但令 $\beta_n/\beta_p=4$。求 $V_M$，并解释开关点为何移动。

::: details 点击展开本题解析

$$r=\sqrt{\frac{\beta_p}{\beta_n}}=\sqrt{\frac14}=0.5.$$

$$V_M=\frac{0.4+0.5(1.2-0.4)}{1+0.5}=\frac{0.8}{1.5}=\boxed{0.533\,V}.$$

NMOS比PMOS强，意味着输入不必升至半电源就能把输出拉向较低电压，因此切换点向**较低输入电压**偏移。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S4-07']" /> 已掌握 S4-07</label>

### S4-08

**S4-08〔计算·噪声容限〕** 某反相器的VTC给出 $V_{OH}=1.20\,V$、$V_{OL}=0.03\,V$、$V_{IL}=0.46\,V$、$V_{IH}=0.76\,V$。求 $NM_L$、$NM_H$，并指出决定较差裕量的一侧。

::: details 点击展开本题解析

$$NM_L=V_{IL}-V_{OL}=0.46-0.03=\boxed{0.43\,V}.$$

$$NM_H=V_{OH}-V_{IH}=1.20-0.76=\boxed{0.44\,V}.$$

低电平一侧略小0.01V，属于更差的噪声裕量。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S4-08']" /> 已掌握 S4-08</label>

### S4-09

**S4-09〔计算·RC传播延迟〕** 一CMOS反相器 $R_n=5\,k\Omega$、$R_p=10\,k\Omega$、$C_L=20\,fF$，求 $t_{pHL}$、$t_{pLH}$ 和平均 $t_p$。

::: details 点击展开本题解析

$$t_{pHL}\approx0.69R_nC_L=0.69(5\,k\Omega)(20\,fF)=\boxed{69\,ps}.$$

$$t_{pLH}\approx0.69R_pC_L=0.69(10\,k\Omega)(20\,fF)=\boxed{138\,ps}.$$

$$t_p=\frac{69+138}{2}=\boxed{103.5\,ps}.$$

延迟不对称源于上拉、下拉等效电阻不同。这里使用单一 $C_L$ 与一阶RC近似。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S4-09']" /> 已掌握 S4-09</label>

### S4-10

**S4-10〔综合·三级串联〕** 三级反相器串联，每级输出下降延迟 $t_{pHL}=50\,ps$，输出上升延迟 $t_{pLH}=70\,ps$。第一级输入上升，第三级输出最终为何种沿？总传播延迟是多少？

::: details 点击展开本题解析

第1级：输入上升→输出下降，延迟50ps；第2级：输入下降→输出上升，延迟70ps；第3级：输入上升→输出下降，延迟50ps。

$$t_{path}=50+70+50=\boxed{170\,ps}.$$

最终是**下降沿**（奇数次反相）。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S4-10']" /> 已掌握 S4-10</label>

### S4-11

**S4-11〔理解·三态与伪NMOS〕** 三态反相器采用高电平有效使能EN。分别给出 $(EN,A)=(0,1),(1,0),(1,1)$ 时的输出。再说明伪NMOS反相器为什么可能在输出低时产生静态功耗。

::: details 点击展开本题解析

高电平使能反相器：

| EN | A | Y |
|:--:|:--:|:--:|
| 0 | 1 | $Z$（高阻） |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

伪NMOS中上拉PMOS常态导通，当输入使下拉NMOS也导通并拉低输出时，出现从 $V_{DD}$ 到GND的静态电流，因而有静态功耗。$Z$不是逻辑低，而是“不主动驱动”。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S4-11']" /> 已掌握 S4-11</label>

### S4-12

**S4-12〔综合·尺寸代价〕** 对同一反相器，把NMOS与PMOS宽度同时加倍，沟道长度不变。按一阶模型，输出等效电阻和自身输入栅电容分别如何变化？在固定 $C_L$ 的条件下本级延迟大致怎样变化？为什么可能拖慢前一级？

::: details 点击展开本题解析

忽略二阶效应，在相同偏置下：$R_n,R_p\propto1/W$，因此器件宽度加倍会使两种等效导通电阻**约减半**；其本征输入栅电容 $C_{in}\propto W$，因此**约加倍**。

如果外部 $C_L$ 固定且占主导，则本级 $0.69R_{eq}C_L$ 延迟**约减半**。但增大的输入电容是前一级的输出负载，前一级充放电变慢；并且本级扩散寄生也随尺寸增加，因此不能用“宽度加倍→整个逻辑链快两倍”推断系统延迟。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['S4-12']" /> 已掌握 S4-12</label>

[返回前四章复习总览](/review-1to4/) · [查看公式速查](/review-1to4/reference)

> 标记状态仅供当前页面使用，重新加载后不保留。
