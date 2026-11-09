# 第1章答案

## S1-01 德摩根律

$$F=\overline{AB+C}=\overline{AB}\cdot\overline C=(\overline A+\overline B)\overline C.$$

第一步对整个或项取反，第二步对乘积 $AB$ 取反。**易错：** $\overline{AB}$ 不是 $\overline A\,\overline B$，而是 $\overline A+\overline B$。

## S1-02 NAND实现

令 $X=\overline{AB}=\operatorname{NAND}(A,B)$，$Y=\overline{CD}=\operatorname{NAND}(C,D)$，则

$$F=\overline{XY}=\operatorname{NAND}(X,Y)=AB+CD.$$

因此共用3个2输入NAND门。以德摩根律检验最后一步可知输出确实为两个积项的或。

## S1-03 真值判断

$A\oplus B=1$；$\overline{A+B}=\overline1=0$；$\overline{AB}=\overline0=1$。依次为 **1、0、1**。

## S1-04 三输入逻辑真值表

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

## S1-05 噪声容限

$$NM_L=V_{IL}-V_{OL}=0.38-0.06=\boxed{0.32\,V}.$$

$$NM_H=V_{OH}-V_{IH}=1.20-0.79=\boxed{0.41\,V}.$$

低电平噪声容限更小，低电平侧更敏感。

## S1-06 三个VTC特殊点

$V_{out}=V_{in}$ 的点定义为 **开关电压 $V_M$**。左侧和右侧斜率为$-1$的点分别给出 **$V_{IL}$** 与 **$V_{IH}$**。三者的定义条件不同。前者反映输入/输出的交点；后两者定义保证逻辑电平、计算静态噪声容限时使用的输入区间边界。

## S1-07 四级延迟

输入上升→第1级下降（40ps）→第2级上升（60ps）→第3级下降（40ps）→第4级上升（60ps）：

$$t_{path}=40+60+40+60=\boxed{200\,ps}.$$

最终输出为**上升沿**，因为4次逻辑反相恢复原信号极性。

## S1-08 一阶RC

$$\tau=RC=(12.5\times10^3)(100\times10^{-15})=1.25\times10^{-9}\,s=\boxed{1.25\,ns}.$$

$$t_{50\%}\approx0.69RC=0.69\times1.25=\boxed{0.8625\,ns}.$$

不要把时间常数与50%响应时间等同；$0.69$来自 $-\ln(0.5)=\ln2$。

## S1-09 动态功率

$$P=\alpha C_LV_{DD}^2f=0.18\times30\times10^{-15}\times(1.0)^2\times400\times10^6,$$

$$\boxed{P=2.16\times10^{-6}\,W=2.16\,\mu W}.$$

其中 $\alpha$ 按题目明确定义为每个周期0→1充电次数的平均值。

## S1-10 静态功率

$$P_{leak}=V_{DD}I_{leak}=1.2\times10\times10^{-6}=\boxed{12\,\mu W}.$$

## S1-11 扇出与延迟

$$C_L=3\times2\,fF+4\,fF=\boxed{10\,fF}.$$

$$t_p\approx0.69R_{eq}C_L=0.69\times8\times10^3\times10\times10^{-15}=\boxed{55.2\,ps}.$$

## S1-12 供电翻倍

在 $\alpha,C,f$ 不变时

$$\frac{P_{dyn,new}}{P_{dyn,old}}=\left(\frac{1.6}{0.8}\right)^2=\boxed{4}.$$

现实中改变电源电压还可能影响延迟、短路电流、漏电以及能否处于器件额定工作范围。故公式结论对应**指定量不变**的理想化比较。

---

[返回题目](/review-1to4/01-exercises) · [公式速查](/review-1to4/reference)
