# 第4章交互训练 · MOS反相器电路

本章有 **12道基础题 + 8道进阶题**，答案折叠显示。勾选“已掌握”后，当前浏览器会保存进度；各章共享存储，互不清除。

<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue'
const done = ref<Record<string, boolean>>({})
const storageKey = 'hspice-ch1to4-progress-v1'
const count = computed(() => Object.entries(done.value).filter(([id, value]) => value && (id.startsWith('S4-') || id.startsWith('A4-'))).length)
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
  done.value = Object.fromEntries(Object.entries(done.value).filter(([id]) => !(id.startsWith('S4-') || id.startsWith('A4-'))))
}
</script>

<div class="review-quiz-progress" role="status">本章已掌握 {{ count }} / 20 题 <button type="button" @click="resetChapter">仅重置本章</button></div>

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

## 本章进阶综合题（A4-01～A4-08）

### A4-01

**A4-01 · KCL 求电阻负载反相器**

$V_{DD}=1.2$V，$R_L=10$kΩ，$\beta_n=0.20$mA/V²，$V_T=0.40$V，$V_{in}=1.2$V。假设NMOS线性区，求 $V_{OL}$，验证工作区和静态功耗。

::: details 展开A4-01详细解析

KCL：$$(1.2-V_o)/10000=0.0002(0.8V_o-V_o^2/2).$$ 整理为 $V_o^2-2.6V_o+1.2=0$，解为0.6 V、2.0 V；后一根超电源，舍去。$\boxed{V_{OL}=0.6\;V}$，小于过驱动0.8 V，线性区成立。电流$(1.2-0.6)/10$kΩ$=60\;\mu A$；功耗$\boxed{72\;\mu W}$。**易错：** 解完二次方程必须核验物理根和工作区。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A4-01']" /> 已掌握 A4-01</label>

### A4-02

**A4-02 · CMOS 传输能力平衡**

$k'_n=300\,\mu A/V^2$，$k'_p=100\,\mu A/V^2$，两管L相等，$W_n=0.3\,\mu m$，要求 $\beta_n=\beta_p$，求 $W_p$。

::: details 展开A4-02详细解析

$k'_nW_n=k'_pW_p$，因此 $W_p=(300/100)\times0.3=\boxed{0.9\;\mu m}$，$W_p/W_n=3$。**易错：** PMOS导通弱时需要更宽的栅。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A4-02']" /> 已掌握 A4-02</label>

### A4-03

**A4-03 · 切换点和驱动比**

$V_{DD}=1.2$V、$V_{Tn}=0.35$V、$|V_{Tp}|=0.45$V、$\beta_n/\beta_p=4$。按双管饱和平方律求 $V_M$。

::: details 展开A4-03详细解析

取 $r=\sqrt{\beta_p/\beta_n}=0.5$。$$V_M=\frac{0.35+0.5(1.2-0.45)}{1.5}=\boxed{0.4833\;V}.$$ 低于半电源，说明强NMOS使切换点偏左。正过驱动且在切换点Vout=Vin，工作区假设成立。**易错：** 应使用驱动系数比的平方根。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A4-03']" /> 已掌握 A4-03</label>

### A4-04

**A4-04 · VTC 噪声裕量**

$V_{OH}=1.18$V、$V_{OL}=0.02$V、$V_{IL}=0.40$V、$V_{IH}=0.78$V。计算噪声裕量、短板；能否由这些参数唯一求 $V_M$？

::: details 展开A4-04详细解析

$NM_L=0.40-0.02=\boxed{0.38\;V}$，$NM_H=1.18-0.78=\boxed{0.40\;V}$，低电平裕量更小。仅这些参数不能唯一求得$V_M$，需VTC与$V_{out}=V_{in}$交点。**易错：** 均值$(V_{IL}+V_{IH})/2$不是$V_M$定义。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A4-04']" /> 已掌握 A4-04</label>

### A4-05

**A4-05 · 两级最优宽度**

前级输出电阻8 kΩ，固定负载9 fF；后级的宽度比例$s>0$，其输入电容为$3s$fF、输出电阻$10/s$ kΩ、外负载20 fF。估算总延迟$t(s)$，给出$s=1,2,3$与最佳$s$。

::: details 展开A4-05详细解析

前级$t_1=0.69(8)(9+3s)=49.68+16.56s$ ps；后级$t_2=0.69(10/s)(20)=138/s$ ps。故$$t(s)=49.68+16.56s+138/s.$$ $t(1)=204.24$ps；$t(2)=151.80$ps；$t(3)=145.36$ps。导数$16.56-138/s^2=0$给出$\boxed{s^*\approx2.887}$，最优延迟$\boxed{145.29\;ps}$。**易错：** 过度增宽后级会拖慢前级。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A4-05']" /> 已掌握 A4-05</label>

### A4-06

**A4-06 · 动态和静态功耗**

负载40 fF、供电1.2 V、频率500 MHz、每周期0→1平均次数$\alpha=0.2$，漏电3 μA。求动态功率、漏电功率、合计（忽略短路）。

::: details 展开A4-06详细解析

$P_{dyn}=0.2\times40\,fF\times1.2^2\times500\,MHz=\boxed{5.76\,\mu W}$；$P_{leak}=1.2\times3\,\mu A=\boxed{3.60\,\mu W}$；合计$\boxed{9.36\,\mu W}$。**易错：** 这里$\alpha$已定义为0→1次数/周期，勿再乘1/2。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A4-06']" /> 已掌握 A4-06</label>

### A4-07

**A4-07 · 伪NMOS静态功耗**

常开PMOS上拉等效电阻20 kΩ，供电1.2 V，低电平0.2 V。求低电平时电源电流和静态电源功耗；解释与互补CMOS区别。

::: details 展开A4-07详细解析

$I_{DD}=(1.2-0.2)/20\,k\Omega=\boxed{50\;\mu A}$，$P=V_{DD}I_{DD}=\boxed{60\;\mu W}$。伪NMOS低电平存在常开的直流通路，而理想互补CMOS不持续同时强导通。**易错：** 电源总功耗应乘全电源电压。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A4-07']" /> 已掌握 A4-07</label>

### A4-08

**A4-08 · 瞬态交点和 .MEASURE**

输入首次上升过0.6 V时刻0.50 ns，对应输出首次下降0.58 ns；输入首次下降1.50 ns，输出首次上升1.61 ns。求$t_{pHL}$、$t_{pLH}$、平均$t_p$并写出两条HSPICE测量指令。

[查看解析](/review-1to4/advanced-04-answers) · [进阶目录](/review-1to4/advanced)

::: details 展开A4-08详细解析

$t_{pHL}=(0.58-0.50)\,\mathrm{ns}=\boxed{80\;ps}$；$t_{pLH}=(1.61-1.50)\,\mathrm{ns}=\boxed{110\;ps}$；平均$\boxed{95\;ps}$。

~~~spice
.measure tran TPHL TRIG v(in) VAL=0.6 RISE=1
+ TARG v(out) VAL=0.6 FALL=1
.measure tran TPLH TRIG v(in) VAL=0.6 FALL=1
+ TARG v(out) VAL=0.6 RISE=1
~~~

**易错：** 输入上升对应输出下降。

[返回题目](/review-1to4/advanced-04-exercises) · [进阶目录](/review-1to4/advanced)

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A4-08']" /> 已掌握 A4-08</label>

---

[四章互动入口](/review-1to4/interactive) · [教材原例题索引](/review-1to4/textbook-examples) · [计算方法](/review-1to4/calculation-methods) · [HSPICE在线实验](/review-1to4/online-lab)
