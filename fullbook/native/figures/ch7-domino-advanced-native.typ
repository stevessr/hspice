// Chapter 7 PDF277–284: scan-guided, fully editable Typst diagram primitives.
// Engineering redraw stage. Original source electrical junctions, line weights,
// labels, and page geometry remain pending per-figure strict 1:1 signoff.
#let w(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,line(end:(x2 - x1,y2 - y1),stroke:.78pt))
#let txt(x,y,s)=place(top+left,dx:x,dy:y,text(size:7.4pt)[#s])
#let dot(x,y)=place(top+left,dx:x,dy:y,circle(radius:1.7pt,fill:black))
#let inv(x,y)={
  w(x,y - 12pt,x,y + 12pt)
  w(x,y - 12pt,x + 28pt,y)
  w(x,y + 12pt,x + 28pt,y)
  place(top+left,dx:x + 30pt,dy:y - 2pt,circle(radius:2pt,stroke:.7pt,fill:white))
}
#let mos(x,y,p:false)={
  w(x,y,x,y + 25pt)
  w(x - 4pt,y,x - 4pt,y + 25pt)
  w(x - 22pt,y + 12pt,x - 4pt,y + 12pt)
  if p {place(top+left,dx:x - 7pt,dy:y + 10pt,circle(radius:2pt,stroke:.75pt,fill:white))}
}
#let ground(x,y)={
  w(x,y,x,y+7pt)
  w(x - 7pt,y + 7pt,x + 7pt,y + 7pt)
  w(x - 4pt,y + 10pt,x + 4pt,y + 10pt)
}
#let cap(x,y,s:"")={
  w(x,y,x + 15pt,y)
  w(x,y+5pt,x + 15pt,y+5pt)
  if s!="" {txt(x + 17pt,y - 4pt,s)}
}
#let dynamic-cell(x,y,with_inv:false,outputs:"")={
  w(x + 35pt,y + 5pt,x + 35pt,y + 17pt)
  mos(x + 35pt,y + 17pt,p:true)
  w(x + 35pt,y + 42pt,x + 35pt,y + 52pt)
  place(top+left,dx:x + 9pt,dy:y + 52pt,rect(width:52pt,height:38pt,stroke:.75pt))
  txt(x + 17pt,y + 65pt,"NMOS")
  w(x + 35pt,y + 90pt,x + 35pt,y + 99pt)
  mos(x + 35pt,y + 99pt)
  ground(x + 35pt,y + 124pt)
  w(x + 35pt,y + 49pt,x + 82pt,y + 49pt)
  if with_inv {
    inv(x + 82pt,y + 49pt)
    w(x + 114pt,y + 49pt,x + 127pt,y + 49pt)
  }
  txt(x + 2pt,y + 4pt,"CLK")
  if outputs!="" {txt(x + 88pt,y + 15pt,outputs)}
}
#let fig727()=grid(columns:(1fr,1fr),column-gutter:6pt,
  [#html.frame(block(width:187pt,height:148pt)[
    #dynamic-cell(4pt,4pt)
    #w(86pt,53pt,126pt,53pt)
    #txt(96pt,27pt,"错误连接")
    #txt(4pt,137pt,"(a) 动态门直连")
  ])],
  [#html.frame(block(width:187pt,height:148pt)[
    #dynamic-cell(4pt,4pt,with_inv:true)
    #txt(6pt,137pt,"(b) 加静态反相器")
  ])])
#let fig728()=html.frame(block(width:392pt,height:161pt)[
  #for i in range(3) [
    #let x=5pt + i * 128pt
    #dynamic-cell(x,5pt,with_inv:true,outputs:("F1","F2","F3").at(i))
    #txt(x+9pt,145pt,"第"+str(i+1)+"级")
  ]
  #w(10pt,3pt,365pt,3pt)
  #txt(174pt,1pt,"CLK")
])
#let fig-example77()=html.frame(block(width:390pt,height:153pt)[
  #txt(10pt,4pt,"X=a⊕b；X̅=a⊙b；Sum=c⊕X")
  #for i in range(3) [
    #let x=27pt+i*126pt
    #dynamic-cell(x,22pt,with_inv:true,outputs:("X","X̅","Sum").at(i))
  ]
])
#let fig729()=grid(columns:(1fr,1fr),column-gutter:7pt,
  [#html.frame(block(width:186pt,height:165pt)[
    #txt(8pt,2pt,"(a) 静态NOR2")
    #w(87pt,18pt,87pt,35pt)
    #mos(87pt,35pt,p:true)
    #w(87pt,60pt,87pt,66pt)
    #mos(87pt,66pt,p:true)
    #w(87pt,91pt,87pt,99pt)
    #mos(87pt,99pt)
    #ground(87pt,124pt)
    #w(87pt,93pt,150pt,93pt)
    #txt(9pt,50pt,"A / B")
    #txt(151pt,86pt,"OUT")
    #txt(15pt,147pt,"LE=5/3")
  ])],
  [#html.frame(block(width:186pt,height:165pt)[
    #txt(8pt,2pt,"(b) 动态NOR2")
    #dynamic-cell(13pt,10pt,with_inv:true,outputs:"LE=2/3")
    #txt(12pt,147pt,"动态级含输出反相器")
  ])])
