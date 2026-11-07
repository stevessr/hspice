// PDF261–268 chapter7 source-inspired vector circuit components.
// Every element can be edited as Typst source. Strict original topology,
// mask-device correspondence and pixel-accurate layout remain unresolved.
#let seg(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,line(end:(x2 - x1,y2 - y1),stroke:.85pt))
#let txt(x,y,s)=place(top+left,dx:x,dy:y,text(size:7.3pt)[#s])
#let cap(x,y,s:"")={
  seg(x,y,x + 17pt,y)
  seg(x,y + 5pt,x + 17pt,y + 5pt)
  if s!="" {txt(x + 19pt,y - 2pt,s)}
}
#let switch(x,y,name:"TG")={
  place(top+left,dx:x,dy:y,rect(width:29pt,height:29pt,stroke:.8pt))
  seg(x - 13pt,y + 14pt,x,y + 14pt)
  seg(x + 29pt,y + 14pt,x + 42pt,y + 14pt)
  txt(x + 5pt,y + 7pt,name)
}
#let inverter(x,y)={
  seg(x,y,x,y + 28pt)
  seg(x,y,x + 35pt,y + 14pt)
  seg(x,y + 28pt,x + 35pt,y + 14pt)
  place(top+left,dx:x + 38pt,dy:y + 12pt,circle(radius:2pt,stroke:.8pt,fill:white))
}
#let fig77()=html.frame(block(width:355pt,height:118pt)[
  #txt(4pt,33pt,"A")
  #seg(20pt,50pt,65pt,50pt)
  #switch(65pt,36pt)
  #seg(107pt,50pt,136pt,50pt)
  #txt(136pt,42pt,"B")
  #txt(71pt,8pt,"C")
  #txt(67pt,73pt,"C̄")
  #txt(162pt,44pt,"↔")
  #seg(184pt,50pt,206pt,50pt)
  #place(top+left,dx:208pt,dy:36pt,rect(width:45pt,height:29pt,stroke:.8pt))
  #txt(210pt,44pt,"TG")
  #seg(253pt,50pt,288pt,50pt)
  #txt(295pt,43pt,"B")
])
#let fig78()=grid(columns:(1fr,1fr),column-gutter:9pt,
  [#block(height:132pt)[
    #txt(5pt,7pt,"0 V → B: 0 V")
    #switch(39pt,42pt)
    #seg(81pt,56pt,141pt,56pt)
    #txt(6pt,105pt,"nMOS强传0")
    #txt(91pt,105pt,"pMOS辅助")
  ]],
  [#block(height:132pt)[
    #txt(5pt,7pt,"VDD → B: VDD")
    #switch(39pt,42pt)
    #seg(81pt,56pt,141pt,56pt)
    #txt(6pt,105pt,"pMOS强传1")
    #txt(91pt,105pt,"nMOS辅助")
  ]])
#let fig79()=html.frame(block(width:370pt,height:139pt)[
  #txt(6pt,9pt,"S̄")
  #txt(6pt,43pt,"A")
  #txt(6pt,95pt,"B")
  #switch(105pt,31pt)
  #switch(105pt,83pt)
  #seg(147pt,45pt,185pt,45pt)
  #seg(147pt,97pt,185pt,97pt)
  #seg(185pt,45pt,185pt,97pt)
  #seg(185pt,71pt,255pt,71pt)
  #txt(262pt,65pt,"F=AS+B S̄")
  #txt(90pt,10pt,"S")
])
#let fig710()=grid(columns:(1fr,1fr),column-gutter:8pt,
  [#block(height:130pt)[
    #txt(10pt,8pt,"（a）异或门")
    #switch(63pt,31pt)
    #switch(63pt,83pt)
    #seg(105pt,45pt,127pt,45pt)
    #seg(105pt,97pt,127pt,97pt)
    #seg(127pt,45pt,127pt,97pt)
    #txt(137pt,67pt,"A⊕B")
  ]],
  [#block(height:130pt)[
    #txt(10pt,8pt,"（b）同或门")
    #switch(63pt,31pt)
    #switch(63pt,83pt)
    #seg(105pt,45pt,127pt,45pt)
    #seg(105pt,97pt,127pt,97pt)
    #seg(127pt,45pt,127pt,97pt)
    #txt(137pt,67pt,"A XNOR B")
  ]])
