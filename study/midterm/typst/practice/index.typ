// GENERATED FILE -- edit Markdown and run scripts/sync_typst.py
= 实践题库：任务、计算与 HSPICE 仿真
<实践题库任务计算与-hspice-仿真>
练习按#strong[五个主题];独立编写。每组先列出要求，再给出单独的参考解答页面；题目中的数值为教学假设或源自课程实验的已知条件，不应误解为实际工艺仿真结果。

#figure(
align(center)[#table(
  columns: 5,
  align: (col, row) => (auto,auto,auto,auto,auto,).at(col),
  inset: 6pt,
  [主题], [知识范围], [训练形式], [题目], [参考解答],
  [一 · MOS 器件],
  [实验一至四],
  [区域判断、漏电流、体效应、沟道长度调制],
  [#link("./01-mos.md")[开始练习];],
  [#link("./answers/01-mos.md")[查看解析];],
  [二 · 反相器],
  [实验五、六],
  [负载线、噪声容限、功耗、尺寸设计],
  [#link("./02-inverter.md")[开始练习];],
  [#link("./answers/02-inverter.md")[查看解析];],
  [三 · CMOS 逻辑],
  [实验七、八],
  [NAND、NOR、XOR、MUX 与网络设计],
  [#link("./03-logic.md")[开始练习];],
  [#link("./answers/03-logic.md")[查看解析];],
  [四 · 时序电路],
  [实验九],
  [SR 状态表、主从 JK 时序、一次锁存],
  [#link("./04-sequential.md")[开始练习];],
  [#link("./answers/04-sequential.md")[查看解析];],
  [五 · HSPICE],
  [实验一至九],
  [网表阅读、参数扫描、瞬态、误差排查],
  [#link("./05-hspice.md")[开始练习];],
  [#link("./answers/05-hspice.md")[查看解析];],
)]
)

== 推荐作答流程
<推荐作答流程>
+ 先复习对应章节，明确电压和电流的参考方向。
+ 独立完成计算与电路建模，保留公式、单位、关键中间步骤。
+ 运行 HSPICE 前核对模型库、器件类型、源漏体端、供电电压和仿真选项。
+ 对照参考解答解释偏差；不要将长沟道手算值直接视为深亚微米工艺的精确仿真结果。

#strong[练习性质：];以下均为根据实验一至实验九知识点编写的训练题，不代表课程考试真题或教师指定的评分标准。
