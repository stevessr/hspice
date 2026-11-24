// SOURCE PDF 312 / printed 293. Native partially-transcribed source selection.
// Figures not verified transistor-by-transistor. Full page 1:1 NOT accepted.
#import "../figures/ch8-sram-cam-native.typ": figure8,figure9
#set document(title:"第8章·半导体存储器设计·PDF312")
#align(center)[#text(size:8pt,weight:"bold")[293　数字集成电路分析与设计 · 第8章]]
#line(length:100%,stroke:.55pt)

#figure8(20)
#align(center)[*图8.20　差分电压灵敏放大器（晶体管级功能框图草稿）*]

差分电压放大器使用一对源极耦合的输入晶体管，其栅极分别连接到BL与互补BL；上部电流镜将一个支路的电流变化转换为输出端的电压变化，尾电流源提供总偏置电流。

输入电压不能简单地一直偏置到 $V_("DD")$。为使器件在合理工作区间内导通并提供足够输出摆幅，原书分析了把位线初始共模电位控制到 $V_("DD")-V_("TN")$ 附近的理由。

当某一侧位线电压下降时，对应输入管电流减小；另一支路电流增加以保持总尾电流。若一侧输入足够低而关断，则另一侧决定输出节点的快速充电或放电方向。输出极性必须结合晶体管在原图中的实际连接来判断，不能仅凭概念图确定。
