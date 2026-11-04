// GENERATED FILE -- edit Markdown and run scripts/sync_typst.py
= 实践二：反相器、噪声容限与功耗
<实践二反相器噪声容限与功耗>
#strong[对应资料：];实验五（负载线、噪声）、实验六（CMOS 反相器 VTC 与功耗）。

== 题 1 · 电阻负载反相器（计算）
<题-1-电阻负载反相器计算>
一个电阻负载 NMOS 反相器采用 $V_(D D) = 1.2 thin upright(V)$、$R_L = 20 thin upright(k) Omega$。在某静态输入下测得 $V_(o u t) = 0.30 thin upright(V)$。

+ 计算电阻电流及电源提供的静态功率。
+ 写出负载线在 $(V_(D S) , I_D)$ 坐标中的表达式，说明其两端点。
+ 为什么负载线与 NMOS 输出特性曲线的交点是静态工作点？

== 题 2 · 噪声容限（计算）
<题-2-噪声容限计算>
已知某反相器 VTC 中 $V_(O H) = 1.18 thin upright(V)$、$V_(O L) = 0.05 thin upright(V)$、$V_(I L) = 0.46 thin upright(V)$、$V_(I H) = 0.80 thin upright(V)$。

+ 计算 $N M_L$ 和 $N M_H$。
+ 解释为什么 $V_(I L)$ 与 $V_(I H)$ 不能简单地取 $V_(D D) \/ 2$。

== 题 3 · CMOS 开关功耗（计算）
<题-3-cmos-开关功耗计算>
在忽略短路功耗与漏电功耗的近似下，某输出节点总电容为 $4 thin upright(f F)$，供电 $1.2 thin upright(V)$，时钟频率 $100 thin upright(M H z)$，每周期发生 $0 arrow.r 1$ 充电事件的平均次数为 $alpha = 0.25$。

+ 根据 $P_(d y n) = alpha C_L V_(D D)^2 f$ 求平均动态功耗。
+ 说明若频率加倍或供电降低，动态功耗如何变化。
+ 解释为什么实际 CMOS 反相器稳态功耗并不严格为零。

== 题 4 · 反相器尺寸配置（设计）
<题-4-反相器尺寸配置设计>
假设同一工艺中 $mu_n approx 2 mu_p$、NMOS 与 PMOS 的沟道长度相等，原 NMOS 宽度 $W_n = 0.20 thin mu upright(m)$。

+ 为使简单长沟道模型中的上拉、下拉驱动强度大致相等，估计 $W_p$。
+ 说明为什么这一比例仅用于初始设计，最终应结合 VTC、负载、延迟和实际模型调整。

#link("./answers/02-inverter.md")[查看实践二参考解答]
