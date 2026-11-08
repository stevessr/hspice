// Source PDF269–276, printed 250–257. Editable native transistor, RC,
// latch and domino-gate teaching diagrams. Source scans must be reviewed for
// gate/source/drain and feedback connections before strict 1:1 signoff.
#import "ch7-transmission-mux-native.typ": pass-symbol
#let wire(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,line(end:(x2 - x1,y2 - y1),stroke:.85pt))
#let circle-node(x,y)=place(top+left,dx:x,dy:y,circle(radius:1.4pt,fill:black))
#let cap(x,y,title:"")={
  wire(x,y,x,y+7pt)
  place(top+left,dx:x - 6pt,dy:y + 7pt,line(length:12pt,stroke:.85pt))
  place(top+left,dx:x - 6pt,dy:y + 12pt,line(length:12pt,stroke:.85pt))
  wire(x,y+12pt,x,y+29pt)
  if title!="" {place(top+left,dx:x + 7pt,dy:y + 15pt,text(size:7pt)[#title])}
}
#let resistor(x,y,vertical:false,title:"R")={
  if vertical {
    place(top+left,dx:x,dy:y,rect(width:8pt,height:23pt,stroke:.75pt))
    place(top+left,dx:x + 10pt,dy:y + 7pt,text(size:7pt)[#title])
  } else {
    place(top+left,dx:x,dy:y,rect(width:25pt,height:8pt,stroke:.75pt))
    place(top+left,dx:x + 5pt,dy:y - 10pt,text(size:7pt)[#title])
  }
}
#let inverter(x,y,title:"")={
  wire(x,y,x,y+32pt)
  wire(x,y,x+39pt,y+16pt)
  wire(x,y+32pt,x+39pt,y+16pt)
  place(top+left,dx:x+41pt,dy:y+14pt,circle(radius:2pt,stroke:.7pt,fill:white))
  if title!="" {place(top+left,dx:x+9pt,dy:y+34pt,text(size:7pt)[#title])}
}
#let mos(x,y,p:false,title:"")={
  wire(x,y,x,y+26pt)
  wire(x - 4pt,y,x - 4pt,y+26pt)
  wire(x - 24pt,y+13pt,x - 4pt,y+13pt)
  if p {place(top+left,dx:x - 7pt,dy:y+11pt,circle(radius:2pt,stroke:.7pt,fill:white))}
  if title!="" {place(top+left,dx:x+6pt,dy:y+9pt,text(size:7pt)[#title])}
}
#let fig718()=block(width:396pt)[
  #box(height:115pt)[
    #place(top+left,dx:11pt,dy:9pt,text(size:7pt)[（a）传输门和两级反相器]))
    #inverter(89pt,35pt,title:"2W/W")
    #wire(132pt,51pt,171pt,51pt)
    #pass-symbol(174pt,36pt,size:29pt)
    #wire(203pt,51pt,255pt,51pt)
    #inverter(256pt,35pt,title:"2W/W")
    #wire(299pt,51pt,355pt,51pt)
    #place(top+left,dx:174pt,dy:14pt,text(size:7pt)[CLK]))
  ]
  #box(height:90pt)[
    #place(top+left,dx:11pt,dy:0pt,text(size:7pt)[（b）等效RC网络]))
    #resistor(93pt,29pt,title:"R_inv")
    #wire(118pt,33pt,184pt,33pt)
    #resistor(184pt,29pt,title:"R_TG")
    #wire(209pt,33pt,331pt,33pt)
    #for (idx,x) in ((0,143pt),(1,225pt),(2,306pt)) [
      #cap(x,37pt,title:("C_inv","C_TG","C_load").at(idx))
    ]
  ]
  #box(height:84pt)[
    #place(top+left,dx:11pt,dy:0pt,text(size:7pt)[（c）二级RC阶梯]))
    #resistor(103pt,28pt,title:"R_1")
    #wire(128pt,32pt,206pt,32pt)
    #resistor(206pt,28pt,title:"R_2")
    #wire(231pt,32pt,323pt,32pt)
    #cap(164pt,35pt,title:"C_1")
    #cap(303pt,35pt,title:"C_2")
  ]
]
#let fig-mux7_4()=grid(columns:(1fr,1fr),column-gutter:9pt,
  [#block(height:180pt)[
    #place(top+left,dx:6pt,dy:0pt,text(size:8pt)[MUX1 · 两级]))
    #for i in (0,1,2,3) [
      #let yy=16pt+i*30pt
      #pass-symbol(46pt,yy,size:23pt)
      #wire(15pt,yy+11pt,32pt,yy+11pt)
      #wire(69pt,yy+11pt,116pt,yy+11pt)
    ]
    #pass-symbol(121pt,54pt,size:27pt)
    #wire(148pt,67pt,181pt,67pt)
    #place(top+left,dx:13pt,dy:152pt,text(size:7pt)[R_inv, R_TG, R_TG]))
  ]],
  [#block(height:180pt)[
    #place(top+left,dx:6pt,dy:0pt,text(size:8pt)[MUX2 · 单级]))
    #for i in (0,1,2,3) [
      #let yy=16pt+i*30pt
      #pass-symbol(46pt,yy,size:23pt)
      #wire(15pt,yy+11pt,32pt,yy+11pt)
      #wire(69pt,yy+11pt,124pt,yy+11pt)
    ]
    #wire(124pt,27pt,124pt,117pt)
    #wire(124pt,72pt,180pt,72pt)
    #place(top+left,dx:13pt,dy:152pt,text(size:7pt)[R_inv, R_TG]))
  ]])
