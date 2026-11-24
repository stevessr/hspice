// SOURCE PDF PAGE 445 / back cover (ISBN 7-121-01666-4)
// Source-referenced editable native text and EAN-13 geometry.
// Original dark photographic textures, logos and security label are NOT facsimiled.
#set document(title: "数字集成电路分析与设计：深亚微米工艺（第三版）·原书封底")
#set page(fill: rgb("#171c3e"))
#set text(size: 8.7pt, fill: white)
#set par(justify: true, leading: .42em, spacing: 3.2pt)

// The 95 EAN-13 modules are encoded as 30 black bar runs. ISBN-13:
// 9787121016660 (valid check digit 0). Every bar is editable geometry.
#let isbn-bars() = html.frame(block(width: 219pt, height: 100pt)[
  #place(top + left, dx: 0pt, dy: 0pt,
    rect(width: 207pt, height: 99pt, fill: white))
  #place(top + left, dx: 20pt, dy: 4pt,
    text(fill: black, size: 8.1pt)[ISBN 7-121-01666-4])
  #for (pos, count) in (
    (0,1), (2,1), (4,3), (8,2), (13,1), (16,1),
    (19,1), (23,1), (26,2), (30,1), (33,2), (36,2),
    (40,2), (44,1), (46,1), (48,1), (50,3), (55,1),
    (57,2), (61,2), (64,1), (66,1), (71,1), (73,1),
    (78,1), (80,1), (85,3), (90,1), (92,1), (94,1)
  ) [
    #place(top + left, dx: 23pt + pos * 1.55pt, dy: 24pt,
      rect(width: count * 1.55pt, height: 56pt, fill: black))
  ]
  #place(top + left, dx: 18pt, dy: 82pt,
    text(fill: black, size: 8.4pt)[9　787121　016660])
])

#align(center)[
  #text(size: 21pt, weight: "bold")[数字集成电路分析与设计]
  #v(3pt)
  #text(size: 14pt, weight: "bold")[——深亚微米工艺（第三版）]
  #v(8pt)
  #line(length: 100%, stroke: white + .4pt)
  #v(5pt)
  #text(size: 9pt, weight: "bold")[
    Analysis and Design of Digital Integrated Circuits:
    In Deep Submicron Technology, Third Edition
  ]
]

#v(8pt)
本书是 Hodges 和 Jackson 的《数字集成电路分析与设计》的第三版，由新的合著者——英国哥伦比亚大学的 Resve Saleh 教授进行了全面修订和更新。这一新版保持了原著的简洁易用性，添加了全面更新的内容，使本书更适合于 21 世纪的教学。

本版集中讨论最新的 CMOS 工艺（0.18 μm，0.13 μm），并在全书中使用标准的深亚微米模型。书中对有关存储器的内容进行了拓展和更新，包含了更多 SPICE 模拟的内容。此外，增加了很多反映当前工艺和设计实践的新习题和实例。

#v(4pt)
#text(weight: "bold", size: 10.3pt)[本书特点]
- 强调先进的 CMOS 工艺
- 涵盖了更新的逻辑设计和存储器设计的拓展内容
- 涵盖了重要性不断增强的深亚微米互连的主题
- 添加了有关高速设计和优化工艺的新材料
- 进一步强调了 SPICE 模拟

#v(3pt)
#text(fill: rgb("#f3d75e"), size: 12pt, weight: "bold")[作者简介]

*David A. Hodges* 是加州大学伯克利分校的工程学荣誉退休教授，获得了 Daniel M. Tellep 杰出教授奖。他在康奈尔大学获得电机工程学士学位，并在加州大学伯克利分校获得硕士和博士学位。Hodges 教授是 1997 年 IEEE 教育奖章和 1999 年 ASEE Benjamin Garver Lamme 奖的获得者。

*Horace G. Jackson* 在英格兰出生和受教育，1956 年他进入加州大学的 Lawrence Berkeley 实验室，从事核科学研究仪器的开发工作，直到退休。Jackson 博士与人合著过两本书，并且在核科学和电子工程学期刊上发表了内容广泛的多篇文章。

*Resve A. Saleh* 目前拥有英国哥伦比亚大学电机与计算机工程系的 NSERC/PMC-Sierra 教授职位。Saleh 博士在加州大学伯克利分校获得电机工程硕士与博士学位。他出版了两本书，发表的期刊文章和会议论文超过 50 篇。Simplex Solutions 公司（Sunnyvale, CA）是一家深亚微米验证公司，Saleh 博士是该公司的创始人之一。

#v(9pt)
#align(center)[#isbn-bars()]
#align(center)[
  #text(size: 8pt)[电子工业出版社　·　McGraw-Hill]
  #v(2pt)
  #text(size: 8pt)[责任编辑：史平　　责任美编：毛惠庚　　定价：48.00 元]
]

_此页文字、书目数据和可编辑 ISBN 条码重新对照源扫描；原版防伪标签、出版社徽标、芯片纹理和逐行几何仍须校验，不计入严格 1:1 已验收页。_
