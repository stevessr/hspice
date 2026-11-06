// Source PDF page 046 / printed page 27. Data checked against the source image.
#import "../figures/chapter1-ending.typ": current-charge
#set document(title: "原书第46页 · 第1章习题P1.10—P1.12")
#set text(lang: "zh")

= 第1章 · 第27页

== P1.10　工艺缩小与晶体管数量

原题设一块面积为1 cm × 1 cm的芯片，在0.18 μm工艺下容纳约5000万晶体管，并讨论在0.13 μm工艺下的估算容量。按相同芯片面积、器件平均占地面积随线性尺寸平方变化这一理想假设：

$ N_2 approx N_1 (L_1/L_2)^2 $

代入可得到 $N_2 approx 5 times 10^7 times (0.18/0.13)^2 approx 9.59 times 10^7$。

== P1.11　频率倍增与工艺代际

原题从2 GHz处理器开始，假定每个工艺节点的速度可翻倍，求到达至少30 GHz需要几次更新：

$ 2 dot 2^n >= 30 $

最小整数为 $n=4$，达到32 GHz。如果代际间隔均为3年，对应时间为12年。这里的倍增假设来自题设，不是现代处理器的实际频率发展规律。

== P1.12　电流源向电容充电

#current-charge()

原题的初始电压为0 V，$C=25 " fF"$，要求30 ps时达到0.6 V。利用 $I=C Delta V / Delta t$ 得：

$ I = (25 times 10^(-15) times 0.6)/(30 times 10^(-12)) " A" = 0.5 " mA" $

*图P1.12　电流源和电容的原生结构示意。*

_本页数值与题意已对照原扫描；公式是配套教学解答，原书只给题目。页面版式、图片几何和原文行距尚未最终验收。_
