// SOURCE PDF PAGE 121 / printed 102, Table3.2 continuation.
#set document(title:"第3章 · 表3.2 BSIM3迁移率、亚阈值参数 · PDF121")
#set text(lang:"zh")
= 第3章 · 印刷第102页

== 表3.2　SPICE的BSIM3v3模型参数（续）

=== 迁移率参数

#table(columns:(0.95fr,3.45fr,0.9fr),inset:(x:2pt,y:1pt),table.header([*名称*],[*功能或物理含义*],[*单位*]),
 [LUA],[UA的加载参数],[—],
 [LUB],[U0的有效沟道长度灵敏度],[cm²·μm/(V·s)],
 [LUC],[UC的加载参数],[—],
 [LVSAT],[VSAT的加载参数],[—],
 [PRWB],[RDSW的体效应系数],[V⁻½],
 [PRWG],[RDSW的栅偏置效应系数],[V⁻¹],
 [PU0],[U0的加载参数],[—],
 [PUB],[UB的加载参数],[—],
 [RDSW],[单位宽度寄生源漏电阻],[Ω·μm],
 [U0],[TNOM时零电场迁移率],[cm²/(V·s)],
 [UA],[一级迁移率降低系数],[m/V],
 [UB],[二级迁移率降低系数],[m²/V²],
 [UC],[迁移率降低的体效应],[V⁻¹],
 [VSAT],[TNOM时的载流子饱和速率],[m/s],
 [WA0],[A0的加载参数],[—],
 [WR],[RDSW计算中的有效宽度指数],[—],
 [WU0],[宽度灵敏度],[μm/V],
 [WUA],[UA的加载参数],[—],
)

=== 亚阈值、衬底和DIBL参数

#table(columns:(0.95fr,3.45fr,0.9fr),inset:(x:2pt,y:1pt),table.header([*名称*],[*功能或物理含义*],[*单位*]),
 [CDSC],[漏/源到沟道的耦合电容],[F/m²],
 [CDSCB],[CDSC的体偏压灵敏度],[F/(m²·V)],
 [CDSCD],[CDSC的漏偏压灵敏度],[F/(m²·V)],
 [CIT],[表面态电容],[F/m²],
 [DSUB],[阈值电压DIBL效应的Leff相关指数],[—],
 [ETA0],[Vth的漏感应势垒降低系数],[—],
 [ETAB],[DIBL效应的体偏压系数],[V⁻¹],
 [LNFACTOR],[NFACTOR加载参数],[—],
 [NFACTOR],[阈值开启旋转因子],[—],
 [PETA0],[ETA0的加载参数],[—],
 [VOFF],[亚阈值区的偏移电压],[V],
 [ALPHA0],[碰撞电离电流的一级参数],[m/V],
 [ALPHA1],[衬底电流参数],[V⁻¹],
 [BETA0],[碰撞电离引起的衬底电流二级参数],[V⁻¹],
 [DELTA],[有效VDS的过渡参数],[V],
 [DROUT],[早期电压DIBL修正的Leff指数],[—],
 [PCLM],[沟道长度调制系数],[—],
 [PDIBLC1],[早期电压DIBL修正的一级系数],[—],
 [PDIBLC2],[早期电压DIBL修正的二级系数],[—],
)

_本页的栏目由迁移率过渡到亚阈值及DIBL，保持原扫描的参数名；部分组合量纲有待再次逐格审查。_
