// GENERATED FILE -- edit Markdown and run scripts/sync_typst.py
= 实践一：MOS 晶体管工作区域与器件参数
<实践一mos-晶体管工作区域与器件参数>
#strong[对应资料：];实验一（NMOS I–V）、实验二（PMOS 与电容充电）、实验三（尺寸影响）、实验四（参数提取）。

== 题 1 · 电压定义和工作区域（基础）
<题-1-电压定义和工作区域基础>
给定 NMOS：$V_G = 1.20 thin upright(V)$、$V_D = 1.05 thin upright(V)$、$V_S = 0.25 thin upright(V)$、$V_B = 0$。在#strong[暂不计体效应];的理想模型中，$V_(T H) = 0.42 thin upright(V)$。

+ 求 $V_(G S)$、$V_(D S)$、$V_(S B)$ 和过驱动电压 $V_(O V)$。
+ 判断截止、线性或饱和区域，写出依据。
+ 若考虑体效应且阈值随 $V_(S B)$ 增大而升高，工作区域判断可能如何变化？说明为何没有给出体效应系数时不能计算唯一新阈值。

== 题 2 · 长沟道电流计算（计算）
<题-2-长沟道电流计算计算>
假设 $mu_n C_(o x) = 180 thin mu upright(A) \/ upright(V)^2$、$W \/ L = 4$、$V_(G S) = 1.10 thin upright(V)$、$V_(T H) = 0.40 thin upright(V)$，忽略沟道长度调制。

+ 在 $V_(D S) = 0.20 thin upright(V)$ 时求 $I_D$。
+ 在 $V_(D S) = 1.00 thin upright(V)$ 时求 $I_D$。
+ 如果保持 $L$ 不变而令 $W$ 加倍，在理想模型下两组电流如何变化？为什么不能据此断言实际 HSPICE 结果精确加倍？

== 题 3 · 沟道长度调制参数（计算）
<题-3-沟道长度调制参数计算>
实验四给出的两组饱和区近似数据为：$V_(D S , 1) = 1.0 thin upright(V)$ 时 $I_(D 1) = 76 thin mu upright(A)$；$V_(D S , 2) = 1.2 thin upright(V)$ 时 $I_(D 2) = 82 thin mu upright(A)$。设同一 $V_(G S)$ 下采用 $I_D = I_(D 0) (1 + lambda V_(D S))$。

+ 推导 $lambda$ 的表达式，并求其数值与单位。
+ 说明为什么计算出的 $lambda$ 是该偏置区间的有效拟合参数，而非所有工作条件下保持不变的精确常量。

== 题 4 · NMOS 传输高电平（解释）
<题-4-nmos-传输高电平解释>
假设 NMOS 的栅极固定为 $1.2 thin upright(V)$，漏端有足够高的电位为负载电容充电，衬底接地，电容初始电压为零。

+ 写出源极（电容上端）电压 $V_X$ 上升时 $V_(G S)$、$V_(S B)$ 的变化。
+ 在#strong[固定] $V_(T H) = 0.4 thin upright(V)$ 的简单近似下，写出可能的充电上限。
+ 说明考虑体效应后，为什么不能再直接使用这一固定阈值近似。

#link("./answers/01-mos.md")[查看实践一参考解答]
