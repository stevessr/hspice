// GENERATED FILE -- edit Markdown and run scripts/sync_typst.py
= 实践一参考解答：MOS 晶体管
<实践一参考解答mos-晶体管>
== 题 1 · 工作区域
<题-1-工作区域>
$V_(G S) = 1.20 - 0.25 = 0.95 thin upright(V)$，$V_(D S) = 1.05 - 0.25 = 0.80 thin upright(V)$，$V_(S B) = 0.25 - 0 = 0.25 thin upright(V)$。

$V_(O V) = 0.95 - 0.42 = 0.53 thin upright(V)$。因为 $V_(G S) > V_(T H)$ 且 $V_(D S) gt.eq V_(O V)$，#strong[不计体效应时处于饱和区];。计入体效应通常使阈值升高、过驱动电压减小；器件可能维持饱和，也可能在阈值升至栅源电压附近时趋向截止。是否截止取决于有效 $V_(T H)$，题目缺少足够参数，不能计算唯一新值。

== 题 2 · 漏电流
<题-2-漏电流>
设 $K = mu_n C_(o x) (W \/ L) = 720 thin mu upright(A) \/ upright(V)^2$，$V_(O V) = 0.70 thin upright(V)$。

当 $V_(D S) = 0.20 < 0.70 thin upright(V)$ 时处于线性区：

$ I_D = K (V_(O V) V_(D S) - V_(D S)^2 / 2) = 720 (0.70 times 0.20 - 0.20^2 \/ 2) = 86.4 thin mu upright(A) . $

当 $V_(D S) = 1.00 gt.eq 0.70 thin upright(V)$ 时处于饱和区：

$ I_D = K / 2 V_(O V)^2 = 360 times 0.70^2 = 176.4 thin mu upright(A) . $

若其他参数不变、$W$ 加倍，则理想公式中的 $K$ 加倍，两组电流分别成为 $172.8 thin mu upright(A)$ 与 $352.8 thin mu upright(A)$。实际器件还涉及寄生电阻、迁移率退化、短沟道效应等，不能保证精确比例。

== 题 3 · 沟道长度调制
<题-3-沟道长度调制>
同一 $V_(G S)$ 的比值关系为

$ 82 / 76 = frac(1 + 1.2 lambda, 1 + 1.0 lambda) . $

因此 $82 (1 + lambda) = 76 (1 + 1.2 lambda)$，整理得 $6 = 9.2 lambda$，于是

$ #box(stroke: black, inset: 3pt, [$ lambda approx 0.652 thin upright(V)^(- 1) $]) . $

该结论基于两点数据和一阶线性近似，只能反映指定偏置区间的有效斜率；不同 $V_(G S)$、器件尺寸或更精细模型可能给出不同有效值。

== 题 4 · 传输高电平
<题-4-传输高电平>
随着 $V_X$ 上升，$V_(G S) = 1.2 - V_X$ 逐渐减小，同时 $V_(S B) = V_X - 0$ 逐渐增大。固定 $V_(T H) = 0.4 thin upright(V)$ 时，理想导通趋近停止的条件为 $1.2 - V_X approx 0.4$，得到 #strong[$V_X approx 0.8 thin upright(V)$];。考虑体效应后，阈值 $V_(T H) (V_X)$ 随源体偏置变化，需要解 $1.2 - V_X = V_(T H) (V_X)$ 才可估算终值。不能把 $0.8 thin upright(V)$ 当作所有工艺模型的精确输出。

#link("../01-mos.md")[返回实践一题目]
