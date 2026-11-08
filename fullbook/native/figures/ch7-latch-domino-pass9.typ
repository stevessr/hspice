// SOURCE PDF269–276 / printed 250–257.
// All components are editable Typst strokes and labels, not scans.
// Network/figure fidelity remains provisional until line-by-line comparison.
#let w(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,line(end:(x2 - x1,y2 - y1),stroke:.8pt))
#let txt(x,y,s)=place(top+left,dx:x,dy:y,text(size:7.5pt)[#s])
#let ground(x,y)={
  w(x,y,x,y + 5pt)
  w(x - 8pt,y + 5pt,x + 8pt,y + 5pt)
  w(x - 5pt,y + 8pt,x + 5pt,y + 8pt)
}
#let cap(x,y,s:"")={
  w(x,y,x + 15pt,y)
  w(x,y + 5pt,x + 15pt,y + 5pt)
  if s!="" {txt(x + 17pt,y - 3pt,s)}
}
#let resistance(x,y,s:"R")={
  w(x,y,x + 7pt,y - 5pt)
  w(x + 7pt,y - 5pt,x + 14pt,y + 5pt)
  w(x + 14pt,y + 5pt,x + 21pt,y - 5pt)
  w(x + 21pt,y - 5pt,x + 28pt,y)
  txt(x + 6pt,y - 19pt,s)
}
#let inv(x,y,s:"")={
  w(x,y - 12pt,x,y + 12pt)
  w(x,y - 12pt,x + 26pt,y)
  w(x,y + 12pt,x + 26pt,y)
  place(top+left,dx:x + 28pt,dy:y - 2pt,circle(radius:2pt,stroke:.7pt,fill:white))
  if s!="" {txt(x + 4pt,y + 16pt,s)}
}
#let tg(x,y,label:"TG")={
  place(top+left,dx:x,dy:y - 15pt,rect(width:36pt,height:30pt,radius:3pt,stroke:.8pt))
  txt(x + 7pt,y - 8pt,label)
  w(x + 17pt,y - 15pt,x + 17pt,y - 28pt)
  w(x + 17pt,y + 15pt,x + 17pt,y + 27pt)
}
#let nand(x,y)={
  place(top+left,dx:x,dy:y - 14pt,rect(width:42pt,height:28pt,radius:8pt,stroke:.8pt))
  txt(x + 6pt,y - 6pt,"NAND")
}
#let fig718()=block(width:100%)[
  #html.frame(block(width:350pt,height:94pt)[
    #inv(17pt,39pt,s:"驱动")
    #w(48pt,39pt,84pt,39pt)
    #tg(84pt,39pt)
    #w(120pt,39pt,161pt,39pt)
    #inv(161pt,39pt,s:"负载")
    #w(192pt,39pt,241pt,39pt)
    #txt(102pt,2pt,"CLK")
    #txt(96pt,77pt,"CLK̅")
    #txt(80pt,84pt,"(a) 反相器—传输门—反相器")
  ])
  #html.frame(block(width:350pt,height:100pt)[
    #w(8pt,46pt,37pt,46pt)
    #resistance(37pt,46pt,s:"R_inv")
    #w(65pt,46pt,139pt,46pt)
    #resistance(139pt,46pt,s:"R_TG")
    #w(167pt,46pt,294pt,46pt)
    #for x in (104pt,133pt,208pt,270pt) [
      #w(x,46pt,x,64pt)
      #cap(x - 7pt,64pt)
      #ground(x,80pt)
    ]
    #txt(83pt,89pt,"C_inv")
    #txt(128pt,89pt,"C_TG1")
    #txt(200pt,89pt,"C_TG2")
    #txt(266pt,89pt,"C_load")
    #txt(12pt,8pt,"(b) 驱动/传输门 RC 阶梯")
  ])
  #html.frame(block(width:350pt,height:76pt)[
    #w(12pt,30pt,41pt,30pt)
    #resistance(41pt,30pt,s:"R_1")
    #w(69pt,30pt,141pt,30pt)
    #resistance(141pt,30pt,s:"R_2")
    #w(169pt,30pt,285pt,30pt)
    #for (x,lbl) in ((126pt,"C_1"),(264pt,"C_2")) [
      #w(x,30pt,x,45pt)
      #cap(x - 7pt,45pt,s:lbl)
      #ground(x,60pt)
    ]
  ])
]
#let mux-rc(name:"MUX1",third:true)=html.frame(block(width:370pt,height:130pt)[
  #txt(2pt,3pt,name)
  #w(4pt,52pt,35pt,52pt)
  #resistance(35pt,52pt,s:"R_inv")
  #w(63pt,52pt,105pt,52pt)
  #resistance(105pt,52pt,s:"R_TG")
  #w(133pt,52pt,185pt,52pt)
  #if third [
    #resistance(185pt,52pt,s:"R_TG")
    #w(213pt,52pt,328pt,52pt)
  ] else [
    #w(185pt,52pt,328pt,52pt)
  ]
  #for (x,lbl) in ((89pt,"C_1"),(169pt,"C_2"),(303pt,"C_3")) [
    #w(x,52pt,x,72pt)
    #cap(x - 7pt,72pt,s:lbl)
    #ground(x,89pt)
  ]
  #txt(273pt,33pt,"OUT")
])
#let fig719()=html.frame(block(width:340pt,height:116pt)[
  #txt(3pt,4pt,"输入 A")
  #w(38pt,48pt,101pt,48pt)
  #tg(101pt,48pt)
  #w(137pt,48pt,206pt,48pt)
  #cap(201pt,69pt,s:"C_load")
  #ground(208pt,85pt)
  #inv(56pt,86pt,s:"sel")
  #txt(100pt,12pt,"nMOS W; pMOS W")
  #txt(140pt,97pt,"输入 A：LE=2；输入 sel：LE=2/3")
])
#let fig720()=html.frame(block(width:340pt,height:116pt)[
  #txt(3pt,4pt,"输入 A")
  #w(38pt,48pt,101pt,48pt)
  #tg(101pt,48pt,label:"TG×3")
  #w(137pt,48pt,206pt,48pt)
  #cap(201pt,69pt,s:"C_load")
  #ground(208pt,85pt)
  #inv(56pt,86pt,s:"sel")
  #txt(100pt,12pt,"nMOS 3W; pMOS 3W")
  #txt(131pt,97pt,"A：LE=4/3；sel：LE=4/3")
])
#let fig721()=grid(columns:(1fr,1fr),column-gutter:7pt,row-gutter:9pt,
  [#html.frame(block(width:175pt,height:94pt)[
    #w(5pt,32pt,39pt,32pt)
    #place(top+left,dx:39pt,dy:24pt,rect(width:54pt,height:21pt,stroke:.8pt))
    #txt(49pt,27pt,"开关")
    #w(93pt,32pt,133pt,32pt)
    #cap(117pt,58pt,s:"C_Q")
    #txt(40pt,3pt,"(a) 抽象锁存器")
  ])],
  [#html.frame(block(width:175pt,height:94pt)[
    #w(5pt,32pt,41pt,32pt)
    #tg(41pt,32pt,label:"nMOS")
    #w(77pt,32pt,129pt,32pt)
    #cap(117pt,58pt,s:"C_Q")
    #txt(40pt,3pt,"(b) 传输管锁存器")
  ])],
  [#html.frame(block(width:175pt,height:95pt)[
    #w(5pt,32pt,36pt,32pt)
    #tg(36pt,32pt)
    #w(72pt,32pt,101pt,32pt)
    #inv(101pt,32pt)
    #w(132pt,32pt,159pt,32pt)
    #txt(8pt,3pt,"(c) 增加反相器输出")
  ])],
  [#html.frame(block(width:175pt,height:95pt)[
    #tg(29pt,34pt,label:"TG")
    #inv(82pt,34pt)
    #w(66pt,34pt,82pt,34pt)
    #txt(35pt,3pt,"高电平透明，低电平保持")
  ])])
