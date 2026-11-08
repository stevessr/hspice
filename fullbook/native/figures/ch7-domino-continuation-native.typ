// SOURCE PDF277–284 / printed 258–265.
// All figures are constructed from editable Typst primitives.
// Topological schematic drafts: exact geometry and all MOS connectivity
// still require manual scan overlay before full-page acceptance.
#let w(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,line(end:(x2-x1,y2-y1),stroke:.8pt))
#let t(x,y,s)=place(top+left,dx:x,dy:y,text(size:7.5pt)[#s])
#let r(x,y,ww,hh)=place(top+left,dx:x,dy:y,rect(width:ww,height:hh,stroke:.8pt))
#let b(x,y,ww,hh,s)={
  r(x,y,ww,hh)
  t(x+5pt,y+hh/2 - 5pt,s)
}
#let inv(x,y)={
  w(x,y - 11pt,x,y+11pt)
  w(x,y - 11pt,x+21pt,y)
  w(x,y+11pt,x+21pt,y)
  place(top+left,dx:x+23pt,dy:y - 2pt,circle(radius:2pt,stroke:.8pt,fill:white))
}
#let gnd(x,y)={
  w(x,y,x,y+6pt)
  w(x - 9pt,y+6pt,x+9pt,y+6pt)
  w(x - 6pt,y+9pt,x+6pt,y+9pt)
}
#let cap(x,y)={
  w(x,y,x+14pt,y)
  w(x,y+5pt,x+14pt,y+5pt)
}
#let dynamic(x,y,lab:"NMOS",width:"",with-inv:true)={
  t(x+15pt,y - 12pt,"VDD")
  w(x+35pt,y,x+35pt,y+13pt)
  b(x+24pt,y+13pt,22pt,19pt,"P")
  w(x+35pt,y+32pt,x+35pt,y+47pt)
  b(x+6pt,y+47pt,58pt,35pt,lab)
  w(x+35pt,y+82pt,x+35pt,y+94pt)
  b(x+24pt,y+94pt,22pt,18pt,"N")
  gnd(x+35pt,y+113pt)
  w(x - 14pt,y+24pt,x+24pt,y+24pt)
  w(x - 14pt,y+103pt,x+24pt,y+103pt)
  t(x - 12pt,y+8pt,"CLK")
  if with-inv {
    w(x+35pt,y+39pt,x+80pt,y+39pt)
    inv(x+80pt,y+39pt)
    w(x+105pt,y+39pt,x+122pt,y+39pt)
    t(x+124pt,y+28pt,if width=="" {"F"} else {width})
  }
}
#let fig727()=grid(columns:(1fr,1fr),column-gutter:7pt,
  [#html.frame(block(width:188pt,height:158pt)[
    #dynamic(27pt,11pt,lab:"NMOS1",with-inv:false)
    #w(62pt,50pt,151pt,50pt)
    #b(125pt,58pt,49pt,29pt,"NMOS2")
    #t(4pt,142pt,"(a) 无反相隔离：不能直连")
  ])],
  [#html.frame(block(width:188pt,height:158pt)[
    #dynamic(15pt,9pt,lab:"NMOS1")
    #b(138pt,62pt,40pt,37pt,"NMOS2")
    #t(5pt,142pt,"(b) 加入反相器：多米诺级")
  ])])
#let fig728()=html.frame(block(width:388pt,height:130pt)[
  #for k in range(3) [
    #let x=4pt+k*127pt
    #t(x+27pt,2pt,"CLK")
    #b(x+14pt,25pt,60pt,67pt,"NMOS")
    #w(x+44pt,5pt,x+44pt,25pt)
    #gnd(x+44pt,93pt)
    #w(x+74pt,58pt,x+85pt,58pt)
    #inv(x+85pt,58pt)
    #t(x+83pt,12pt,"Y"+str(k+1))
    #t(x+109pt,48pt,"F"+str(k+1))
    #if (k < 2) {w(x+110pt,58pt,x+141pt,58pt)}
  ]
  #t(12pt,119pt,"多米诺级从左至右逐级求值")
])
#let fig-example77()=html.frame(block(width:388pt,height:120pt)[
  #b(8pt,14pt,100pt,67pt,"X = a XOR b")
  #b(145pt,14pt,96pt,67pt,"X̄ = a XNOR b")
  #b(281pt,14pt,100pt,67pt,"sum = c XOR X")
  #w(108pt,45pt,281pt,45pt)
  #t(19pt,93pt,"a,b：静态输入")
  #t(145pt,93pt,"X / X̄：互补逻辑")
  #t(295pt,93pt,"clk：求值")
])
#let fig729()=grid(columns:(1fr,1fr),column-gutter:9pt,
  [#html.frame(block(width:186pt,height:153pt)[
    #t(6pt,3pt,"(a) 静态 NOR")
    #t(67pt,16pt,"VDD")
    #b(50pt,31pt,58pt,43pt,"P:16λ×2")
    #b(50pt,79pt,58pt,37pt,"N:4λ×2")
    #w(80pt,74pt,80pt,79pt)
    #w(80pt,116pt,80pt,128pt)
    #gnd(80pt,128pt)
    #w(108pt,74pt,169pt,74pt)
    #t(4pt,80pt,"A,B")
    #t(120pt,59pt,"OUT")
  ])],
  [#html.frame(block(width:186pt,height:153pt)[
    #t(6pt,3pt,"(b) 动态 NOR")
    #dynamic(22pt,22pt,lab:"N:8λ×2",width:"OUT")
    #t(6pt,144pt,"P=8λ；底管 N=8λ")
  ])])
