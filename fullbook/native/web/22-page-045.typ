// SOURCE PDF PAGE 045 / printed page 26
// Scan-backed problem statements P1.7–P1.9, with source component values.
// Answers are intentionally absent: original textbook page contains questions only.
#import "../figures/chapter1-ending.typ": inverter-chain, rc-step, switch-capacitor
#set document(title: "第1章 · 原书习题P1.7–P1.9电路图与完整题设 · PDF045")
#set text(lang: "zh")

= 第1章 · 印刷第26页
== 1.9　习题（续）

#inverter-chain()

*图 P1.7*　（a）五级反相器串联；（b）把输出 $b$ 反馈至输入 $a$，形成奇数级反相器环。

*P1.7（b）*　如果将 $a$ 和 $b$ 连接起来，图 P1.7（b）所示，$a$ 点的电压将像时钟一样振荡。

（i）振荡周期是多少？

（ii）振荡频率是多少？

*P1.8*　一个从 0 V 到 1.2 V 的跳变施加在如图 P1.8 所示的 RC 电路上。计算电容器上的电压达到如下值所需要的时间：（a）达到 0.6 V；（b）达到 1.2 V；（c）从 1.2 V 的 10% 上升到 90%。

#rc-step()

*图 P1.8*　输入阶跃、$12.5 " k" Omega$ 电阻与 $100 " fF"$ 电容。

*P1.9*　一个开关用于控制一个电容器通过一个电阻器到 $V_("DD")$ 或者到 Gnd 的连接，如图 P1.9 所示。连接到 $V_("DD")$ 的电阻器的阻值是 30 kΩ，而连接到 Gnd 的电阻器的阻值是 12.5 kΩ。

（a）如果开关连接到 $R_2$ 的时间足够长，以至于电容器的电压是 0 V，然后开关在 $t=0$ 时转换到 $R_1$，计算电容器的电压达到 0.6 V（$V_("DD")/2$）时所需要的时间。

（b）如果开关连接到 $R_1$ 的时间足够长，以至于电容器的电压是 1.2 V，然后开关在 $t=0$ 时转换到 $R_2$，计算电容器的电压达到 0.6 V（$V_("DD")/2$）时所需要的时间。

（c）计算（a）和（b）延迟之间的比值。

#switch-capacitor()

*图 P1.9*　$V_("DD")=1.2 " V"$，$R_1=30 " k" Omega$，$R_2=12.5 " k" Omega$，$C_("load")=1 " μF"$ 的切换充放电电路，图元可分别编辑。

#text(size: 7pt, fill: gray)[本页保留原始题设和问题，删除了此前插入教材正文的 10 ns、50 MHz、RC 时间等参考答案；参考答案应单独位于习题解答材料。两幅电路为可编辑重绘，尚未通过原图逐线1:1验收。]