#let fig722()=html.frame(block(width:379pt,height:122pt)[
  #txt(3pt,31pt,"D")
  #w(18pt,42pt,51pt,42pt)
  #tg(51pt,42pt,label:"TG1")
  #w(87pt,42pt,135pt,42pt)
  #inv(135pt,42pt,s:"INV1")
  #w(166pt,42pt,205pt,42pt)
  #inv(205pt,42pt,s:"INV2")
  #w(236pt,42pt,325pt,42pt)
  #txt(329pt,33pt,"Q")
  #w(294pt,42pt,294pt,101pt)
  #tg(193pt,101pt,label:"TG2")
  #w(229pt,101pt,294pt,101pt)
  #w(135pt,42pt,116pt,42pt)
  #w(116pt,42pt,116pt,101pt)
  #w(116pt,101pt,193pt,101pt)
  #txt(42pt,5pt,"CLK")
  #txt(180pt,67pt,"CLK̅")
])
#let fig723()=html.frame(block(width:379pt,height:123pt)[
  #txt(0pt,38pt,"D")
  #w(14pt,48pt,46pt,48pt)
  #tg(46pt,48pt)
  #w(82pt,48pt,119pt,48pt)
  #inv(119pt,48pt)
  #w(150pt,48pt,197pt,48pt)
  #inv(197pt,48pt)
  #w(228pt,48pt,343pt,48pt)
  #txt(342pt,37pt,"Q")
  #w(262pt,48pt,262pt,103pt)
  #w(262pt,103pt,183pt,103pt)
  #tg(144pt,103pt,label:"反馈")
  #w(144pt,103pt,102pt,103pt)
  #w(102pt,103pt,102pt,48pt)
  #txt(22pt,13pt,"CLK")
  #txt(132pt,117pt,"CLK̅")
])
#let fig724()=html.frame(block(width:379pt,height:133pt)[
  #txt(1pt,30pt,"D")
  #w(17pt,42pt,46pt,42pt)
  #tg(46pt,42pt,label:"TG1")
  #w(82pt,42pt,119pt,42pt)
  #inv(119pt,42pt)
  #w(150pt,42pt,183pt,42pt)
  #tg(183pt,42pt,label:"TG2")
  #w(219pt,42pt,251pt,42pt)
  #inv(251pt,42pt)
  #w(282pt,42pt,334pt,42pt)
  #txt(337pt,32pt,"Q")
  #w(156pt,42pt,156pt,103pt)
  #tg(98pt,103pt,label:"保持")
  #w(134pt,103pt,156pt,103pt)
  #w(98pt,103pt,82pt,103pt)
  #w(82pt,103pt,82pt,42pt)
  #txt(43pt,4pt,"CLK̅")
  #txt(183pt,4pt,"CLK")
  #txt(88pt,122pt,"主锁存器")
  #txt(253pt,122pt,"从锁存器")
])
#let fig725()=grid(columns:(1fr,1fr),column-gutter:9pt,
  [#html.frame(block(width:182pt,height:150pt)[
    #txt(7pt,5pt,"(a) CMOS 静态门")
    #place(top+left,dx:66pt,dy:33pt,rect(width:64pt,height:31pt,stroke:.8pt))
    #txt(73pt,40pt,"PUN")
    #w(98pt,64pt,98pt,79pt)
    #place(top+left,dx:66pt,dy:79pt,rect(width:64pt,height:34pt,stroke:.8pt))
    #txt(73pt,89pt,"PDN")
    #w(98pt,113pt,98pt,132pt)
  ])],
  [#html.frame(block(width:182pt,height:150pt)[
    #txt(7pt,5pt,"(b) 伪 NMOS")
    #tg(82pt,39pt,label:"pMOS")
    #w(100pt,54pt,100pt,79pt)
    #place(top+left,dx:72pt,dy:79pt,rect(width:60pt,height:34pt,stroke:.8pt))
    #txt(78pt,88pt,"PDN")
    #w(100pt,113pt,100pt,132pt)
  ])],
  [#html.frame(block(width:182pt,height:160pt)[
    #txt(7pt,5pt,"(c) 预充/求值门")
    #tg(82pt,31pt,label:"MP")
    #w(100pt,46pt,100pt,69pt)
    #place(top+left,dx:72pt,dy:69pt,rect(width:60pt,height:38pt,stroke:.8pt))
    #txt(76pt,82pt,"PDN")
    #w(100pt,107pt,100pt,113pt)
    #tg(82pt,127pt,label:"MN")
  ])],
  [#html.frame(block(width:182pt,height:160pt)[
    #txt(7pt,5pt,"(d) 单时钟 CLK")
    #tg(82pt,31pt,label:"预充")
    #w(100pt,46pt,100pt,69pt)
    #nand(81pt,88pt)
    #w(100pt,107pt,100pt,113pt)
    #tg(82pt,127pt,label:"求值")
  ])])
#let fig726()=html.frame(block(width:255pt,height:153pt)[
  #txt(114pt,5pt,"V_DD")
  #tg(105pt,26pt,label:"M_P")
  #w(123pt,41pt,123pt,64pt)
  #place(top+left,dx:93pt,dy:64pt,rect(width:62pt,height:46pt,stroke:.8pt))
  #txt(100pt,78pt,"NMOS")
  #txt(101pt,91pt,"逻辑网络")
  #w(123pt,110pt,123pt,119pt)
  #tg(105pt,133pt,label:"M_N")
  #w(123pt,64pt,219pt,64pt)
  #txt(224pt,56pt,"OUT")
  #txt(1pt,24pt,"CLK")
  #txt(1pt,126pt,"CLK")
])
