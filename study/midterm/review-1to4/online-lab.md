# 在线电路实验：RC、MOS 与 CMOS

本页可在浏览器内直接拖动参数、实时观察波形和计算结果，并导出当前参数对应的 HSPICE 网表。**浏览器使用教学方程求解**，无须安装 HSPICE；下载的 `.sp` 文件可在实际 HSPICE/AvanWaves 中运行，进一步与 BSIM3 或课程PDK对照。

<script setup lang="ts">
import ReviewLab from './ReviewLab.vue'
</script>

<ReviewLab />

## 实验与教材位置对应

| 实验 | 原书关联知识 | 必做变化及预期 |
|---|---|---|
| RC 阶跃充电 | 第1章延迟；S1-08/S1-11 | 电阻或电容增大→时间常数与50%延迟增大 |
| NMOS $I_D$–$V_{DS}$ | 第2章MOS工作区；例2.6—2.8 | 提高VGS→电流增加；提高VSB→阈值增加，漏电流减小 |
| CMOS VTC | 第4章CMOS反相器；例4.6—4.7 | 提高Wp/Wn→PMOS相对变强，切换点右移 |

## HSPICE 对照流程

1. 在图中设置参数，记录**理论值**和图形趋势。
2. 点击“下载当前参数 .sp 网表”，在 HSPUI 或命令行中执行仿真。
3. 在 AvanWaves 中选择对应 DC 波形（通常是 `.sw0`）或瞬态波形（`.tr0`）；对于电压源漏电流，常按 `-I(VDS)` 显示正向NMOS漏电流。
4. 对比差异：浏览器是长沟道/一阶参数模型，SPICE数值结果受器件方程、有限输入斜率、输出电阻和模型设置影响。
5. 如果要使用 `c18vmos001.lib`，请核对 `.MODEL` 或 `.SUBCKT` 的语法及端口顺序，再替换教学模型；**不得直接把本页曲线称为真实0.18μm工艺结果**。

[六份固定教学网表](/review-1to4/simulations) · [教材原例题导航](/review-1to4/textbook-examples) · [计算方法专项](/review-1to4/calculation-methods)
