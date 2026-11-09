# 教材第 1—4 章专项复习

依据《数字集成电路分析与设计——深亚微米工艺（第三版）》前四章编写，包含详细讲义、每章12题和逐题解析；**本套 S1—S4 为自编习题，不是原书 P1—P4 习题的转录。**

## 四章入口

| 章节 | 知识讲义 | 基础题 | 基础解析 | 本章互动 |
|---|---|---|---|---|
| 第1章 深亚微米数字集成电路设计 | [阅读](/review-1to4/01-notes) | [12题](/review-1to4/01-exercises) | [详细解析](/review-1to4/01-answers)  [交互20题](/review-1to4/interactive-01) |
| 第2章 MOS 晶体管 | [阅读](/review-1to4/02-notes) | [12题](/review-1to4/02-exercises) | [详细解析](/review-1to4/02-answers)  [交互20题](/review-1to4/interactive-02) |
| 第3章 制造、版图和模拟 | [阅读](/review-1to4/03-notes) | [12题](/review-1to4/03-exercises) | [详细解析](/review-1to4/03-answers)  [交互20题](/review-1to4/interactive-03) |
| 第4章 MOS 反相器电路 | [阅读](/review-1to4/04-notes) | [12题](/review-1to4/04-exercises) | [详细解析](/review-1to4/04-answers)  [交互20题](/review-1to4/interactive-04) |

**[按章交互80题](/review-1to4/interactive)** · **[浏览器在线实验](/review-1to4/online-lab)** · **[六组 HSPICE 仿真实验](/review-1to4/simulations)** · **[公式速查与原书习题定位](/review-1to4/reference)**

# 使用说明与考点地图

**教材依据：** David A. Hodges、Horace G. Jackson、Resve A. Saleh，《数字集成电路分析与设计——深亚微米工艺（第三版）》中文版。当前附件是445页扫描版，正文第1—4章完整，书内印刷页码为1—147；附件PDF页码通常约为**印刷页码+19**（例如第4章习题始于印刷142页，PDF第161页）。本讲义中的章节名称、讨论顺序、模型类型与核心知识点以附件为依据。以下解释、图像、例题和额外练习均重新编写，**不是原书逐字转录**。

**学习路径：** 第1章解释“为什么设计数字IC”；第2章解决“晶体管如何导电”；第3章解决“器件怎样制造并准确仿真”；第4章利用器件方程计算“反相器怎样工作、怎样选尺寸”。

| 章节 | 原书范围 | 建议掌握层次 | 高频技能 |
|:--|:--|:--|:--|
| 1 深亚微米数字集成电路设计 | 印刷1—27页 | 概念 + 计算 | VTC、噪声容限、延迟、功耗 |
| 2 MOS晶体管 | 印刷28—67页 | 核心推导 + 计算 | $V_T$、工作区判断、$I_D$、电容 |
| 3 制造、版图和模拟 | 印刷68—107页 | 流程 + 应用 | CMOS工艺、版图、SPICE/BSIM3 |
| 4 MOS反相器电路 | 印刷108—147页 | 核心推导 + 设计 | 负载反相器、CMOS VTC、尺寸比 |

**考场推荐顺序：** 先判定器件端电压与工作区，再列电流守恒，再代入模型，最后检验求出的工作区假设。单纯背公式而不检查工作区，是最常见的失分原因。

## 教材原例题、计算方法与工艺专题

原教材第2—4章明确编号的29个例题按教材页码保留索引：[教材原例题](/review-1to4/textbook-examples)。此外新增[公式推导与计算方法](/review-1to4/calculation-methods)、[制造工艺与版图数据表](/review-1to4/technology-tables)、[32道进阶综合习题](/review-1to4/advanced)。

## 延伸阅读

[课程常规复习](/content/00-reading-guide) · [九章 Typst 精编](/textbook) · [HSPICE 实践题](/content/practice/)
