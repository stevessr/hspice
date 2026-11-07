// SOURCE PDF PAGE 196 / printed 177
#set document(title:"第5章 · 毛刺功耗与例5.7 NOR SPICE · PDF196")
= 第5章 · 印刷第177页
== 毛刺脉冲波形干扰（glitch）
输出毛刺通常来自一个逻辑函数不同输入支路的传播延迟差异。多个输入从某状态变化到另一状态时，如果各个分支没有同时到达逻辑门，输出可能短暂进入错误的逻辑电平，又恢复到正确状态。
即使最终输出逻辑值没有变化，中间毛刺也会造成电容充放电，使动态功耗增加。一个毛刺还可能被后级放大并进一步传播。
本书说明，可以通过适当平衡逻辑路径延迟、控制输入到达时间以及减少不必要的门级翻转来降低毛刺功耗，但延迟优化也可能使某些局部电容增加，必须总体比较功耗。
== 例5.7　利用或非门的短脉冲波形干扰
*问题：* 对0.18 μm工艺的两输入NOR门使用SPICE，故意在不同输入传播时间上制造一段短脉冲。说明何时会出现毛刺，以及如何降低或消除。
源书的测试开始于：
#raw("* NOR Gate Glitching Example\n.param Supply=1.8\n.temp 25\n.lib 'bsim3v3.cmosp18.lib' TT\n.opt scale=0.1u\n.global Vdd Gnd\nVdd Vdd Gnd 'Supply'\nmpa out ina x Vdd PMOS1 l=2 w=16\nmpb x inb Vdd Vdd PMOS1 l=2 w=16\n* NMOS parallel pull-down devices follow\n* stimulus and .tran analysis continue on next page",block:true)
测试逻辑的两个输入分别由脉冲源驱动，使一个输入由低到高、另一输入由高到低。若它们在转换时间窗口内短暂同时为低，则NOR输出会产生一个不希望出现的高电平毛刺。
本页仅包含SPICE网表的开头，剩余实例内容、仿真结果与波形位于下一页，未在此处编造完整输出数据。
