// SOURCE PDF PAGE 131 / printed 112
#import "../figures/ch4-inverter-native.typ": noise-chain, inverter-vtc
#set document(title:"第4章 · SSNM传播与式4.2 · PDF131")
= 第4章 · 印刷第112页
== 图4.4　反相器链路的单源噪声分析
#noise-chain()
*图4.4　(a) 无噪声的反相器系统；(b) 具有一噪声源的系统。*
== 图4.5　反相器链中的噪声传播
#inverter-vtc(title:"图4.5 级联VTC反复映射示意")
为求多级反相器噪声极限，可以把一个反相器的输出当作下一反相器的输入，再利用VTC判断输出能否重新恢复到有效的高、低电平。
如果把切换点记作 $V_S$，在单源模型中原书给出的高低噪声容限为：
$ "SSNM_H" = V_("OH") - V_S $
$ "SSNM_L" = V_S - V_("OL") quad "(4.2)" $
*式（4.2）* 由两行共同组成，分别代表输入信号在高/低逻辑状态相对于切换点的抗噪裕量。
_图4.4—4.5的级联拓扑和式（4.2）根据原书校对，图形比例还未逐线验收。_
