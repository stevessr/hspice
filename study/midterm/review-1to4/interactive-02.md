# 第2章交互训练 · MOS晶体管

本章有 **12道基础题 + 8道进阶题**，答案折叠显示。勾选“已掌握”后，当前浏览器会保存进度；各章共享存储，互不清除。

<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue'
const done = ref<Record<string, boolean>>({})
const storageKey = 'hspice-ch1to4-progress-v1'
const count = computed(() => Object.entries(done.value).filter(([id, value]) => value && (id.startsWith('S2-') || id.startsWith('A2-'))).length)
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
  done.value = Object.fromEntries(Object.entries(done.value).filter(([id]) => !(id.startsWith('S2-') || id.startsWith('A2-'))))
}
</script>

<div class="review-quiz-progress" role="status">本章已掌握 {{ count }} / 20 题 <button type="button" @click="resetChapter">仅重置本章</button></div>

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

## 本章进阶综合题（A2-01～A2-08）

### A2-01

**A2-01 · 体效应阈值的直接求解**

增强型 NMOS：$V_{T0}=0.40$ V、$\gamma=0.40\,\mathrm{V}^{1/2}$、$2\phi_F=0.70$ V、$V_{SB}=0.50$ V。按常用体效应公式求 $V_T$ 并判断与 $V_{T0}$ 相比是增大还是减小。

::: details 展开A2-01详细解析

对源—体结反向偏置的 NMOS：

$$V_T=V_{T0}+\gamma\big(\sqrt{2\phi_F+V_{SB}}-\sqrt{2\phi_F}\big).$$

代入数值：

$$V_T=0.4+0.4(\sqrt{1.2}-\sqrt{0.7})
=0.4+0.4(1.09545-0.83666)
=\boxed{0.5035\;\mathrm V}.$$

阈值增大约 $0.1035$ V。

**易错点：** 体效应使用 $V_{SB}=V_S-V_B$，而不是 $V_B-V_S$。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A2-01']" /> 已掌握 A2-01</label>

### A2-02

**A2-02 · 工作区判断与线性区电流**

理想长沟道 NMOS：$k'_n=150\;\mu\mathrm{A/V^2}$、$W/L=6$、$V_{GS}=1.10$ V、$V_T=0.40$ V、$V_{DS}=0.25$ V。判断工作区，计算 $I_D$，忽略沟道长度调制。

::: details 展开A2-02详细解析

先算过驱动和驱动系数：

$$V_{OV}=V_{GS}-V_T=0.70\;\mathrm V,\qquad\beta=k'_nW/L=900\;\mu\mathrm{A/V^2}.$$

$0<V_{DS}=0.25<V_{OV}=0.70$，所以在线性区。

$$I_D=\beta(V_{OV}V_{DS}-V_{DS}^2/2)
=900(0.70\times0.25-0.25^2/2)
=\boxed{129.375\;\mu\mathrm A}.$$

**易错点：** 此时不能使用饱和平方律；线性区方程前面没有额外的 $1/2$ 系数。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A2-02']" /> 已掌握 A2-02</label>

### A2-03

**A2-03 · PMOS 以正向电压变量求电流**

PMOS 的 $k'_p=80\;\mu\mathrm{A/V^2}$、$W/L=5$、$V_{SG}=1.20$ V、$|V_{Tp}|=0.45$ V、$V_{SD}=0.30$ V。判断工作区，求从源流向漏的电流**大小**。

::: details 展开A2-03详细解析

PMOS 使用正向量 $V_{SG}$、$V_{SD}$：

$$V_{OV,p}=1.20-0.45=0.75\;\mathrm V,\qquad\beta_p=80\times5=400\;\mu\mathrm{A/V^2}.$$

由于 $0.30<0.75$，处于线性区。

$$|I_D|=400\left(0.75(0.30)-\frac{0.30^2}{2}\right)
=\boxed{72\;\mu\mathrm A}.$$

**易错点：** 已使用 $V_{SG}$ 和 $V_{SD}$ 的正值时，不要再次因 PMOS 反号而把电流大小计算成负数。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A2-03']" /> 已掌握 A2-03</label>

### A2-04

**A2-04 · 沟道长度调制对饱和电流的影响**

某理想长沟道 NMOS 的 $\beta=1000\,\mu\mathrm{A/V^2}$、$V_{OV}=0.60$ V、$\lambda=0.10\;\mathrm{V^{-1}}$。在模型 $I_D=\frac{\beta}2V_{OV}^2(1+\lambda V_{DS})$ 下，分别求 $V_{DS}=0.60$ V 和 $1.20$ V 的饱和电流，并计算后者/前者的比值。

::: details 展开A2-04详细解析

忽略调制时的基准电流为

$$I_{D0}=\frac{1000}{2}(0.60)^2=180\;\mu\mathrm A.$$

加入沟道长度调制：

$$I_D(0.60)=180(1+0.10\times0.60)=\boxed{190.8\;\mu\mathrm A},$$
$$I_D(1.20)=180(1+0.10\times1.20)=\boxed{201.6\;\mu\mathrm A}.$$

比值 $201.6/190.8=\boxed{1.0566}$，即后者约高 $5.66\%$。

