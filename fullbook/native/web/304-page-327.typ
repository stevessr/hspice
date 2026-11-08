// SOURCE PDF PAGE 327 / printed 308. Source-guided editable editorial draft.
// No full-page 1:1 acceptance; all transistor-level artwork remains provisional.
#import "../figures/ch8-sram-cam-native.typ": figure9
#set document(title:"第9章·PDF327·CAM与FPGA")
#align(center)[#text(size:8pt,weight:"bold")[308　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#figure9(5)
#align(center)[*图9.5　为加速匹配操作而重新排列的CAM单元（可编辑结构示意）*]

*例9.1　匹配操作的延迟*

*问题：* 使用0.18 μm工艺参数，估算图9.4所示CAM阵列的最坏不匹配延迟。每一行有33个CAM单元（包括有效位），每一列有128个CAM单元。标签线总电容450 fF，匹配线总电容200 fF，标签线输入驱动器电容3 fF。

*解答：* 标签线经过驱动器传播，然后匹配线根据最坏的不匹配位放电。因此总时间可分为两部分：

#align(center)[$t_("total")=t_("tag")+t_("matchline")$]

标签线可以使用第6章的逻辑强度分析。以FO4为经验级强度，路径的电气强度为：

#align(center)[$H= C_("tag")/C_("in")=(450 "fF")/(3 "fF")=150$]

驱动器级数近似：

#align(center)[$N approx log_4(150) approx 3.6$]

因此选择4级驱动器，最佳的平均级强度约为：

#align(center)[$"SE"=root(4,150) approx 3.5$]

实际布线的寄生、上拉及下拉速度仍需结合后续每级寄生延迟计算。
