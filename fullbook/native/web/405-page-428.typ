// SOURCE PDF PAGE 428 / printed page 409
// Scan-guided transmission-gate and analysis definitions.
#set document(title:"附录A 传输门网表与瞬态分析 · PDF428")
= 附录 A · 印刷第409页

*图 A.8*：一个互补 MOS 传输门，原书为简化图形未显示衬底端口。两个晶体管的扩散面积均为 $20 lambda^2$，长度 $2 lambda$、宽度 $4 lambda$。

#raw("Mp 3 0 2 1 PMOS\n+ L=2 W=4\n+ AS=20 PS=4\n+ AD=20 PD=4\nMn 2 1 3 0 NMOS\n+ L=2 W=4\n+ AS=20 PS=4\n+ AD=20 PD=4", block: true)

由端口顺序 `M d g s b model` 可知，PMOS 门控端为节点0，NMOS 门控端为节点1，两者在数据节点2与3之间并联导通。

== A.3.4　分析声明

原书重点介绍两种分析：*瞬态* 和 *直流*。一个网表可包含多个此类分析请求。

=== 瞬态

瞬态分析观察电压与电流随时间变化的响应；数值方法求解电路微分方程。*图 A.9* 使用 10 V 输入阶跃、1 kΩ 电阻和 1 μF 电容，展示电容节点电压从0 V逐渐接近10 V的过程。

#raw(".tran tstep tstop", block: true)

其中 `tstep` 是输出的时间步长，`tstop` 是仿真停止时间。下一扫描页给出对应的 1 ms / 10 ms 示例。
