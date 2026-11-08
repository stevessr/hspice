// SOURCE PDF PAGE 360 / printed 341. Source-scan-guided editable Typst.
// Figure 10.7/10.8 geometries are editable interpretive redraws, not 1:1 certified.
#import "../figures/ch10-rc-elmore-native.typ": figure10more
#set document(title:"第10章 · 10.2.3长导线RC延迟、式10.7、图10.7—10.8 · PDF360")
#set text(size:7.15pt)
#set par(justify:true,leading:2.4pt,spacing:3.5pt)
#align(center)[#text(size:8pt,weight:"bold")[第 10 章　连线设计　　　　　　　　　341]]
#line(length:100%,stroke:.55pt)

== 10.2.3　长导线的 RC 延迟

对于长导线，可以根据总的电阻和总的电容计算 RC 延迟。再次考虑图 10.4。如果导线的总长是 $L$，并且每一段的长度是 $Delta L$，那么 $L=n Delta L$。为了方便起见，设导线的单位长度电阻是 $R_("int")=r$，导线单位长度电容是 $C_("int")=c$。总电阻是 $R_("wire")=r L$，并且总电容是 $C_("wire")=c L$。假设有 $n$ 段，用艾蒙延迟计算可以得到：

$ tau_("Elmore") = (r Delta L)(c Delta L) + 2(r Delta L)(c Delta L) + dots + n(r Delta L)(c Delta L) $

$ = (Delta L)^2 r c (1+2+dots+n) $

$ = (Delta L)^2 r c (n(n+1))/2 $

$ approx (Delta L)^2 r c n^2 / 2 = (L^2 r c)/2 = (R_("wire") C_("wire"))/2 quad "(10.7)" $

实际的传输延迟直接近似 $0.38 R_("wire") C_("wire")$，比艾蒙延迟预测的略小，所以可以认为艾蒙延迟是稍微保守的。注意到这点之后，按照式（10.7），延迟与 $L$ 的平方成正比。这提醒我们长导线将导致显著的延迟。

实际上，必须有一个缓冲器或者反相器来驱动连线，如图 10.7 所示。驱动器可以用一个电压源或电源电阻表示。电压源可以是 Gnd 或者 $V_("DD")$，这取决于开关事件的方向。电源电阻是缓冲器的导通电阻。

#figure10more(7)
#align(center)[#text(size:6.7pt)[图 10.7　驱动器和连线]]

我们也应该计算连接到连线的缓冲器的延迟。另外，为了精确的延迟估算还必须包括所有连线上的扇出负载电容。为了简化计算，我们在计算 $R_("wire")$ 和 $C_("wire")$ 之后使用集总 RC 模型代替分布式 RC 连线。如图 10.8 所示，有 3 种形式的 RC 模型。它们表面上看起来虽然是类似的，但并非都适合于延迟计算的目的。可以通过计算相应时间常数来评估每个模型。

#figure10more(8)
#align(center)[#text(size:6.7pt)[图 10.8　3 种可能的集总 RC 模型：L 型、π 型、T 型]]

首先，L 模型的时间常数是 $R_("wire")C_("wire")$。我们已经从式（10.7）得知延迟应该是 $R_("wire")C_("wire")/2$，所以不应当使用这个模型。第二个模型是 π 模型，电容分为两半赋给输入和输出，时间常数是 $R_("wire")C_("wire")/2$。第三个模型是 T 模型，电阻分为两半赋给输入和输出。这里时间常数也是 $R_("wire")C_("wire")/2$。所以 L 模型对于长的分布式 RC 连线不是一个精确的模型，而 π 模型和 T 模型产生了正确的结果，因此对于延迟计算都是合适的。T 模型有额外的节点，可能增加计算的数量。其结果是，对于分布式 RC 连线 π 模型是最常用的集总模型。