#let fig711()=grid(columns:(1fr,1fr),column-gutter:8pt,
  [#block(height:178pt)[
    #txt(8pt,2pt,"(a) 两级4:1 MUX")
    #for i in range(4) [
      #let y=24pt + i * 31pt
      #txt(5pt,y + 6pt,str(i))
      #switch(49pt,y)
    ]
    #switch(123pt,65pt)
    #txt(110pt,150pt,"S0 S1")
  ]],
  [#block(height:178pt)[
    #txt(8pt,2pt,"(b) 单级4:1 MUX")
    #for i in range(4) [
      #let y=24pt + i * 31pt
      #txt(5pt,y + 6pt,str(i))
      #switch(49pt,y)
      #seg(91pt,y + 14pt,125pt,y + 14pt)
    ]
    #seg(125pt,38pt,125pt,131pt)
    #txt(92pt,150pt,"SA SB SC SD")
  ]])
#let fig712()=grid(columns:(1fr,1fr,1fr),column-gutter:5pt,
  [#block(height:166pt)[
    #txt(10pt,3pt,"(a) 电平冲突")
    #switch(54pt,25pt)
    #switch(54pt,75pt)
    #txt(8pt,143pt,"通路同时开启")
  ]],
  [#block(height:166pt)[
    #txt(10pt,3pt,"(b) 高阻态")
    #switch(54pt,25pt)
    #switch(54pt,75pt)
    #txt(8pt,143pt,"通路全部关闭")
  ]],
  [#block(height:166pt)[
    #txt(10pt,3pt,"(c) 电荷共享")
    #switch(54pt,25pt)
    #switch(54pt,75pt)
    #cap(46pt,114pt,s:"C")
    #txt(8pt,143pt,"存储电荷再分配")
  ]])
#let fig713()=grid(columns:(1fr,1fr),column-gutter:9pt,
  [#block(height:101pt)[
    #switch(40pt,31pt)
    #switch(99pt,31pt)
    #txt(4pt,5pt,"(a) 或门")
    #txt(154pt,42pt,"A+B")
  ]],
  [#block(height:101pt)[
    #switch(40pt,31pt)
    #switch(99pt,31pt)
    #txt(4pt,5pt,"(b) 与门")
    #txt(154pt,42pt,"AB")
  ]])
#let fig714()=html.frame(block(width:375pt,height:160pt)[
  #txt(5pt,5pt,"复合CMOS传输门、伪NMOS及静态NAND逻辑")
  #for i in range(3) [
    #switch(25pt,23pt + i * 43pt)
  ]
  #inverter(138pt,45pt)
  #seg(182pt,59pt,231pt,59pt)
  #place(top+left,dx:233pt,dy:43pt,rect(width:80pt,height:35pt,stroke:.8pt))
  #txt(245pt,53pt,"NAND")
  #seg(313pt,59pt,351pt,59pt)
  #txt(352pt,53pt,"F")
])
#let fig715()=html.frame(block(width:377pt,height:125pt)[
  #txt(6pt,8pt,"CMOS TG 等效RC")
  #switch(25pt,31pt)
  #seg(67pt,45pt,118pt,45pt)
  #place(top+left,dx:118pt,dy:38pt,rect(width:60pt,height:17pt,stroke:.65pt))
  #txt(125pt,40pt,"R_TG")
  #seg(178pt,45pt,265pt,45pt)
  #cap(202pt,66pt,s:"C1")
  #cap(264pt,66pt,s:"C2")
  #txt(19pt,99pt,"并联NMOS + PMOS的导通等效阻抗")
])
#let fig716()=grid(columns:(1fr,1fr),column-gutter:9pt,
  [#block(height:160pt)[
    #seg(28pt,140pt,165pt,140pt)
    #seg(28pt,140pt,28pt,20pt)
    #seg(37pt,119pt,151pt,52pt)
    #seg(37pt,49pt,151pt,118pt)
    #txt(34pt,7pt,"(a) 低→高")
  ]],
  [#block(height:160pt)[
    #seg(28pt,140pt,165pt,140pt)
    #seg(28pt,140pt,28pt,20pt)
    #seg(37pt,49pt,151pt,115pt)
    #seg(37pt,121pt,151pt,53pt)
    #txt(34pt,7pt,"(b) 高→低")
  ]])
#let fig717()=grid(columns:(1fr,1fr),column-gutter:10pt,
  [#block(height:135pt)[
    #txt(8pt,4pt,"(a) 关断")
    #switch(31pt,33pt)
    #cap(86pt,76pt,s:"C_ov")
  ]],
  [#block(height:135pt)[
    #txt(8pt,4pt,"(b) 导通")
    #switch(31pt,33pt)
    #cap(55pt,76pt,s:"1/2 C_g")
    #cap(114pt,76pt,s:"C_ov")
  ]])