#let fig719()=grid(columns:(1fr,1fr),column-gutter:9pt,
  [#block(height:126pt)[
    #inverter(51pt,24pt,title:"2W/W")
    #wire(94pt,40pt,121pt,40pt)
    #pass-symbol(121pt,25pt,size:30pt)
    #wire(151pt,40pt,179pt,40pt)
    #place(top+left,dx:15pt,dy:0pt,text(size:7pt)[（a）单位传输门]))
    #place(top+left,dx:54pt,dy:97pt,text(size:7pt)[$R + R_("TG")$]))
  ]],
  [#block(height:126pt)[
    #resistor(57pt,37pt,title:"R")
    #wire(82pt,41pt,124pt,41pt)
    #resistor(124pt,37pt,title:"R")
    #wire(149pt,41pt,179pt,41pt)
    #cap(160pt,47pt,title:"C_load")
    #place(top+left,dx:15pt,dy:0pt,text(size:7pt)[（b）二阶RC模型]))
  ]])
#let fig720()=grid(columns:(1fr,1fr),column-gutter:9pt,
  [#block(height:130pt)[
    #inverter(46pt,20pt,title:"2W/W")
    #wire(89pt,36pt,109pt,36pt)
    #pass-symbol(109pt,19pt,size:34pt)
    #wire(143pt,36pt,175pt,36pt)
    #place(top+left,dx:14pt,dy:97pt,text(size:7pt)[放大3X的传输门]))
  ]],
  [#block(height:130pt)[
    #resistor(35pt,30pt,title:"R")
    #wire(60pt,34pt,97pt,34pt)
    #resistor(97pt,30pt,title:"R/3")
    #wire(122pt,34pt,174pt,34pt)
    #cap(145pt,40pt,title:"C_load")
    #place(top+left,dx:14pt,dy:97pt,text(size:7pt)[等效RC]))
  ]])
#let fig721()=grid(columns:(1fr,1fr,1fr),column-gutter:4pt,
  [#block(height:120pt)[
    #mos(57pt,28pt)
    #wire(20pt,42pt,33pt,42pt)
    #cap(94pt,45pt,title:"C")
    #place(top+left,dx:12pt,dy:104pt,text(size:7pt)[（a）NMOS动态存储]))
  ]],
  [#block(height:120pt)[
    #pass-symbol(54pt,34pt,size:27pt)
    #wire(21pt,47pt,40pt,47pt)
    #cap(94pt,46pt,title:"C")
    #place(top+left,dx:12pt,dy:104pt,text(size:7pt)[（b）CMOS TG]))
  ]],
  [#block(height:120pt)[
    #pass-symbol(32pt,34pt,size:27pt)
    #wire(59pt,47pt,85pt,47pt)
    #inverter(86pt,32pt)
    #cap(74pt,50pt,title:"C")
    #place(top+left,dx:12pt,dy:104pt,text(size:7pt)[（c）加反相器输出]))
  ]])
