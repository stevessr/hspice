// SOURCE PDF PAGE 439 / printed page 420
#import "../figures/appendix-b-native.typ": bjt-vtc
// BJT inverter VTC: source-checked B.5.1–B.5.4 equations.
#set document(title:"附录B BJT反相器四个逻辑电平与式B.5.1—5.4 · PDF439")
= 附录 B · 印刷第420页
== B.5　电压传输特性（续）

图 B.5 的电压传输曲线保留了原书的三个工作区：截止、正向活性、饱和。对于上一页 $V_("CC")=5 " V"$ 的电阻负载 BJT 反相器：

#bjt-vtc()

+ 截止区对应高输出电平：$V_("OH")=V_("CC")=5 " V"$。
+ 饱和区对应低输出电平：$V_("OL")=V_("CE")("sat")=0.1 " V"$。
+ 刚导通时的输入低阈值：$V_("IL")=V_("BE")("on")=0.7 " V"$。
+ 刚进入饱和时的输入高阈值 $V_("IH")$ 可由基极与集电极电流联立求得。

饱和边缘的集电极电流：

$ I_C("EOS") = (V_("CC")-V_("CE")("sat")) / R_C quad "(B.5.1)" $

利用活性边缘的 $I_C=beta_F I_B$：

$ I_C("EOS") = beta_F I_B("EOS") quad "(B.5.2)" $

并且：

$ I_B("EOS") = (V_("IH")-V_("BE")("sat")) / R_B quad "(B.5.3)" $

因此得到：

$ V_("IH") = V_("BE")("sat") + (R_B / R_C) (V_("CC") - V_("CE")("sat")) / beta_F quad "(B.5.4)" $

从上式可见，增大 $R_B/R_C$ 会提高达到饱和所需的输入电压；$beta_F$ 越高，饱和所需输入越低。

_本页保留了原书的四个关系式和数值定义；VTC曲线的斜率和断点几何仍待定量对照。_
