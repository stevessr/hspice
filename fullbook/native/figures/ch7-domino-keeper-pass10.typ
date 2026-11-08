// Editable domino, dual-rail and postcharge teaching schematics; source PDF277-284.
// Geometry and device widths remain draft until full-page source comparison.
#import "ch7-latch-domino-pass9.typ": w, txt, tg, inv, nand, cap, ground
#let blockgate(x,y,name:"NMOS逻辑")={
  place(top+left,dx:x,dy:y,rect(width:56pt,height:43pt,radius:3pt,stroke:.8pt))
  txt(x+4pt,y+13pt,name)
}
#let domino(x,y,label:"Y")={
  tg(x+10pt,y+7pt,label:"预充")
  w(x+28pt,y+23pt,x+28pt,y+43pt)
  blockgate(x,y+43pt)
  w(x+28pt,y+86pt,x+28pt,y+101pt)
  tg(x+10pt,y+116pt,label:"求值")
  w(x+28pt,y+41pt,x+65pt,y+41pt)
  inv(x+66pt,y+41pt)
  txt(x+103pt,y+32pt,label)
}
#let fig727()=grid(columns:(1fr,1fr),column-gutter:10pt,
  [#html.frame(block(width:188pt,height:168pt)[
    #domino(10pt,0pt,label:"OUT1")
    #w(126pt,41pt,157pt,41pt)
    #txt(11pt,151pt,"(a) 不应直接接动态输入")
  ])],
  [#html.frame(block(width:188pt,height:168pt)[
    #domino(10pt,0pt,label:"OUT2")
    #w(126pt,41pt,157pt,41pt)
    #txt(7pt,151pt,"(b) 通过静态反相器隔离")
  ])])
#let fig728()=html.frame(block(width:387pt,height:167pt)[
  #for i in (0,1,2) [
    #let x=11pt+i*122pt
    #domino(x,0pt,label:"Y"+str(i+1))
    #if i<2 [#w(x+108pt,41pt,x+122pt,41pt)]
  ]
  #txt(21pt,146pt,"CLK=0：Y1、Y2、Y3预充为高；CLK=1：求值沿链传播")
])
#let fig729()=grid(columns:(1fr,1fr),column-gutter:8pt,
  [#html.frame(block(width:184pt,height:170pt)[
    #txt(12pt,8pt,"(a) 静态 NOR2")
    #tg(57pt,26pt,label:"PMOS")
    #tg(57pt,69pt,label:"PMOS")
    #w(75pt,84pt,75pt,95pt)
    #blockgate(46pt,96pt,name:"nMOS 并联")
    #w(75pt,139pt,75pt,149pt)
    #txt(104pt,77pt,"OUT")
  ])],
  [#html.frame(block(width:184pt,height:170pt)[
    #txt(12pt,8pt,"(b) 动态 NOR2")
    #tg(56pt,26pt,label:"CLK")
    #w(74pt,41pt,74pt,67pt)
    #blockgate(47pt,68pt,name:"nMOS 并联")
    #w(74pt,111pt,74pt,121pt)
    #tg(56pt,136pt,label:"CLK")
    #txt(107pt,77pt,"OUT")
  ])])
#let fig730()=html.frame(block(width:347pt,height:174pt)[
  #tg(131pt,16pt,label:"CLK")
  #w(149pt,31pt,149pt,64pt)
  #w(149pt,64pt,239pt,64pt)
  #cap(229pt,80pt,s:"C_out")
  #w(149pt,64pt,149pt,83pt)
  #blockgate(121pt,83pt,name:"nMOS栈")
  #w(149pt,126pt,149pt,144pt)
  #tg(131pt,157pt,label:"CLK")
  #txt(160pt,108pt,"X")
  #cap(189pt,116pt,s:"C_X")
  #txt(7pt,64pt,"IN")
  #txt(240pt,53pt,"OUT")
])
#let keeper-panel(double:false)=html.frame(block(width:180pt,height:168pt)[
  #tg(73pt,18pt,label:"预充")
  #w(91pt,34pt,91pt,65pt)
  #blockgate(63pt,65pt,name:"nMOS栈")
  #w(91pt,108pt,91pt,124pt)
  #tg(73pt,139pt,label:"CLK")
  #w(91pt,62pt,141pt,62pt)
  #inv(141pt,62pt)
  #w(141pt,62pt,141pt,24pt)
  #tg(121pt,18pt,label:if double {"长管+短管"} else {"弱PMOS"})
  #w(121pt,33pt,91pt,33pt)
  #txt(29pt,154pt,if double {"(b) 分离驱动/强度"} else {"(a) 弱保持器"})
])
#let fig731()=grid(columns:(1fr,1fr),column-gutter:10pt,
  [#keeper-panel()], [#keeper-panel(double:true)])
#let fig732()=html.frame(block(width:381pt,height:162pt)[
  #for i in (0,1) [
    #let x=49pt+i*176pt
    #tg(x+12pt,17pt,label:"CLK")
    #w(x+30pt,32pt,x+30pt,65pt)
    #blockgate(x,65pt,name:if i==0 {"F逻辑块"} else {"F̅逻辑块"})
    #w(x+30pt,108pt,x+30pt,133pt)
    #w(x+30pt,63pt,x+94pt,63pt)
    #inv(x+98pt,63pt)
  ]
  #txt(10pt,137pt,"互补输出 OUT / OUT̅")
])
#let fig733()=html.frame(block(width:373pt,height:170pt)[
  #txt(6pt,2pt,"双轨 AND / NAND 功能")
  #fig732()
  #txt(13pt,144pt,"F=AB；F̅=(AB)̅")
])
#let fig734()=html.frame(block(width:365pt,height:176pt)[
  #fig732()
  #txt(12pt,142pt,"两侧分别添加弱PMOS保持器")
  #tg(15pt,22pt,label:"keeper")
  #tg(304pt,22pt,label:"keeper")
])
#let fig735()=grid(columns:(1fr,1fr),column-gutter:9pt,
  [#html.frame(block(width:180pt,height:151pt)[
    #txt(4pt,4pt,"(a) 预充结构")
    #tg(62pt,25pt,label:"CLK")
    #w(80pt,40pt,80pt,67pt)
    #blockgate(50pt,68pt)
    #w(80pt,111pt,80pt,122pt)
    #tg(62pt,137pt,label:"CLK")
  ])],
  [#html.frame(block(width:180pt,height:151pt)[
    #txt(4pt,4pt,"(b) 后充/自复位")
    #tg(62pt,25pt,label:"反馈")
    #w(80pt,40pt,80pt,67pt)
    #blockgate(50pt,68pt)
    #w(80pt,67pt,153pt,67pt)
    #inv(121pt,99pt)
    #w(153pt,67pt,153pt,99pt)
    #w(121pt,99pt,40pt,99pt)
    #w(40pt,99pt,40pt,24pt)
    #w(40pt,24pt,62pt,24pt)
  ])])
