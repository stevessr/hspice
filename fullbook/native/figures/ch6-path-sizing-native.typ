// SOURCE-SCAN GUIDED NATIVE EDITABLE GEOMETRY, PDF229–236
// Diagram components carry schematic meaning; printed curves and placements
// are NOT automatically accepted as pixel-identical.
#let wire(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,line(end:(x2 - x1,y2 - y1),stroke:.75pt))
#let dot(x,y)=place(top+left,dx:x,dy:y,circle(radius:1.4pt,fill:black))
#let cap(x,y,label:"")={
  place(top+left,dx:x,dy:y,line(length:14pt,stroke:.75pt))
  place(top+left,dx:x,dy:y + 5pt,line(length:14pt,stroke:.75pt))
  if label!="" {place(top+left,dx:x + 16pt,dy:y - 2pt,text(size:7pt)[#label])}
}
#let inv(x,y,scale:1,label:"")={
  wire(x,y,x,y + 29pt*scale)
  wire(x,y,x + 34pt*scale,y + 14pt*scale)
  wire(x,y + 29pt*scale,x + 34pt*scale,y + 14pt*scale)
  place(top+left,dx:x + 35pt*scale,dy:y + 12pt*scale,circle(radius:2pt,stroke:.7pt,fill:white))
  if label!="" {place(top+left,dx:x + 6pt,dy:y + 34pt*scale,text(size:7pt)[#label])}
}
#let inverters(xs:(18pt,83pt,148pt),width:315pt,height:105pt,labels:("1","f","f²"),load:"C_load")=
  html.frame(block(width:width,height:height)[
    #for (i,x) in xs.enumerate() [
      #inv(x,17pt,label:labels.at(i))
      #wire(x + 38pt,31pt,x + 64pt,31pt)
    ]
    #cap(xs.last()+56pt,58pt,label:load)
    #place(top+left,dx:10pt,dy:14pt,text(size:8pt)[$C_("in")$]))
    #wire(8pt,31pt,xs.first(),31pt)
  ])
#let fig617()=html.frame(block(width:340pt,height:106pt)[
  #inv(34pt,21pt,label:"（a）单位反相器")
  #wire(72pt,35pt,107pt,35pt)
  #cap(108pt,50pt,label:"C_load")
  #inv(188pt,11pt,scale:1.6,label:"（b）宽度增大的反相器")
  #wire(248pt,35pt,285pt,35pt)
  #cap(286pt,50pt,label:"C_load")
])
#let fig618()=inverters(xs:(34pt,123pt,212pt),width:360pt,height:94pt,labels:("1","2","3"))
#let fig619()=html.frame(block(width:335pt,height:112pt)[
  #inverters(xs:(25pt,115pt,208pt),width:320pt,height:92pt,labels:("小","中","大"))
  #cap(113pt,60pt,label:"C_in")
  #place(top+left,dx:7pt,dy:102pt,text(size:7pt)[驱动尺寸的增加提高前一级输入电容]))
])
#let fig620()=html.frame(block(width:315pt,height:143pt)[
  #wire(130pt,10pt,130pt,29pt)
  #place(top+left,dx:132pt,dy:12pt,text(size:7pt)[$V_("DD")$]))
  #place(top+left,dx:119pt,dy:31pt,rect(width:21pt,height:28pt,stroke:.8pt))
  #wire(130pt,59pt,130pt,78pt)
  #place(top+left,dx:119pt,dy:80pt,rect(width:21pt,height:28pt,stroke:.8pt))
  #wire(130pt,108pt,130pt,125pt)
  #wire(58pt,69pt,130pt,69pt)
  #wire(130pt,69pt,227pt,69pt)
  #cap(226pt,88pt,label:"C_out")
  #cap(174pt,88pt,label:"C_self")
  #cap(63pt,88pt,label:"C_in")
  #place(top+left,dx:15pt,dy:61pt,text(size:7pt)[$V_("in")$]))
  #place(top+left,dx:237pt,dy:60pt,text(size:7pt)[$V_("out")$]))
])
#let fig621()=inverters(xs:(21pt,96pt,171pt,246pt),width:375pt,height:110pt,labels:("j−1","j","j+1","N"))
#let fig622()=inverters(xs:(20pt,96pt,172pt,248pt),width:380pt,height:109pt,labels:("1","f","f²","f^(N-1)"),load:"f^N C_in")
#let fig623()=html.frame(block(width:344pt,height:190pt)[
  #wire(35pt,165pt,312pt,165pt)
  #wire(35pt,165pt,35pt,15pt)
  #place(top+left,dx:5pt,dy:14pt,text(size:8pt)[延迟]))
  #place(top+left,dx:310pt,dy:168pt,text(size:8pt)[$f$]))
  #for i in (0,1,2,3) [
    #let yy=70pt+i * 17pt
    #wire(65pt,yy - 10pt,93pt,yy + 33pt)
    #wire(93pt,yy + 33pt,148pt,yy + 40pt)
    #wire(148pt,yy + 40pt,225pt,yy + 36pt)
    #wire(225pt,yy + 36pt,280pt,yy + 24pt)
    #place(top+left,dx:240pt,dy:yy + 3pt,text(size:7pt)[#("γ="+str(i * 0.5))]))
  ]
  #place(top+left,dx:97pt,dy:174pt,text(size:7pt)[最佳扇出因子约2.5～4]))
])
#let fig624()=html.frame(block(width:360pt,height:135pt)[
  #inverters(xs:(18pt,105pt,196pt),width:340pt,height:115pt,labels:("1","4","16"))
  #place(top+left,dx:220pt,dy:121pt,text(size:8pt)[FO4 每级放大4倍]))
])
#let fig625()=html.frame(block(width:340pt,height:85pt)[
  #for k in (0,1,2) [
    #let x=32pt+k * 99pt
    #place(top+left,dx:x,dy:24pt,rect(width:53pt,height:34pt,radius:10pt,stroke:.8pt))
    #wire(x - 18pt,41pt,x,41pt)
    #wire(x + 53pt,41pt,x + 80pt,41pt)
    #place(top+left,dx:x + 16pt,dy:35pt,text(size:7pt)[NAND]))
  ]
])
#let fig626()=html.frame(block(width:357pt,height:95pt)[
  #place(top+left,dx:19pt,dy:27pt,rect(width:75pt,height:37pt,radius:9pt,stroke:.8pt))
  #place(top+left,dx:30pt,dy:39pt,text(size:8pt)[NAND]))
  #wire(94pt,45pt,123pt,45pt)
  #inv(126pt,27pt,label:"INV")
  #wire(164pt,42pt,213pt,42pt)
  #place(top+left,dx:213pt,dy:27pt,rect(width:67pt,height:37pt,radius:14pt,stroke:.8pt))
  #place(top+left,dx:226pt,dy:39pt,text(size:8pt)[NOR]))
  #wire(280pt,45pt,316pt,45pt)
])
#let fig-example610()=html.frame(block(width:365pt,height:106pt)[
  #fig626()
  #cap(20pt,75pt,label:"2 fF")
  #cap(309pt,75pt,label:"200 fF")
])
