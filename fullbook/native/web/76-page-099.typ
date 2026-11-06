// Source PDF 099 / printed page 80.
#import "../figures/ch3-layout-spice-native.typ": lambda-rules, contacts
#set document(title:"第3章 · 图3.8和3.9几何设计规则 · PDF099")
#set text(lang:"zh")
= 第3章 · 印刷第80页

== 图3.8　两类设计规则

#lambda-rules()

*图3.8　(a) 最小线宽与间距；(b) 多晶硅栅与有源扩散区的覆盖定位。*

图3.8(a)示例中金属最小线宽为 $3 lambda$，最小间距也是 $3 lambda$。图3.8(b)示例中多晶硅对场区的覆盖用 $2 lambda$ 表示，以保证栅极覆盖扩散区域，避免形成不受栅控制的源漏导电路径。

== 触点的定位规则

触点（contact）连接金属与源漏扩散区域、金属与多晶硅。最小触点面积为 $2 lambda times 2 lambda$，金属和扩散区通常还需在触点边缘外形成包围量。

#contacts()

*图3.9　最小尺寸触点和有源区、金属层的几何关系。*

#table(columns:(2.4fr,1.3fr),
 table.header([*本书示例*],[*最小值*]),
 [金属最小线宽],[$3 lambda$],
 [同层金属间距],[$3 lambda$],
 [多晶硅对有源区的覆盖],[$2 lambda$],
 [最小触点大小],[$2 lambda times 2 lambda$],
 [金属/扩散区对触点包围],[$lambda$],
 [多晶硅与触点间距],[$2 lambda$],
)

图3.9还给出触点与其他层的方向相关距离。由于栅、多晶硅、金属和扩散区的图形相互叠加，判断真实版图是否合法需要按代工厂的完整规则集执行DRC。

_规则数值与图3.8/3.9标题已按扫描核对；原图各个箭头的精确位置还需继续校准。_
