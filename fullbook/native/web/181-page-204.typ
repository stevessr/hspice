// SOURCE PDF PAGE 204 / printed 185. Three exercise circuit diagrams.
#set document(title:"第5章 · P5.4—P5.6电路图题 · PDF204")
#set text(lang:"zh")
= 第5章 · 印刷第185页

== 图P5.4　专用静态CMOS电路

原页图P5.4由一个反相级和由A、B控制的组合MOS网络连接而成，输出节点为F。题目要求从晶体管导通关系恢复布尔逻辑，并估计最坏高低输出电平。

== 图P5.5　伪NMOS与伪PMOS门

(a) 伪NMOS：单个栅极接地的PMOS弱上拉器件（$W=2lambda$），由A、B、C控制的NMOS并联下拉。输出通过电容到地。

(b) 伪PMOS：上拉器件由A、B、C控制的PMOS并联组成，另有栅极接 $V_("DD")$ 的NMOS弱下拉（$W=2lambda$）。

#table(columns:(1.1fr,2.6fr),inset:4pt,table.header([电路],[源图可核验的网络]),[伪NMOS],[常开上拉PMOS + 三个并联NMOS],[伪PMOS],[三个并联PMOS + 常开下拉NMOS])

== P5.6　饱和增强型负载NMOS或非门

图P5.6使用二极管连接的NMOS作为上拉负载，两个输入A、B驱动并联下拉MOS。题目要求计算输出低/高电压、直流电流和功耗；所有晶体管为 $2lambda/2lambda$，采用0.13 μm工艺。

*严格差异项：*图P5.4、图P5.5和图P5.6在此是可编辑逻辑拓扑说明，未把原书的全部晶体管符号和连线重绘成严格同位置、同方向的矢量图。因此本页不能宣称1:1。
