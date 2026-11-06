// SOURCE PDF PAGE 115 / printed 96, temperature plots and voltage variation.
#import "../figures/bsim-effects-native.typ": temperature-current
#set document(title:"第3章 · SPICE温度扫描、图形和电源变化 · PDF115")
#set text(lang:"zh")
= 第3章 · 印刷第96页

== 例3.7　SPICE温度变化（续）

源书提供0.18 μm工艺的温度扫描SPICE输入，温度范围从 -40 °C 到100 °C。在电路中固定漏源偏压，同时在栅压为零和高于阈值的两种情况下采样漏电流。

温度扫描涉及的关键SPICE语句包括：

#raw(".temp -40 0 25 50 75 100\n* MOS model library and NMOS/PMOS instances\n* use .dc TEMP sweeps and current probes",block:true)

#temperature-current()

*温度影响的两种趋势示意。原图由两个独立I–温度曲线构成：亚阈值漏电随温度升高快速增长；高栅压导通电流可能随温度升高而下降。此图非原始实验数据逐点复刻。*

原书结论强调：驱动电流与泄漏电流的温度趋势相反，温度角应作为与工艺角相互独立的仿真维度。

== 3.7.3　电源变化

除了器件参数和温度，电源电压变化也会改变逻辑门的工作速度与电流。实际供电网络存在电源电阻、动态电流以及电源电压下降（IR drop），使不同芯片区域得到的实际供电电压有所差异。

低供电电压通常降低动态功耗，但可能减小器件过驱动，增大延迟，并使电路对阈值和噪声更加敏感。

_本页两种温度曲线只保留趋势，完整原图数值表及全部测量点尚未精校。_