#let fig730()=html.frame(block(width:363pt,height:130pt)[
  #dynamic-cell(41pt,4pt,with_inv:true,outputs:"OUT")
  #w(75pt,92pt,176pt,92pt)
  #txt(183pt,79pt,"X:内部动态节点")
  #w(176pt,92pt,176pt,110pt)
  #cap(168pt,110pt,s:"Cx")
  #w(76pt,48pt,254pt,48pt)
  #cap(242pt,62pt,s:"Cout")
  #txt(279pt,42pt,"高阻输出")
])
#let keeper-panel(two:false)=html.frame(block(width:180pt,height:158pt)[
  #dynamic-cell(17pt,6pt,with_inv:true)
  #w(52pt,51pt,166pt,51pt)
  #w(158pt,51pt,158pt,10pt)
  #if two [
    #mos(158pt,11pt,p:true)
    #mos(158pt,37pt,p:true)
  ] else [
    #mos(158pt,13pt,p:true)
  ]
  #txt(8pt,145pt,if two {"(b) 串联弱保持器"} else {"(a) 弱PMOS反馈"})
])
#let fig731()=grid(columns:(1fr,1fr),column-gutter:8pt,
  [#keeper-panel()], [#keeper-panel(two:true)])
#let fig-example78()=html.frame(block(width:345pt,height:176pt)[
  #dynamic-cell(45pt,3pt,with_inv:true,outputs:"F")
  #txt(6pt,43pt,"A")
  #txt(6pt,66pt,"B")
  #txt(6pt,88pt,"C")
  #txt(160pt,42pt,"X")
  #txt(160pt,80pt,"Y")
  #w(81pt,87pt,170pt,87pt)
  #w(170pt,87pt,170pt,122pt)
  #cap(162pt,122pt,s:"Cx")
])
#let fig732()=html.frame(block(width:373pt,height:155pt)[
  #w(85pt,7pt,85pt,23pt)
  #w(280pt,7pt,280pt,23pt)
  #mos(85pt,23pt,p:true)
  #mos(280pt,23pt,p:true)
  #w(85pt,48pt,85pt,65pt)
  #w(280pt,48pt,280pt,65pt)
  #place(top+left,dx:52pt,dy:65pt,rect(width:68pt,height:45pt,stroke:.75pt))
  #place(top+left,dx:245pt,dy:65pt,rect(width:68pt,height:45pt,stroke:.75pt))
  #txt(73pt,79pt,"F")
  #txt(265pt,79pt,"F̅")
  #w(85pt,110pt,85pt,124pt)
  #w(280pt,110pt,280pt,124pt)
  #w(85pt,124pt,280pt,124pt)
  #mos(185pt,124pt)
  #txt(14pt,40pt,"CLK")
  #txt(311pt,41pt,"OUT")
])
#let fig733()=html.frame(block(width:381pt,height:155pt)[
  #fig732()
  #txt(10pt,143pt,"与/与非两条互补轨：AND 与 NAND")
])
#let fig734()=html.frame(block(width:381pt,height:164pt)[
  #fig732()
  #w(84pt,51pt,192pt,51pt)
  #w(192pt,51pt,279pt,51pt)
  #txt(123pt,7pt,"交叉耦合保持器")
  #txt(8pt,151pt,"双轨动态门增加交叉耦合弱PMOS")
])
#let fig735()=grid(columns:(1fr,1fr),column-gutter:8pt,
  [#html.frame(block(width:181pt,height:155pt)[
    #dynamic-cell(28pt,5pt)
    #txt(7pt,146pt,"(a) 常规预充")
  ])],
  [#html.frame(block(width:181pt,height:155pt)[
    #dynamic-cell(24pt,5pt)
    #w(70pt,53pt,166pt,53pt)
    #place(top+left,dx:92pt,dy:15pt,rect(width:54pt,height:24pt,stroke:.8pt))
    #txt(99pt,21pt,"延迟链")
    #w(146pt,39pt,146pt,53pt)
    #txt(7pt,146pt,"(b) 自复位/后充")
  ])])
