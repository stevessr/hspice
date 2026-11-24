// SOURCE PDF PAGE 419 / printed page 400
// Scan-guided editable editorial reconstruction: figures and line breaks still require full-page QA.
#set document(title:"附录A SPICE的简要介绍：绪论与设计流程 · PDF419")
= 附录 A　SPICE 的简要介绍
#align(center)[J. Chia 和 R. Saleh]

== A.1　绪论

书中的简化设计公式适合初步估算，手算结果与芯片制造后的实测值可能存在较大偏差。SPICE 用于进一步分析电路与工艺、环境参数对性能的影响。

本附录介绍 SPICE 电路描述的基本语法，重点是直流分析（生成电压传输曲线、电流—电压曲线）与瞬态分析（生成电压或电流随时间变化的曲线）。原书建议在阅读第1—3章以后学习本附录，并结合第3—6章的仿真实例。

== A.2　设计流程

典型的 SPICE 分析包含三个环节：

+ 把电源、主动元件、被动元件、节点与分析命令写入文本卡片组（*SPICE deck*），也可以利用原理图编辑器生成网表。
+ 由 SPICE 软件读取网表，检查输入语法，并执行所请求的直流或瞬态模拟。
+ 用文本数据或波形图分析计算结果，比较不同输入、器件或时间条件下的响应。

*原书图 A.1* 位于下一扫描页，按“SPICE 网表 → 计算机仿真 → 电流—电压图”展示这一流程。

_本页重新建立了可编辑标题、段落和编号列表；尚未对全部原书断行及版面取得逐项验收。_
