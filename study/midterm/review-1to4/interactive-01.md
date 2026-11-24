# 第1章交互训练 · 深亚微米数字集成电路设计

本章有 **12道基础题 + 8道进阶题**，答案折叠显示。勾选“已掌握”后，当前浏览器会保存进度；各章共享存储，互不清除。

<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue'
const done = ref<Record<string, boolean>>({})
const storageKey = 'hspice-ch1to4-progress-v1'
const count = computed(() => Object.entries(done.value).filter(([id, value]) => value && (id.startsWith('S1-') || id.startsWith('A1-'))).length)
onMounted(() => {
  try {
    const parsed = JSON.parse(window.localStorage.getItem(storageKey) || '{}')
    if (parsed && typeof parsed === 'object' && !Array.isArray(parsed)) {
      done.value = Object.fromEntries(Object.entries(parsed).filter(([id, value]) => /^[SA][1-4]-(0[1-9]|1[0-2])$/.test(id) && value === true))
    }
  } catch { /* local storage may be unavailable */ }
})
watch(done, v => {
  try { if (typeof window !== 'undefined') window.localStorage.setItem(storageKey, JSON.stringify(v)) } catch { /* disabled storage */ }
}, { deep: true })
function resetChapter() {
  done.value = Object.fromEntries(Object.entries(done.value).filter(([id]) => !(id.startsWith('S1-') || id.startsWith('A1-'))))
}
</script>

<div class="review-quiz-progress" role="status">本章已掌握 {{ count }} / 20 题 <button type="button" @click="resetChapter">仅重置本章</button></div>

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

## 本章进阶综合题（A1-01～A1-08）

### A1-01

**A1-01 · 德摩根律与多级门**

令 $F=\overline{(A+B)C}$。要求：(1) 化为仅含与、或、非的表达式；(2) 在 $(A,B,C)=(1,0,1)$ 和 $(0,0,1)$ 时求 $F$；(3) 说明为什么不能直接写成 $\overline A+\overline B+\overline C$。

::: details 展开A1-01详细解析

从外层乘积开始使用德摩根律：

$$F=\overline{A+B}+\overline C=\overline A\,\overline B+\overline C.$$

输入 $(1,0,1)$：$\overline A\,\overline B=0$、$\overline C=0$，故 $F=0$。输入 $(0,0,1)$：第一项为 1，故 $F=1$。

**易错点：** 取反必须按表达式的括号层次进行；$\overline{A+B}$ 是 $\overline A\,\overline B$，不是 $\overline A+\overline B$。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A1-01']" /> 已掌握 A1-01</label>

### A1-02

**A1-02 · 最小项化简与逻辑函数**

三输入组合函数在最小项 $m(1,3,4,5,7)$ 上输出 1（编号按 $ABC$ 的二进制值）。化简 $F(A,B,C)$，并解释输入 $ABC=100$ 为什么输出 1。

::: details 展开A1-02详细解析

编号为 $1,3,5,7$ 的四个最小项均满足 $C=1$，合成一项 $C$；额外的最小项 $m4=100$ 可与 $m5=101$ 配对，形成 $A\overline B$。

$$\boxed{F=C+A\overline B}.$$

当 $ABC=100$，有 $C=0$，但 $A\overline B=1\cdot1=1$，故 $F=1$。

**易错点：** 最小项 $m4$ 是 100，不是 011。化简后需逐个回验原始 1 集合，防止引入额外的 1。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A1-02']" /> 已掌握 A1-02</label>

### A1-03

**A1-03 · 跨级噪声容限**

门 G1 输出范围为 $V_{OH}=1.10$ V、$V_{OL}=0.08$ V；被它驱动的 G2 输入边界为 $V_{IL}=0.35$ V、$V_{IH}=0.82$ V。计算这一级接口的 $NM_L,NM_H$ 和最小噪声裕量。若输出低电平受到幅度 $+0.30$ V 的干扰，能否保证仍被 G2 判为低？

::: details 展开A1-03详细解析

静态噪声容限由**前级输出**与**后级输入**边界计算：

$$NM_L=0.35-0.08=\boxed{0.27\;\text{V}},$$

$$NM_H=1.10-0.82=\boxed{0.28\;\text{V}}.$$

最小裕量为 $0.27$ V。低电平受到 $+0.30$ V 干扰后达到 $0.08+0.30=0.38$ V，已超过 G2 允许的低输入上限 $0.35$ V，**不能保证**仍被识别为低。

**易错点：** 不能把 G1 的 $V_{IL}$ 与 G1 的 $V_{OL}$ 相减来评价 G1→G2 的兼容接口，必须使用接收端的输入规范。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A1-03']" /> 已掌握 A1-03</label>

### A1-04

**A1-04 · 逐级传播延迟和最坏沿**

三个反相器依次串联，它们的 $(t_{pHL},t_{pLH})$ 分别为 $(35,55)$ ps、$(45,60)$ ps、$(50,70)$ ps。求输入上升沿、下降沿分别到第三级输出的延迟，并找出最坏沿。

::: details 展开A1-04详细解析

输入上升：第 1 级下降 $35$ ps → 第 2 级上升 $60$ ps → 第 3 级下降 $50$ ps。

$$t_{\uparrow\text{in}}=35+60+50=\boxed{145\;\text{ps}}.$$

