// Native vector circuits PDF269–276, printed 250–257.
// Editable Typst geometry; transistor source/drain labels and exact print
// coordinates need independent diagram-by-diagram acceptance.
#let line2(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,line(end:(x2 - x1,y2 - y1),stroke:.75pt))
#let label(x,y,t)=place(top+left,dx:x,dy:y,text(size:7pt)[#t])
#let capacitor(x,y,t:"")={
  line2(x,y-8pt,x,y)
  place(top+left,dx:x-6pt,dy:y,line(length:12pt,stroke:.8pt))
  place(top+left,dx:x-6pt,dy:y+5pt,line(length:12pt,stroke:.8pt))
  line2(x,y+5pt,x,y+18pt)
  if t!="" {label(x+9pt,y-1pt,t)}
}
#let resistor(x,y,name:"R")={
  place(top+left,dx:x,dy:y,rect(width:33pt,height:10pt,stroke:.75pt))
  label(x+6pt,y-12pt,name)
}
#let inverter(x,y)={
  line2(x,y-13pt,x,y+13pt)
  line2(x,y-13pt,x+31pt,y)
  line2(x,y+13pt,x+31pt,y)
  place(top+left,dx:x+33pt,dy:y-2pt,circle(radius:2pt,stroke:.8pt,fill:white))
}
#let tg(x,y) = {
  line2(x,y,x+17pt,y)
  place(top+left,dx:x+17pt,dy:y-12pt,rect(width:28pt,height:24pt,stroke:.75pt))
  line2(x+45pt,y,x+63pt,y)
  line2(x+31pt,y-23pt,x+31pt,y-12pt)
  line2(x+31pt,y+12pt,x+31pt,y+23pt)
  label(x+20pt,y-7pt,"TG")
}
#let nmos(x,y,p:false,name:"")={
  line2(x,y,x,y+28pt)
  line2(x-5pt,y,x-5pt,y+28pt)
  line2(x-27pt,y+14pt,x-5pt,y+14pt)
  if p {place(top+left,dx:x-7pt,dy:y+12pt,circle(radius:2pt,stroke:.7pt,fill:white))}
  if name!="" {label(x+5pt,y+7pt,name)}
}
#let fig718()=block(width:100%)[
  #grid(columns:(1fr,1fr),column-gutter:9pt,
    [#block(height:120pt)[
      #inverter(10pt,46pt)
      #line2(45pt,46pt,59pt,46pt)
      #tg(60pt,46pt)
      #line2(123pt,46pt,143pt,46pt)
      #inverter(144pt,46pt)
      #label(12pt,97pt,"(a) CMOS-TG-CMOS")
    ]],
    [#block(height:120pt)[
      #line2(11pt,45pt,29pt,45pt)
      #resistor(29pt,40pt,name:"Rinv")
      #line2(62pt,45pt,89pt,45pt)
      #resistor(89pt,40pt,name:"RTG")
      #line2(122pt,45pt,157pt,45pt)
      #capacitor(75pt,60pt,t:"Cinv")
      #capacitor(157pt,60pt,t:"Cload")
      #label(9pt,100pt,"(b) 有损耗传输门RC")
    ]]])
  #v(3pt)
  #align(center)[#block(height:103pt,width:270pt)[
    #resistor(24pt,19pt,name:"R1")
    #line2(57pt,24pt,85pt,24pt)
    #resistor(85pt,19pt,name:"R2")
    #line2(118pt,24pt,162pt,24pt)
    #capacitor(72pt,46pt,t:"C1")
    #capacitor(154pt,46pt,t:"C2")
    #label(3pt,88pt,"(c) 两阶Elmore RC梯形")
  ]]
]
#let mux-rc(count:3) = block(width:100%)[
  #grid(columns:(1fr,1fr),column-gutter:9pt,
    [#block(height:120pt)[
      #inverter(4pt,45pt)
      #for i in range(count) [
        #let x=44pt+i*46pt
        #tg(x,45pt)
      ]
      #label(6pt,101pt,"MUX"+str(if count==3 {1} else {2}))
    ]],
    [#block(height:120pt)[
      #for i in range(count+1) [
        #let x=8pt+i*44pt
        #resistor(x,42pt,name:if i==0 {"Rinv"} else {"RTG"})
        #capacitor(x+25pt,63pt,t:"C"+str(i+1))
      ]
    ]])
]
#let fig719(scale:1)=block(width:100%)[
  #grid(columns:(1fr,1fr),column-gutter:8pt,
    [#block(height:115pt)[
      #label(2pt,37pt,"A")
      #inverter(33pt,48pt)
      #line2(68pt,48pt,85pt,48pt)
      #tg(85pt,48pt)
      #label(87pt,5pt,"sel")
      #label(144pt,30pt,"OUT")
      #label(25pt,103pt,if scale==1 {"TG : W"} else {"TG : 3W"})
    ]],
    [#block(height:115pt)[
      #resistor(27pt,30pt,name:"R")
      #line2(61pt,35pt,81pt,35pt)
      #resistor(81pt,30pt,name:if scale==1 {"R"} else {"R/3"})
      #capacitor(137pt,59pt,t:"Cload")
      #label(10pt,100pt,"等效传输门电阻模型")
    ]])
]
#let d-latch(hold:false)=block(height:143pt)[
  #line2(4pt,42pt,32pt,42pt)
  #tg(32pt,42pt)
  #line2(95pt,42pt,120pt,42pt)
  #inverter(120pt,42pt)
  #line2(155pt,42pt,175pt,42pt)
  #inverter(176pt,42pt)
  #line2(211pt,42pt,241pt,42pt)
  #capacitor(245pt,62pt,t:"CQ")
  #label(6pt,17pt,"D")
  #label(247pt,25pt,"Q")
  #label(55pt,1pt,"CLK")
  #if hold [
    #line2(208pt,42pt,208pt,105pt)
    #line2(208pt,105pt,94pt,105pt)
    #tg(94pt,105pt)
    #line2(94pt,105pt,94pt,73pt)
    #label(131pt,123pt,"TG2 反相时钟闭环保持")
  ]
]
#let fig721()=grid(columns:(1fr,1fr),column-gutter:4pt,
  [#block(height:125pt)[#tg(16pt,35pt) #label(10pt,92pt,"(a) NMOS / TG")]],
  [#block(height:125pt)[#d-latch()]])
#let fig722()=d-latch(hold:true)
#let fig723()=block(height:140pt)[#d-latch(hold:true) #label(5pt,131pt,"静态反馈无节点竞争的D锁存器示意")]
#let fig724()=block(height:169pt)[
  #label(13pt,4pt,"Master latch")
  #label(200pt,4pt,"Slave latch")
  #tg(17pt,49pt)
  #inverter(87pt,49pt)
  #line2(123pt,49pt,186pt,49pt)
  #tg(186pt,49pt)
  #inverter(256pt,49pt)
  #line2(290pt,49pt,348pt,49pt)
  #label(18pt,103pt,"CLK低时第一级透明")
  #label(186pt,103pt,"CLK高时第二级透明")
  #label(297pt,19pt,"Q")
  #line2(66pt,72pt,66pt,86pt)
  #line2(236pt,72pt,236pt,86pt)
  #label(41pt,128pt,"主从D触发器：正沿触发")
]
#let dynamic-gate(kind:"dynamic")=block(height:126pt)[
  #line2(146pt,8pt,146pt,24pt)
  #nmos(146pt,24pt,p:true,name:"Mp")
  #line2(146pt,52pt,146pt,63pt)
  #nmos(146pt,63pt,name:"NMOS")
  #line2(146pt,91pt,146pt,99pt)
  #nmos(146pt,99pt,name:"Mn")
  #line2(146pt,127pt,146pt,135pt)
  #line2(146pt,55pt,219pt,55pt)
  #label(221pt,48pt,"OUT")
  #label(33pt,41pt,"CLK")
  #label(32pt,80pt,kind)
]
#let fig725()=grid(columns:(1fr,1fr),column-gutter:7pt,row-gutter:7pt,
  [#block(height:135pt)[#dynamic-gate(kind:"(a) 静态CMOS")]],
  [#block(height:135pt)[#dynamic-gate(kind:"(b) 伪NMOS")]],
  [#block(height:135pt)[#dynamic-gate(kind:"(c) 两相时钟动态门")]],
  [#block(height:135pt)[#dynamic-gate(kind:"(d) 单时钟动态门")]])
#let fig726()=dynamic-gate(kind:"通用动态NMOS网络")
#let fig727()=grid(columns:(1fr,1fr),column-gutter:8pt,
  [#block(height:143pt)[
    #dynamic-gate(kind:"(a) 动态门直接级联")
  ]],
  [#block(height:143pt)[
    #dynamic-gate(kind:"(b) Domino")
    #inverter(227pt,54pt)
    #label(221pt,110pt,"动态级 + 静态反相器")
  ]])