#let fig730()=grid(columns:(1fr,1fr),column-gutter:7pt,
  [#html.frame(block(width:190pt,height:130pt)[
    #dynamic(17pt,7pt,lab:"IN / 0",with-inv:false)
    #w(52pt,44pt,147pt,44pt)
    #w(146pt,44pt,146pt,61pt)
    #cap(139pt,61pt)
    #gnd(146pt,78pt)
    #t(150pt,53pt,"Cout")
    #w(61pt,82pt,114pt,82pt)
    #cap(105pt,97pt)
    #gnd(112pt,113pt)
    #t(118pt,96pt,"Cx")
    #t(71pt,73pt,"X")
    #t(71pt,93pt,"Y")
  ])],
  [#html.frame(block(width:190pt,height:130pt)[
    #t(6pt,4pt,"CLK  ＿/￣￣")
    #t(6pt,28pt,"IN    ＿＿/￣")
    #t(6pt,52pt,"OUT   ? → 下降")
    #t(6pt,76pt,"X     ＿＿/￣")
    #w(23pt,108pt,165pt,108pt)
    #t(7pt,117pt,"求值时内部电荷重新分配")
  ])])
#let fig731()=grid(columns:(1fr,1fr),column-gutter:9pt,
  [#html.frame(block(width:186pt,height:147pt)[
    #dynamic(18pt,8pt,lab:"求值网络")
    #w(70pt,47pt,143pt,47pt)
    #b(126pt,71pt,47pt,26pt,"弱P")
    #w(151pt,47pt,151pt,71pt)
    #t(7pt,135pt,"(a) 反馈弱保持管")
  ])],
  [#html.frame(block(width:186pt,height:147pt)[
    #dynamic(18pt,8pt,lab:"求值网络")
    #w(70pt,47pt,143pt,47pt)
    #b(126pt,71pt,47pt,26pt,"串联P")
    #w(151pt,47pt,151pt,71pt)
    #t(7pt,135pt,"(b) 最小化反馈负担")
  ])])
#let fig-example78()=html.frame(block(width:376pt,height:108pt)[
  #t(5pt,4pt,"CLK")
  #b(58pt,17pt,168pt,66pt,"AB + C 动态网络")
  #w(226pt,49pt,267pt,49pt)
  #inv(267pt,49pt)
  #w(292pt,49pt,331pt,49pt)
  #t(342pt,38pt,"F")
  #t(5pt,96pt,"1.2 V；预充16λ；输入管16λ、8λ；底管8λ")
])
#let fig732()=html.frame(block(width:377pt,height:143pt)[
  #t(173pt,2pt,"VDD")
  #w(193pt,17pt,193pt,36pt)
  #b(67pt,36pt,85pt,58pt,"F")
  #b(235pt,36pt,85pt,58pt,"F̄")
  #w(152pt,64pt,235pt,64pt)
  #w(193pt,94pt,193pt,113pt)
  #b(178pt,113pt,32pt,18pt,"CLK")
  #t(7pt,50pt,"OUT")
  #t(328pt,50pt,"OUT̄")
  #t(75pt,125pt,"双轨：两个动态逻辑块共享求值时钟")
])
#let fig733()=html.frame(block(width:373pt,height:147pt)[
  #t(179pt,4pt,"VDD")
  #b(70pt,27pt,93pt,77pt,"a · b")
  #b(213pt,27pt,93pt,77pt,"ā + b̄")
  #w(163pt,63pt,213pt,63pt)
  #w(186pt,104pt,186pt,120pt)
  #b(169pt,120pt,35pt,20pt,"CLK")
  #t(13pt,62pt,"ab")
  #t(315pt,62pt,"(ab)̄")
])
#let fig734()=html.frame(block(width:373pt,height:148pt)[
  #t(166pt,1pt,"VDD")
  #b(65pt,32pt,93pt,68pt,"a · b")
  #b(220pt,32pt,93pt,68pt,"ā + b̄")
  #w(158pt,63pt,220pt,63pt)
  #w(104pt,32pt,267pt,19pt)
  #w(267pt,19pt,267pt,32pt)
  #w(265pt,32pt,99pt,19pt)
  #b(170pt,111pt,35pt,21pt,"CLK")
  #t(7pt,62pt,"ab")
  #t(320pt,62pt,"(ab)̄")
  #t(81pt,138pt,"交叉耦合的弱保持管")
])
#let fig-example79()=html.frame(block(width:372pt,height:115pt)[
  #b(38pt,18pt,126pt,69pt,"XNOR")
  #b(211pt,18pt,126pt,69pt,"XOR")
  #w(164pt,50pt,211pt,50pt)
  #t(41pt,100pt,"输入：a,b,ā,b̄")
  #t(212pt,100pt,"两个互补输出")
])
#let fig735()=grid(columns:(1fr,1fr),column-gutter:9pt,
  [#html.frame(block(width:187pt,height:140pt)[
    #dynamic(21pt,12pt,lab:"逻辑 A",with-inv:false)
    #t(7pt,130pt,"(a) 预充电逻辑")
  ])],
  [#html.frame(block(width:187pt,height:140pt)[
    #dynamic(21pt,12pt,lab:"逻辑 A",with-inv:false)
    #b(107pt,17pt,67pt,30pt,"延迟")
    #w(58pt,50pt,107pt,33pt)
    #w(174pt,32pt,174pt,51pt)
    #t(7pt,130pt,"(b) 自复位后充电逻辑")
  ])])