输入下降：第 1 级上升 $55$ ps → 第 2 级下降 $45$ ps → 第 3 级上升 $70$ ps。

$$t_{\downarrow\text{in}}=55+45+70=\boxed{170\;\text{ps}}.$$

因此最坏路径为输入下降沿对应的 $170$ ps，末级输出为上升沿。

**易错点：** 每次反相都交换沿的方向，不得直接把各级同一种 $t_{pHL}$ 相加。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A1-04']" /> 已掌握 A1-04</label>

### A1-05

**A1-05 · 多节点动态功率汇总**

一数字模块有三类输出节点，按“每周期 0→1 充电次数”定义活动因子，其 $(\alpha,C_L)$ 分别是 $(0.25,20\,\mathrm{fF})$、$(0.10,40\,\mathrm{fF})$、$(0.50,10\,\mathrm{fF})$。供电 $1.2$ V，频率 $500$ MHz。求全部三类节点的动态充电功率。

::: details 展开A1-05详细解析

逐项求平均充电电容：

$$\sum\alpha_i C_i=0.25(20)+0.10(40)+0.50(10)=14\;\mathrm{fF}.$$

因此

$$P_\mathrm{dyn}=V_{DD}^2f\sum\alpha_iC_i
=(1.2)^2(500\times10^6)(14\times10^{-15})
=\boxed{10.08\;\mu\mathrm W}.$$

**易错点：** 活动因子必须与题设定义一致。这里的 $\alpha$ 已是 0→1 次数/周期，不能再擅自乘 $1/2$。此结果不含内部短路功耗或泄漏功耗。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A1-05']" /> 已掌握 A1-05</label>

### A1-06

**A1-06 · 扇出增加造成的延迟变化**

一个反相器等效输出电阻 $R_\mathrm{eq}=6\,\mathrm{k\Omega}$，自身输出扩散电容 $3$ fF，互连电容 $5$ fF，每个后级输入电容 $2$ fF。分别计算驱动 4 个和 8 个相同后级时的总负载及一阶传播延迟；其他条件不变。

::: details 展开A1-06详细解析

四路扇出：

$$C_{L4}=3+5+4\times2=\boxed{16\;\mathrm{fF}},$$
$$t_4\approx0.69(6\,\mathrm{k\Omega})(16\,\mathrm{fF})=\boxed{66.24\;\mathrm{ps}}.$$

八路扇出：

$$C_{L8}=3+5+8\times2=\boxed{24\;\mathrm{fF}},$$
$$t_8\approx0.69(6\,\mathrm{k\Omega})(24\,\mathrm{fF})=\boxed{99.36\;\mathrm{ps}}.$$

延迟增加 $33.12$ ps，约为原来的 $1.5$ 倍。

**易错点：** 扇出翻倍不意味着总电容必然翻倍，因为互连电容和本级扩散电容不会随本题扇出数改变。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A1-06']" /> 已掌握 A1-06</label>

### A1-07

**A1-07 · 静态冒险与冗余项**

考虑两级与或逻辑 $F=AB+\overline AC$。当 $B=C=1$ 且 $A$ 从 0 变到 1，理想布尔输出是否变化？实际门延迟不同可能出现何种异常？给出一种用共识项消除静态 1 冒险的表达式。

::: details 展开A1-07详细解析

令 $B=C=1$：

$$F=A+\overline A=1.$$

因此理想输出始终为 1。实际硬件中，$\overline A$ 路径与 $A$ 路径延迟不同，两个乘积项可能短暂同时为 0，使输出出现**静态 1 冒险（短暂低脉冲）**。

根据共识项规则补入 $BC$：

$$\boxed{F=AB+\overline AC+BC}.$$

因为 $BC$ 是冗余项，它不会改变布尔函数，但当 $B=C=1$ 时始终保持 1，可消除该二级与或结构在这一切换下的静态冒险。

**易错点：** “真值表不变”不等于“模拟瞬态波形不可能有毛刺”。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A1-07']" /> 已掌握 A1-07</label>

### A1-08

**A1-08 · 时钟周期预算**

同步路径的时钟到 Q 延迟 $t_{CQ}=0.08$ ns、组合逻辑最坏延迟 $t_{comb}=0.45$ ns、接收触发器建立时间 $t_{setup}=0.07$ ns，另有不利时钟偏差 $0.03$ ns。忽略抖动和不确定度时，求最小时钟周期和最大频率。

::: details 展开A1-08详细解析

最小时钟周期必须覆盖发射延迟、组合逻辑、建立时间和不利偏差：

$$T_\mathrm{min}\ge t_{CQ}+t_{comb}+t_{setup}+t_{skew}
=0.08+0.45+0.07+0.03=\boxed{0.63\;\mathrm{ns}}.$$

$$f_\mathrm{max}\approx\frac1{0.63\,\mathrm{ns}}=\boxed{1.59\;\mathrm{GHz}}.$$

**易错点：** 只看组合逻辑延迟会高估频率；建立时间和时钟偏差是约束的一部分。本题属于数字设计性能拓展，非对教材原题的逐字复刻。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A1-08']" /> 已掌握 A1-08</label>

---

[四章互动入口](/review-1to4/interactive) · [教材原例题索引](/review-1to4/textbook-examples) · [计算方法](/review-1to4/calculation-methods) · [HSPICE在线实验](/review-1to4/online-lab)
