# 第3章交互训练 · 制造、版图和模拟

本章有 **12道基础题 + 8道进阶题**，答案折叠显示。勾选“已掌握”后，当前浏览器会保存进度；各章共享存储，互不清除。

<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue'
const done = ref<Record<string, boolean>>({})
const storageKey = 'hspice-ch1to4-progress-v1'
const count = computed(() => Object.entries(done.value).filter(([id, value]) => value && (id.startsWith('S3-') || id.startsWith('A3-'))).length)
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
  done.value = Object.fromEntries(Object.entries(done.value).filter(([id]) => !(id.startsWith('S3-') || id.startsWith('A3-'))))
}
</script>

<div class="review-quiz-progress" role="status">本章已掌握 {{ count }} / 20 题 <button type="button" @click="resetChapter">仅重置本章</button></div>

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

## 本章进阶综合题（A3-01～A3-08）

### A3-01

**A3-01 · 比例版图尺寸**

某教学工艺取 $\lambda=0.06\,\mu m$，线宽下限 $3\lambda$、间距下限 $2\lambda$、绘制栅长 $2\lambda$。求三个尺寸，并说明绘制栅长为何不一定等于有效沟道长度。

::: details 展开A3-01详细解析

三个尺寸依次为 $\boxed{0.18\;\mu m}$、$\boxed{0.12\;\mu m}$、$\boxed{0.12\;\mu m}$。刻蚀偏差与源漏横向扩散影响 $L_\mathrm{eff}$。**易错：** 版图 $\lambda$ 不是沟道长度调制系数。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A3-01']" /> 已掌握 A3-01</label>

### A3-02

**A3-02 · 方块电阻与接触**

金属线方块电阻 $0.08\,\Omega/\square$，长 120 μm、宽 0.60 μm，两端接触各 3 Ω。求走线本体与端到端电阻。

::: details 展开A3-02详细解析

方块数 $N=120/0.6=200$；走线 $R=0.08\times200=\boxed{16\;\Omega}$，总电阻 $R_t=16+3+3=\boxed{22\;\Omega}$。**易错：** 接触电阻要单独串联。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A3-02']" /> 已掌握 A3-02</label>

### A3-03

**A3-03 · 两级分布 RC**

两段串联电阻均为 5 kΩ，第一段末端对地电容 20 fF，第二段末端 40 fF。求远端 Elmore 时间常数；与总 R=10 kΩ、总 C=60 fF 全部集中的 RC 结果比较。

::: details 展开A3-03详细解析

$$\tau_E=R_1(C_1+C_2)+R_2C_2=5(60)+5(40)=\boxed{500\;ps}.$$ 集中模型 $10(60)=\boxed{600\;ps}$，其中 kΩ·fF=ps。**易错：** Elmore 一阶矩不是一般多极网络精确的 50% 延迟。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A3-03']" /> 已掌握 A3-03</label>

### A3-04

**A3-04 · SPICE 子电路识别**

库中定义了如下 NMOS 接口，学生却使用 M1 d g s b N18 W=1u L=0.2u。指出问题，给出可能正确的实例形式及必须核对的其他因素。

~~~spice
.SUBCKT N18 D G S B
* implementation omitted
.ENDS N18
~~~

::: details 展开A3-04详细解析

N18 是 .SUBCKT 而非 .MODEL，必须采用 X 前缀，例如：

~~~spice
X1 d g s b N18 W=1u L=0.2u
~~~

还需核实 W/L 参数是否由子电路接受、真实端口顺序、工艺库引入语句。**易错：** 不能只换 M/X 前缀而不检查子电路接口。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A3-04']" /> 已掌握 A3-04</label>

### A3-05

**A3-05 · 双重 DC 扫描**

分析 HSPICE 语句的内外层点数、总偏置点数及以 VG 为横轴时的曲线条数：

~~~spice
.dc VG 0 1.2 0.02 VD 0.2 0.8 0.2
~~~

::: details 展开A3-05详细解析

VG 为内层，从0到1.2，每步0.02，$\boxed{61}$点；VD为外层取0.2、0.4、0.6、0.8，共$\boxed{4}$点。总组合$\boxed{244}$，可绘制4条不同VD的曲线。**易错：** 数据点数和曲线条数不同。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A3-05']" /> 已掌握 A3-05</label>

### A3-06

**A3-06 · 传播延迟测量语句**

供电1.2 V的反相器，写出测量输入第一次上升过0.6 V与输出第一次下降过0.6 V之间的延迟的 HSPICE 指令。

::: details 展开A3-06详细解析

~~~spice
.measure tran TPHL TRIG v(in) VAL=0.6 RISE=1
+ TARG v(out) VAL=0.6 FALL=1
~~~

TRIG定位输入触发点、TARG定位输出目标点。**易错：** 反相器输入上升对应输出下降。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A3-06']" /> 已掌握 A3-06</label>

### A3-07

**A3-07 · PVT 覆盖矩阵**

若有TT/FF/SS三工艺角、1.0/1.2 V两种供电、−20/25/85°C三个温度，共需多少组 PVT？为什么单独测试SS低压高温不能保证所有指标最差？

::: details 展开A3-07详细解析

$3\times2\times3=\boxed{18}$组。延迟、漏电、噪声容限对工艺角、供电、温度的敏感性不同；最差条件通常需按指标分别检查。**易错：** 角名不等于所有指标的最坏情况证明。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A3-07']" /> 已掌握 A3-07</label>

### A3-08

**A3-08 · PEX 延迟影响**

输出等效电阻8 kΩ，提取寄生前负载15 fF，版图后附加25 fF。估计前后 $0.69RC$ 延迟、增量与倍率。

[查看解析](/review-1to4/advanced-03-answers) · [进阶目录](/review-1to4/advanced)

::: details 展开A3-08详细解析

前：$0.69(8)(15)=\boxed{82.8\;ps}$；后：$0.69(8)(40)=\boxed{220.8\;ps}$。增量$\boxed{138\;ps}$，倍率$\boxed{2.667}$。**易错：** 实际PEX常有分布电阻，固定R是题设近似。

[返回题目](/review-1to4/advanced-03-exercises) · [进阶目录](/review-1to4/advanced)

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A3-08']" /> 已掌握 A3-08</label>

---

[四章互动入口](/review-1to4/interactive) · [教材原例题索引](/review-1to4/textbook-examples) · [计算方法](/review-1to4/calculation-methods) · [HSPICE在线实验](/review-1to4/online-lab)
