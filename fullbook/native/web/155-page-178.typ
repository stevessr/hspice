// SOURCE PDF PAGE 178 / printed 159
#set document(title:"第5章 · 例5.2的VTC与式5.4复杂CMOS门 · PDF178")
= 第5章 · 印刷第159页
== 例5.2　三种输入方式的SPICE VTC（续）
#raw("* NAND2: both inputs tied together\n.param Supply=1.8\n.lib 'bsim3v3.cmosp18.lib' TT\n.opt scale=0.1u\n.global Vdd Gnd\nVdd Vdd Gnd 'Supply'\nmpa out in Vdd Vdd PMOS1 l=2 w=4\nmpb out in Vdd Vdd PMOS1 l=2 w=4\nmna out in x Gnd NMOS1 l=2 w=4\nmnb x in Gnd Gnd NMOS1 l=2 w=4\nVin in Gnd 0\n.dc Vin 0 1.8 0.036\n.plot dc V(out)\n.end",block:true)
根据原扫描VTC横坐标，三条曲线的切换点：
#table(columns:(2.1fr,1fr),table.header([*扫描条件*],[*原书SPICE VS*]),
[A独立变化],[0.745 V],
[B独立变化],[0.721 V],
[两输入一起变化],[0.883 V])
手工近似对共同输入得约0.9 V，与0.883 V较接近。原书还指出MOS串联位置与体效应会造成A、B单独切换结果不同。
== 5.3　复杂的CMOS门
本节研究超出基本NAND/NOR的静态复合门，例如：
$ F=overline((A+B) dot C) quad "(5.4)" $
可通过多个门组合，也可利用CMOS的互补网络直接构造所需函数。具体下拉网络为A、B并联后与C串联，其上拉网络应按照对偶规则获得。
