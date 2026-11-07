// ORIGINAL PDF218 / PRINTED199 · Example6.2 original code via user-supplied .sp file.
#set document(title:"第6章·例6.2在0.18μm用SPICE提取Cg·PDF218")
#align(center)[#text(size:8pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　　199]]
#line(length:100%,stroke:.55pt)

#align(center)[$C_("eff") = C_j + 2C_("ol") approx 0.5 " fF/μm" + 2(0.25 " fF/μm") approx 1 " fF/μm"$]

总的自身电容可以通过将 $C_("eff")$ 乘以器件宽度 $W$ 来计算。

#line(length:100%,stroke:.5pt)
*例6.2　在0.18 μm工艺中用SPICE确定 $C_g$ 和 $C_("eff")$*
#line(length:100%,stroke:.5pt)

*问题：* 用以下电路通过SPICE确定在0.18 μm工艺下的 $C_g$ 和 $C_("eff")$。10X的反相器驱动40X的反相器，而40X的反相器又驱动160X的反相器。施加正的阶跃输入并在结点out处测量传播延迟。设计一个可以提取这两个所求的电容参数的方法。

#align(center)[10X　▷── out ──▷ 40X ── out1 ──▷ 160X ── out2]

*解答：* 运行两种模拟。在第一种情况下，设置所有面积和周长值为0以便忽略结电容。测量上升和下降时的传播延迟并提取 $C_g$。然后，将所有面积和周长值设置为正确值并再次测量传播延迟。延迟的增加是由于结电容引起的，所以 $C_("eff")$ 的值可以提取出来。

#show raw.where(block:true):set text(size:5.7pt)
#raw(read("../examples/ch6-example6-2-no-area.sp"),block:true,lang:"spice")

下降时的传播延迟是40 ps，上升时的传播延迟是55 ps。在这两种情况下可以用延迟公式来求出 $C_g$：

#align(center)[$t_("pHL") = 0.7 R_N C_("fanout")$]
#align(center)[$40 " ps" = 0.7 ((12.5 " kΩ")/10) C_g (8 " μm" + 16 " μm")$]
#align(center)[$therefore C_g approx 1.9 " fF/μm"$]

#align(center)[$t_("pLH") = 0.7 R_P C_("fanout")$]
#align(center)[$55 " ps" = 0.7 ((30 " kΩ")/20) C_g (8 " μm" + 16 " μm")$]
#align(center)[$therefore C_g approx 2.2 " fF/μm"$]