**易错点：** 两个偏置都满足饱和边界 $V_{DS}\ge V_{OV}$；不可将这部分增量错误当成线性区电流。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A2-04']" /> 已掌握 A2-04</label>

### A2-05

**A2-05 · 传输 NMOS 的体效应极限（数值根）**

NMOS 传输高电平：栅压 $V_G=1.20$ V，体端固定 0 V，输出节点作为升高的源极。设 $V_{T0}=0.40$ V、$\gamma=0.40\;\mathrm{V^{1/2}}$、$2\phi_F=0.70$ V。根据 $V_{out}=V_G-V_T(V_{SB})$，求输出最终接近的高电平上限（保留三位小数）。与忽略体效应的估计比较。

::: details 展开A2-05详细解析

在输出逐渐升高时 $V_{SB}=V_{out}$，所以必须**自洽求根**：

$$V_{out}+0.40+0.40\left(\sqrt{0.70+V_{out}}-\sqrt{0.70}\right)=1.20.$$

试算 $V_{out}=0.667$ V：

$$V_T\approx0.40+0.40(\sqrt{1.367}-\sqrt{0.70})\approx0.533\;\mathrm V.$$

于是 $V_G-V_T\approx0.667$ V，与假设一致，故

$$\boxed{V_{out,\max}\approx0.667\;\mathrm V}.$$

忽略体效应的估计是 $1.20-0.40=0.800$ V；考虑体效应后减少约 $0.133$ V。

**易错点：** 不要直接把体端接地理解成 $V_{SB}=0$；传输器件的源极随着输出提高，体偏置也同时改变。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A2-05']" /> 已掌握 A2-05</label>

### A2-06

**A2-06 · 栅电容与重叠电容**

饱和区 NMOS：$C_{ox}=6\;\mathrm{fF/\mu m^2}$、$W=1\,\mu\mathrm m$、$L=0.20\,\mu\mathrm m$，单位宽度的源、漏栅重叠电容均为 $0.15\;\mathrm{fF/\mu m}$。采用长沟道估计 $C_{gs,int}\approx\frac23 C_{ox}WL$、$C_{gd,int}\approx0$，求总 $C_{gs}$ 和 $C_{gd}$。

::: details 展开A2-06详细解析

栅氧化层面积尺度是

$$C_{ox}WL=6(1)(0.20)=1.20\;\mathrm{fF}.$$

本征栅源电容：

$$C_{gs,int}\approx\frac23(1.20)=0.80\;\mathrm{fF}.$$

栅与源、漏重叠的电容各为 $C_{ov}=0.15(1)=0.15$ fF，所以

$$\boxed{C_{gs}\approx0.80+0.15=0.95\;\mathrm{fF}},\qquad
\boxed{C_{gd}\approx0+0.15=0.15\;\mathrm{fF}}.$$

**易错点：** “饱和区 $C_{gd,int}\approx0$”不等于总栅漏电容为 0；还要算重叠与边缘电容。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A2-06']" /> 已掌握 A2-06</label>

### A2-07

**A2-07 · 亚阈值摆幅与漏电流倍率**

某 NMOS 在局部亚阈值区域的摆幅 $S=90\;\mathrm{mV/dec}$。保持 $V_{DS}$ 和温度不变，将 $V_{GS}$ 提高 270 mV，按指数近似计算漏电流变化倍率。若反向降低 270 mV 又怎样？

::: details 展开A2-07详细解析

摆幅定义：

$$S=\frac{\Delta V_{GS}}{\Delta\log_{10}I_D},\qquad
\Delta\log_{10}I_D=\frac{270}{90}=3.$$

所以

$$\boxed{\frac{I_\mathrm{new}}{I_\mathrm{old}}\approx10^3=1000}.$$

若栅压反向降低 270 mV，则约为原来的 $10^{-3}$（千分之一）。

**易错点：** 单位是 **mV/dec**，每增加一个 $S$ 对应电流约十倍，而不是自然指数的 $e$ 倍。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A2-07']" /> 已掌握 A2-07</label>

### A2-08

**A2-08 · 速度饱和近似与长沟道边界**

采用教材相关的短沟道近似 $V_{Dsat}\approx V_{OV}E_cL/(V_{OV}+E_cL)$。若 $V_{OV}=0.80$ V 且 $E_cL=0.20$ V，求 $V_{Dsat}$，与长沟道模型饱和边界比较。这个近似能否直接给出完整的 BSIM3 漏电流？

::: details 展开A2-08详细解析

代入：

$$V_{Dsat}\approx\frac{0.80\times0.20}{0.80+0.20}
=\boxed{0.16\;\mathrm V}.$$

长沟道分界是 $V_{DS}=V_{OV}=0.80$ V，本近似预测更低的漏源电压就可发生速度饱和相关效应。

**易错点：** $V_{Dsat}$ 是速度饱和边界的近似，不是完整的 BSIM3 $I_D$ 公式；不能仅凭 $V_{Dsat}$ 代回原始平方律而视作真实工艺结果。

:::

<label class="review-practice-check"><input type="checkbox" v-model="done['A2-08']" /> 已掌握 A2-08</label>

---

[四章互动入口](/review-1to4/interactive) · [教材原例题索引](/review-1to4/textbook-examples) · [计算方法](/review-1to4/calculation-methods) · [HSPICE在线实验](/review-1to4/online-lab)
