// SOURCE PDF PAGE 219; original image landmark for selection validation.
// ORIGINAL PDF219 / PRINTED200 · verified transistor netlist + shared diffusion Eq6.11.
#set document(title:"第6章·例6.2有效自身电容·共享源漏结电容·PDF219")
#align(center)[#text(size:8pt,weight:"bold")[200　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

结果显示栅电容在由低到高转换的情况下稍高。如期望的那样，获得 $C_g$ 的平均值 $C_g=2 " fF/μm"$。下面运行一个指定面积和周长的模拟，并基于相对于先前SPICE运行结果的传播延迟增加量来计算 $C_("eff")$ 的值。

#show raw.where(block:true):set text(size:5.7pt)
#raw(read("../examples/ch6-example6-2-with-area.sp"),block:true,lang:"spice")

下降时的传播延迟是44 ps，上升时的传播延迟是59 ps。可以在这两种情况下使用相同的延迟公式求出 $C_("eff")$：

#align(center)[$t_("pHL")=0.7 R_N C_("fanout")$]
#align(center)[$44 " ps"=0.7((12.5 " kΩ")/10)(C_g(24 " μm")+C_("eff")(6 " μm"))$]
#align(center)[$therefore C_("eff") approx 0.8 " fF/μm"$]
#align(center)[$t_("pLH")=0.7 R_P C_("fanout")$]
#align(center)[$59 " ps"=0.7((30 " kΩ")/20)(C_g(24 " μm")+C_("eff")(6 " μm"))$]
#align(center)[$therefore C_("eff") approx 0.7 " fF/μm"$]

这个结果也接近于手工计算得到的值。对于手工计算使用 $C_("eff")=1 " fF/μm"$ 是可以接受的，因为这样稍微高估了电容值。事实上，使用斜波输入时，由于任何器件在线性操作区的米勒效应对 $C_("gd")$ 的影响而使得输出电容都稍微增加。我们将会发现 $1 " fF/μm"$ 是一个更合适的值。

#line(length:100%,stroke:.5pt)

现在，把分析扩展到CMOS与非门和或非门上面。因为实际上对与非门和或非门的考虑是类似的，所以在图6.11中用或非门来说明分析的过程。图6.11（a）中给出了一个或非门的符号化版图，图6.11（b）中是相对应的晶体管电路图。为了计算最坏情况下的自身电容，首先在传播延迟为 $t_("pHL")$ 的情况下考虑下拉的情况。输出节点必须被下拉器件中的一个放电到地平面。在最坏情况下，输入A从低电平转变到高电平，而B保持在低电平。因为输出结点的电容和内部结点X的电容都必须被放电。假设输入A有一个阶跃变化，输出结点的电容由所指示的n沟道和p沟道器件的结电容组成。因此，

#align(center)[$C_("self") = C_("DB1") + C_("DB2") + C_("DB3") + C_("SB3") + C_("DB4")$]
#align(center)[$= C_("DB12") + C_("DB3") + C_("SDB34") quad "(6.11)"$]

_注意：$C_("DB12")$ 和 $C_("SDB34")$ 是共享扩散区域的合并计数，不能重复相加。_