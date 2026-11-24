// SOURCE PDF PAGE 434 / printed page 415
// BJT cutaway and minority carrier graph are pending native vector redrawing.
#import "../figures/appendix-b-additional-native.typ": *
#set document(title:"附录B 图B.1、图B.2与npn双极型晶体管 · PDF434")
= 附录 B · 印刷第415页
== B.1　双极结型晶体管（续）

=== 图 B.1　npn 结型晶体管

原书的图 B.1(a) 包含 n⁺ 发射极 E、薄 p 型基极 B、n 型集电极 C，以及引出电极与隔离结构。基区宽度标注为 $W_B <= 0.5 " μm"$。图 B.1(b) 给出正向活性模式下的偏置：发射结正向偏压 $V_("BE")$，集电结反向偏压 $V_("CB")$。

#align(center)[#b1-npn-section()]

#table(columns:(1fr,3fr),inset:3pt,
table.header([*位置*],[*作用*]),
[发射极 E],[向基区注入电子；在 npn 器件中为 n⁺ 区],
[基极 B],[很薄的 p 型区，少数载流子在其中扩散],
[集电极 C],[收集由薄基区输运而来的电子],
)

=== 图 B.2　基区少数载流子分布

在正向活性状态下，电子由发射极注入基区，其稳态浓度沿基区近似线性下降。原书图 B.2 用线性浓度斜率说明集电极电流的来源；少量注入电子在基区复合，形成基极电流。

#align(center)[#b2-minority-carriers()]

电流放大倍数由

$ beta_F = I_C/I_B $

定义。原书采用的示例值为 $beta_F=100$，对应的电流传输因子约为 $alpha_F = 0.99$。

_本页保留了图 B.1/B.2 的器件标号、偏置和关键数值，实际截面与载流子分布曲线仍需按源图逐元素重画。_
