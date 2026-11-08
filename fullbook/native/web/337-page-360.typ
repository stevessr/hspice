// SOURCE PDF PAGE 360; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第360页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("第10章 连线设计         341")

#text("10.2.3 ”长导线的 RC 延迟\n对于长导线，可以根据总的电阻和总的电容计算 RC 延迟再次考虑图 10.4，如果导线的总\n长是上, 并且每一段的长度是AL ,那么L= nAL. 为了方便起见,设导线的单位长度电用是Ra = 7,\n导线单位长度电容是Cos = Co 总电阻是Ruve = 忆并且总的电容是Care = <L。 假设有\"段 AEE\n延迟计算可以得到:\nTeimore = (TAL)(cAL) + 2(rALJ(cAL) + … + n(rAL)(cAL)\n= (AL)zrc(L+2+ …十用\n= (AL)*re(n)(m + 1)/2\n= (AL)*ren?/2 = Era/2 = RyigeCwise!2                       (10.7)")

#text("实际的传输延迟值接近0.38RwveCwre，比艾壹延迟预测的略小，所以可以认为艾蒙延迟是稍微保\n守的。注意到这点之后,按照式 ( 10.7 ) HERS L 的平方成正比-这提醒我们长导线将导致显著\n的延迟 。\n实际上，必须有一个缓冲器或者反相中来驱动连线， 如图 107 所示。 驱动器可以用一个电压\n源或电源电阻表示。电压源可以是 Gnd 或者Vpp，这取决于开关事件的方向，电源电阻是缓冲器\nOF\nRy Ry RyRy RyRy")

#text("oR Tee Foe")

#text("图 107 驱动器和连线")

#text("我们也应该计算连接到连线的缓冲器的延迟。另外，为了精确的延迟估算还必须包括所有连\n线上的遍出负载电容。为了简化计算，我们在计算Rse和Ce之后使用集总 RC 模型代替分布式\nRC 连线。如图 10.8 所示，有 3 种形式的 RC 模型.它们表面上看起来虽然是类似的但并非都\n适合于延迟计算的目的。可以通过计算相应时间常数来评估每个模型")

#text("工模型 下模型                        了模型\n图108 3 种可能的集总 RC 模型")

#text("首先,上模型的时间常数是ReCwe。 我们已经从式 (107 ) 得知延迟应该是ReeCwe/2，所\n以不应当使用这个模型。第二个模型是 n 模型，电容分为两半赋给输入和输出， 时间常数是\nRunCwie/2. 第三个模型是T模型,电阻分为两半贱给输入和输出 这里时间常数也是ReireCwae/2.\n所以二模型对于长的分布式 RC 连线不是一个精确的模型,而 模型和T模型产生了正确的结果,\n因此对于延迟计算痢是合适的。T 模型有阁外的节点.  可能增加计算的数量。其结果是，对于分")
