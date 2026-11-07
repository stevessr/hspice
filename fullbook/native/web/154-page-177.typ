// SOURCE PDF PAGE 177 / printed 158
#set document(title:"第5章 · 例5.2 NAND HSPICE输入扫描 · PDF177")
= 第5章 · 印刷第158页
== 例5.2　NAND2切换点与SPICE比较（续）
本书对两个输入一起切换的情况取宽度比例：
$ chi=sqrt((W_N E_("cP"))/(W_P E_("cN")))=sqrt((200 times24)/(800 times6))=1.0 $
$ V_S=(1.8-0.5+0.5 times1.0)/(1+1.0)=0.9 " V" $
为了验证，分别对A变化（B固定高）、B变化（A固定高）、A与B一起变化三种情形执行HSPICE直流扫描。原书模型是0.18 μm CMOS、1.8 V供电，四管均采用PMOS1/NMOS1，尺寸L=2、W=4且缩放因子0.1u。
== A变化，B固定VDD
#raw("* NAND2 DC scan: A variable, B tied to VDD\n.param Supply=1.8\n.lib 'bsim3v3.cmosp18.lib' TT\n.opt scale=0.1u\n.global Vdd Gnd\nVdd Vdd Gnd 'Supply'\nmpa out A Vdd Vdd PMOS1 l=2 w=4\nmpb out Vdd Vdd Vdd PMOS1 l=2 w=4\nmna out A x Gnd NMOS1 l=2 w=4\nmnb x Vdd Gnd Gnd NMOS1 l=2 w=4\nVin A Gnd 0\n.dc Vin 0 1.8 0.036\n.plot dc V(out)\n.end",block:true)
== B变化，A固定VDD
更换扫描端：连接A到Vdd，B通过输入电源由0到1.8 V；串联NMOS的上下位置不同，两条VTC可能不完全重叠。
== A、B同时变化
四只MOS的栅极接同一输入源，实际网表及输出曲线延续到下一页。该页例题使用的是教学工艺模型，不应将固定数值当作现代工艺普适指标。