#let fig722()=html.frame(block(width:390pt,height:171pt)[
  #place(top+left,dx:4pt,dy:4pt,text(size:7pt)[带双向反馈的静态保持D锁存器]))
  #wire(8pt,62pt,52pt,62pt)
  #pass-symbol(54pt,47pt,size:29pt)
  #wire(83pt,62pt,126pt,62pt)
  #inverter(127pt,46pt,title:"INV1")
  #wire(170pt,62pt,217pt,62pt)
  #inverter(218pt,46pt,title:"INV2")
  #wire(260pt,62pt,347pt,62pt)
  #wire(304pt,62pt,304pt,124pt)
  #wire(304pt,124pt,178pt,124pt)
  #pass-symbol(146pt,109pt,size:30pt)
  #wire(132pt,124pt,103pt,124pt)
  #wire(103pt,124pt,103pt,62pt)
  #place(top+left,dx:54pt,dy:21pt,text(size:7pt)[TG1]))
  #place(top+left,dx:144pt,dy:140pt,text(size:7pt)[TG2]))
  #place(top+left,dx:10pt,dy:48pt,text(size:8pt)[$D$]))
  #place(top+left,dx:347pt,dy:47pt,text(size:8pt)[$Q$]))
  #place(top+left,dx:54pt,dy:11pt,text(size:7pt)[CLK]))
  #place(top+left,dx:142pt,dy:91pt,text(size:7pt)[$overline("CLK")$]))
])
#let fig723()=html.frame(block(width:381pt,height:182pt)[
  #place(top+left,dx:4pt,dy:3pt,text(size:7pt)[没有反馈冲突的CMOS D锁存器]))
  #pass-symbol(44pt,61pt,size:29pt)
  #wire(15pt,76pt,30pt,76pt)
  #wire(73pt,76pt,122pt,76pt)
  #inverter(122pt,60pt)
  #wire(165pt,76pt,210pt,76pt)
  #inverter(210pt,60pt)
  #wire(253pt,76pt,319pt,76pt)
  #wire(289pt,76pt,289pt,25pt)
  #wire(289pt,25pt,122pt,25pt)
  #mos(122pt,8pt,p:true,title:"M1")
  #mos(122pt,121pt,title:"M2")
  #wire(122pt,147pt,122pt,165pt)
  #place(top+left,dx:12pt,dy:52pt,text(size:8pt)[$D$]))
  #place(top+left,dx:322pt,dy:65pt,text(size:8pt)[$Q$]))
  #place(top+left,dx:41pt,dy:37pt,text(size:7pt)[CLK]))
])
#let fig724()=html.frame(block(width:385pt,height:160pt)[
  #place(top+left,dx:6pt,dy:6pt,text(size:7pt)[主从结构 · 正沿触发D型触发器]))
  #wire(9pt,68pt,39pt,68pt)
  #pass-symbol(42pt,53pt,size:30pt)
  #wire(72pt,68pt,129pt,68pt)
  #inverter(130pt,52pt)
  #wire(173pt,68pt,204pt,68pt)
  #pass-symbol(207pt,53pt,size:30pt)
  #wire(237pt,68pt,289pt,68pt)
  #inverter(291pt,52pt)
  #wire(334pt,68pt,368pt,68pt)
  #place(top+left,dx:40pt,dy:25pt,text(size:7pt)[TG1]))
  #place(top+left,dx:207pt,dy:25pt,text(size:7pt)[TG2]))
  #place(top+left,dx:44pt,dy:103pt,text(size:7pt)[CLK低：主透明]))
  #place(top+left,dx:207pt,dy:103pt,text(size:7pt)[CLK高：从透明]))
])
#let fig725()=grid(columns:(1fr,1fr,1fr,1fr),column-gutter:3pt,
  [#block(height:168pt)[
    #mos(49pt,13pt,p:true,title:"P")
    #mos(49pt,81pt,title:"N")
    #wire(49pt,39pt,49pt,81pt)
    #place(top+left,dx:6pt,dy:151pt,text(size:7pt)[（a）静态CMOS]))
  ]],
  [#block(height:168pt)[
    #mos(49pt,13pt,p:true,title:"P")
    #mos(49pt,81pt,title:"N")
    #wire(49pt,39pt,49pt,81pt)
    #place(top+left,dx:6pt,dy:151pt,text(size:7pt)[（b）伪NMOS]))
  ]],
  [#block(height:168pt)[
    #mos(49pt,13pt,p:true,title:"MP")
    #mos(49pt,71pt,title:"MN")
    #wire(49pt,39pt,49pt,71pt)
    #place(top+left,dx:5pt,dy:151pt,text(size:7pt)[（c）双时钟动态]))
  ]],
  [#block(height:168pt)[
    #mos(49pt,13pt,p:true,title:"MP")
    #mos(49pt,71pt,title:"MN")
    #wire(49pt,39pt,49pt,71pt)
    #place(top+left,dx:6pt,dy:151pt,text(size:7pt)[（d）单时钟动态]))
  ]])
