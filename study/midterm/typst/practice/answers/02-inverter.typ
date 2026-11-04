// GENERATED FILE -- edit Markdown and run scripts/sync_typst.py
= 实践二参考解答：反相器
<实践二参考解答反相器>
== 题 1 · 电阻负载反相器
<题-1-电阻负载反相器>
$ I_R = frac(V_(D D) - V_(o u t), R_L) = frac(1.2 - 0.3, 20 times 10^3) = 45 thin mu upright(A) . $

电源输出静态功率 $P_(D D) = V_(D D) I_R = 1.2 times 45 thin mu upright(A) = 54 thin mu upright(W)$。

负载线为 $I_D = (1.2 - V_(D S)) \/ 20 thin upright(k) Omega$，两端点分别为 $(0 , 60 thin mu upright(A))$ 与 $(1.2 thin upright(V) , 0)$。交点同时满足 NMOS 的器件电流关系与电阻的欧姆定律，符合静态节点电流守恒。

== 题 2 · 噪声容限
<题-2-噪声容限>
$ N M_L = V_(I L) - V_(O L) = 0.46 - 0.05 = 0.41 thin upright(V) , $

$ N M_H = V_(O H) - V_(I H) = 1.18 - 0.80 = 0.38 thin upright(V) . $

一般按 VTC 的规定定义（常用切线斜率为 $- 1$ 的交点）提取 $V_(I L)$ 与 $V_(I H)$；不能直接将其均当作电源的一半。

== 题 3 · 动态功耗
<题-3-动态功耗>
$ P_(d y n) = 0.25 times 4 times 10^(- 15) times 1.2^2 times 10^8 = 1.44 times 10^(- 7) thin upright(W) = 0.144 thin mu upright(W) . $

其他参数不变时，频率加倍使近似动态功耗加倍；供电从 $V$ 降至 $k V$ 时，电容充放电功耗变为原来的 $k^2$（忽略频率和活动率的耦合变化）。实际 CMOS 因亚阈值泄漏、结泄漏等仍存在静态功耗，开关转换时还可能产生短路电流。

== 题 4 · 尺寸设计
<题-4-尺寸设计>
以 $beta prop mu W \/ L$ 为依据，若 $L_n = L_p$ 且 $mu_n approx 2 mu_p$，则 $W_p approx 2 W_n = 0.40 thin mu upright(m)$。深亚微米模型中上拉、下拉电流受阈值差、速度饱和和寄生参数影响，设计应通过 VTC 转换点和瞬态上升/下降时间校验，不宜将这一比例视作固定工艺规则。

#link("../02-inverter.md")[返回实践二题目]
