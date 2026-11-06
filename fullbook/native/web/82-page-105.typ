// SOURCE PDF PAGE 105 / editorial Typst candidate, not 1:1 accepted.
#import "../figures/ch3-layout-spice-native.typ": bsim-grid
#set document(title:"第3章 · 图3.11参数提取和例3.3 · PDF105")
#set text(lang:"zh")
= 第3章 · 印刷第86页

== 图3.11　MOS晶体管的参数提取

原书图3.11(a)在固定漏源电压的饱和区，绘制 $\sqrt(2 I_D)$ 对 $V_("GS")$ 的直线；不同体偏压 $V_("SB")=0$、1、2 V 对应不同横轴截距。

#table(columns:(1.15fr,2.6fr),
 table.header([*待提取参数*],[*测量/拟合依据*]),
 [VTO],[零体偏时的直线横轴截距],
 [KP],[由斜率 $sqrt((W_("eff") "KP")/L_("eff"))$ 计算],
 [GAMMA],[不同体偏压造成的阈值漂移],
 [LAMBDA],[图3.11(b)饱和区不同漏压时的电流比],
)

原图3.11(b)选择 $V_("GS")=V_T+1$，改变漏源电压，设两测量点为 $(V_("D1"),I_("D1"))$、$(V_("D2"),I_("D2"))$，有：

$ I_("D2")/I_("D1") =
 (1+"LAMBDA" V_("D2"))/(1+"LAMBDA" V_("D1")) $

这里的LAMBDA属于沟道长度调制系数，非几何设计规则的λ参数。

== 例3.3　SPICE LEVEL 1 模型规格

假设测量提取后得到：

$ "VTO"=0.5 " V", quad k' = 300 " μA/V"^2 $

$ "PHI"=0.8 " V", quad "GAMMA"=0.4 sqrt("V"),
 quad "LAMBDA"=0 $

则原书提供的模型卡为：

#raw(".model NMOS1 nmos level=1 vto=0.5 kp=300u phi=0.8 gamma=0.4 lambda=0",block:true)

教材强调，完整的 LEVEL 1 规格应比这个教学例子包括更多参数，此处只用于说明如何将已提取的阈值、跨导、体效应与沟道长度调制参数写入SPICE模型卡。

_图3.11的原始测量散点和测试电路暂作为文字及表格校对选段；本页未将示意曲线伪称为原始实验数据。_
