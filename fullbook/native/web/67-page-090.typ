// Source PDF page 090 / printed 71. Lithography steps 2-5 and STI.
#import "../figures/fabrication-native.typ": lithography-steps
#set document(title:"第3章 IC光刻五步流程与STI · 扫描第90页")
#set text(lang:"zh")

= 第3章 · 印刷第71页

== 3.2.2　光刻工艺（续）

原书使用正光刻胶示范后续步骤：

*步骤2*　在待刻蚀材料表面涂上光阻材料，即光刻胶。

*步骤3*　将玻璃掩膜版放在硅片上，用紫外光曝光；对于正性光刻胶，被曝光区域在显影液中可以溶解。

*步骤4*　显影除去已曝光部分的光刻胶，使用适当工艺刻蚀其下暴露的材料（例如化学刻蚀、离子注入或氧化）。

*步骤5*　清洗剩余光刻胶，保留刻蚀所得的图案。

#lithography-steps()

*源图对应步骤1—5的横截面流程图（可编辑教学示意）。*

本书指出光刻能力受光的波长限制。为了在更小的工艺尺寸上得到期望图形，可以采用光学邻近校正 OPC（optical proximity correction）与移相掩膜版 PSM（phase-shift mask）。教材以130 nm及更小技术说明其应用。

== 3.2.3　晶体管的制造

深亚微米 CMOS 器件需要多次制造工序。首先：

*步骤1　定义阱区与晶体管区域。* NMOS 在 p 型区域中制造，PMOS 在 n 型区域中制造；双阱工艺分别形成 p 阱与 n 阱。器件间采用浅沟槽隔离 STI（shallow trench isolation），通过刻蚀沟槽并用 CVD 氧化物填充实现隔离。

原图该步骤的截面与后续四步绘在 PDF 第91—92页。

_本页流程步骤和缩略术语来自教材，截面仍为可编辑候选图。_
