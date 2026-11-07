// SOURCE PDF PAGE 197 / printed 178. Source transient result and start of 5.8.2.
#import "../figures/ch5-dff-power-native.typ": nor-hazard
#set document(title:"第5章 · NOR毛刺仿真及静态功耗引言 · 扫描197页")
#set text(lang:"zh")
= 第5章 · 印刷第178页

== 例5.7　NOR毛刺实验（续）

扫描原页含输入A、输入B和NOR输出的三幅瞬态波形，输出毛刺位于两输入翻转不同步的区段。

#nor-hazard()

#table(columns:(1fr,2.7fr),inset:3pt,table.header([源网表项],[扫描页参数]),[Va / Vb],[PULSE激励，相位和占空比不同],[.tran],[100 ps，终止9 ns],[.plot],[tran V(out)],[温度],[25 °C，见前页])

曲线基于教材的模型库和刺激条件；示意图只显示毛刺产生机理，不宣称重现三条真实仿真数据曲线。

== 5.8.2　静态（待机）功耗

教材在本页末引入泄漏与待机功耗讨论：即使没有逻辑翻转，亚阈值电流和源漏结反向泄漏仍可能形成电源电流；这与上一节的动态充放电损耗不同。

*严格核验：*原扫描的图线为三个坐标轴，不应以无数值依据的曲线替代；当前图为编辑概念图，图形整页验收未通过。