#let fig726()=html.frame(block(width:353pt,height:174pt)[
  #place(top+left,dx:5pt,dy:5pt,text(size:8pt)[动态门的通用结构]))
  #mos(164pt,25pt,p:true,title:"MP")
  #wire(164pt,51pt,164pt,78pt)
  #place(top+left,dx:131pt,dy:78pt,rect(width:69pt,height:43pt,stroke:.8pt))
  #place(top+left,dx:139pt,dy:92pt,text(size:7pt)[NMOS]))
  #place(top+left,dx:139pt,dy:106pt,text(size:7pt)[逻辑块]))
  #wire(164pt,121pt,164pt,127pt)
  #mos(164pt,128pt,title:"MN")
  #wire(164pt,154pt,164pt,163pt)
  #wire(164pt,71pt,268pt,71pt)
  #cap(265pt,84pt,title:"C_L")
  #place(top+left,dx:268pt,dy:60pt,text(size:8pt)[OUT]))
  #place(top+left,dx:52pt,dy:33pt,text(size:8pt)[CLK]))
  #place(top+left,dx:52pt,dy:135pt,text(size:8pt)[CLK]))
])
#let fig727()=grid(columns:(1fr,1fr),column-gutter:9pt,
  [#block(height:153pt)[
    #place(top+left,dx:5pt,dy:4pt,text(size:7pt)[（a）动态门直接串联]))
    #place(top+left,dx:18pt,dy:36pt,rect(width:60pt,height:45pt,stroke:.8pt))
    #place(top+left,dx:24pt,dy:51pt,text(size:8pt)[动态1]))
    #wire(78pt,58pt,108pt,58pt)
    #place(top+left,dx:110pt,dy:36pt,rect(width:60pt,height:45pt,stroke:.8pt))
    #place(top+left,dx:116pt,dy:51pt,text(size:8pt)[动态2]))
    #place(top+left,dx:12pt,dy:110pt,text(size:7pt)[预充时第二级会误放电]))
  ]],
  [#block(height:153pt)[
    #place(top+left,dx:5pt,dy:4pt,text(size:7pt)[（b）多米诺级]))
    #place(top+left,dx:11pt,dy:36pt,rect(width:53pt,height:45pt,stroke:.8pt))
    #place(top+left,dx:16pt,dy:51pt,text(size:8pt)[动态1]))
    #wire(64pt,58pt,72pt,58pt)
    #inverter(73pt,42pt)
    #wire(115pt,58pt,125pt,58pt)
    #place(top+left,dx:125pt,dy:36pt,rect(width:53pt,height:45pt,stroke:.8pt))
    #place(top+left,dx:129pt,dy:51pt,text(size:8pt)[动态2]))
    #place(top+left,dx:12pt,dy:110pt,text(size:7pt)[静态反相器隔离预充]))
  ]])
