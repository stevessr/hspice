// SOURCE PDF PAGE 234 / printed 215. Example6.9 N=4 and NAND/NOR path.
#import "../figures/ch6-path-sizing-native.typ": fig625
#set document(title:"第6章 · 例6.9四级优化与6.5.3 NAND路径 · PDF234")
#align(center)[#text(size:8pt,weight:"bold")[第6章　高速 CMOS 逻辑设计　　　　　　　　　　　　215]]
#line(length:100%,stroke:.5pt)

如果限制使用三级，这就是最佳的扇出比。如果要改善延迟，则首先要去除级数的限制。然后，可以用以下公式计算级数：

#align(center)[$N=(ln(C_("load")/C_("in")))/(ln f)$]

为了解出 $N$，需要估算 $f$。从图6.23中得到 $f approx 3.6$。因此：

#align(center)[$N=(ln 200)/(ln 3.6) approx 4.1$]

现在，要尝试使用四级（因为必须取整数），于是，$f$ 可以计算如下：

#align(center)[$ln f=(1/4) ln 200$]

#align(center)[$therefore f=200^(1/4) approx 3.8$]

以上两种解答的延迟可以用式（6.22）计算：

#align(center)[$"总延迟"=N times tau_("inv") ((C_(j+1))/(C_j)+gamma_("inv"))$]

对于三级的情况：

#align(center)[$"总延迟"=3 times (7.5 " ps")(5.84+0.5)=142.8 " ps"$]

对于四级的情况：

#align(center)[$"总延迟"=4 times (7.5 " ps")(3.8+0.5)=128 " ps"$]

因此，最好的解决办法是使用四级反相器并使每级反相器的尺寸是前一级的3.8倍。

#line(length:100%,stroke:.5pt)

== 6.5.3　包含与非门和或非门的路径优化

把处理反相器链的方法进行适当的修改就可以将其用于对与非门和或非门链的处理中。对于图6.25所示的与非门链，总延迟可以用下式得到：

#align(center)[$"总延迟"=sum_j tau_("nand") ((C_(j+1))/(C_j)+gamma_("nand"))$]

其中，$tau_("nand")$ 是与非门的本征时间常数，$gamma_("nand")$ 是自身电容和输入门电容的比率。如果像为反相器构造的延迟—扇出曲线（参见图6.23）那样也为与非门画出同样的曲线，将发现 $f=4$ 的值是合适的，最佳的 $f$ 将使每级的延迟相等。

#fig625()
#align(center)[*图6.25　与非门的串联链*]

对于一个连续的或非门链，可得到一个类似的公式：

#align(center)[$"总延迟"=sum_j tau_("nor") ((C_(j+1))/(C_j)+gamma_("nor"))$]

同样，合适的 $f$ 值将使每级延迟相同。