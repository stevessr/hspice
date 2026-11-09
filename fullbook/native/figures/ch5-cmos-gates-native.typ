// Editable, textbook-style transistor-level CMOS schematic figures.
// PMOS has a gate bubble; NMOS does not. Device bodies are tied to the supply
// rails (PMOS -> VDD, NMOS -> GND), with body leads omitted for readability.
// Schematics are conceptual native Typst drawings, not source-scan facsimiles.
#let wire(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,
  line(end:(x2 - x1,y2 - y1),stroke:.8pt))
#let junction(x,y)=place(top+left,dx:x,dy:y,circle(radius:1.4pt,fill:black))
#let ground(x,y)={
  wire(x,y,x,y + 3pt)
  place(top+left,dx:x - 8pt,dy:y + 3pt,line(length:16pt,stroke:.8pt))
  place(top+left,dx:x - 5pt,dy:y + 7pt,line(length:10pt,stroke:.8pt))
  place(top+left,dx:x - 2pt,dy:y + 11pt,line(length:4pt,stroke:.8pt))
}
#let mos(x,y,p:false,gate:"")={
  // Terminal endpoints: (x,y) and (x,y + 17pt); gate enters from the left.
  wire(x,y,x,y + 17pt)
  wire(x - 6pt,y,x - 6pt,y + 17pt)
  wire(x - 24pt,y + 8.5pt,x - (if p {12pt} else {6pt}),y + 8.5pt)
  if p {
    place(top+left,dx:x - 9pt,dy:y + 8.5pt,
      circle(radius:3pt,fill:white,stroke:.8pt))
  }
  if gate != "" {
    place(top+left,dx:x - 37pt,dy:y + 3pt,text(size:7pt)[#gate])
  }
}
#let nand-nor-2()=html.frame(block(width:348pt,height:191pt)[
  #place(top+left,dx:6pt,dy:2pt,text(size:7.8pt)[图5.1：NOR2 和 NAND2 静态 CMOS 晶体管网络])
  #place(top+left,dx:74pt,dy:17pt,text(size:7.2pt,weight:"bold")[NOR2])
  #place(top+left,dx:248pt,dy:17pt,text(size:7.2pt,weight:"bold")[NAND2])
  // NOR2: two series PMOS and two parallel NMOS.
  #place(top+left,dx:98pt,dy:23pt,text(size:6.8pt)[$V_("DD")$])
  #wire(90pt,32pt,90pt,41pt)
  #mos(90pt,41pt,p:true,gate:"A")
  #wire(90pt,58pt,90pt,66pt)
  #mos(90pt,66pt,p:true,gate:"B")
  #wire(90pt,83pt,90pt,104pt)
  #wire(90pt,104pt,162pt,104pt)
  #junction(90pt,104pt)
  #place(top+left,dx:163pt,dy:100pt,text(size:7.5pt)[$Y$])
  #wire(55pt,104pt,125pt,104pt)
  #wire(55pt,104pt,55pt,125pt)
  #wire(125pt,104pt,125pt,125pt)
  #mos(55pt,125pt,gate:"A")
  #mos(125pt,125pt,gate:"B")
  #wire(55pt,142pt,55pt,155pt)
  #wire(125pt,142pt,125pt,155pt)
  #wire(55pt,155pt,125pt,155pt)
  #junction(55pt,104pt)
  #junction(125pt,104pt)
  #ground(90pt,155pt)
  // NAND2: two parallel PMOS and two series NMOS.
  #place(top+left,dx:256pt,dy:23pt,text(size:6.8pt)[$V_("DD")$])
  #wire(215pt,34pt,302pt,34pt)
  #wire(215pt,34pt,215pt,48pt)
  #wire(302pt,34pt,302pt,48pt)
  #mos(215pt,48pt,p:true,gate:"A")
  #mos(302pt,48pt,p:true,gate:"B")
  #wire(215pt,65pt,215pt,96pt)
  #wire(302pt,65pt,302pt,96pt)
  #wire(215pt,96pt,324pt,96pt)
  #junction(258pt,96pt)
  #place(top+left,dx:325pt,dy:92pt,text(size:7.5pt)[$Y$])
  #wire(258pt,96pt,258pt,112pt)
  #mos(258pt,112pt,gate:"A")
  #wire(258pt,129pt,258pt,139pt)
  #mos(258pt,139pt,gate:"B")
  #ground(258pt,156pt)
  #place(top+left,dx:21pt,dy:180pt,text(size:7.2pt)[$Y_("NOR")=overline(A+B)$]))
  #place(top+left,dx:200pt,dy:180pt,text(size:7.2pt)[$Y_("NAND")=overline(A B)$]))
])
// 教材 PDF170 / 印刷151：图5.2是三幅晶体管级尺寸图，不是参数表。
#let gate-widths() = html.frame(block(width:350pt,height:180pt)[
  #place(top+left,dx:5pt,dy:2pt,text(size:7.6pt)[图5.2 CMOS器件宽度：基准反相器2W/W])
  #place(top+left,dx:34pt,dy:20pt,text(size:7.1pt)[(a) INV])
  #place(top+left,dx:158pt,dy:20pt,text(size:7.1pt)[(b) NAND2])
  #place(top+left,dx:284pt,dy:20pt,text(size:7.1pt)[(c) NOR2])
  // INV: two gate terminals wired as one input A, drains as one Y.
  #place(top+left,dx:56pt,dy:30pt,text(size:7pt)[$V_("DD")$])
  #wire(62pt,38pt,62pt,43pt)
  #mos(62pt,43pt,p:true)
  #wire(62pt,60pt,62pt,112pt)
  #mos(62pt,112pt)
  #ground(62pt,129pt)
  #wire(15pt,51.5pt,38pt,51.5pt)
  #wire(15pt,51.5pt,15pt,120.5pt)
  #wire(15pt,120.5pt,38pt,120.5pt)
  #place(top+left,dx:3pt,dy:83pt,text(size:7pt)[A])
  #wire(62pt,88pt,97pt,88pt)
  #junction(62pt,88pt)
  #place(top+left,dx:100pt,dy:84pt,text(size:7.5pt)[F])
  #place(top+left,dx:71pt,dy:50pt,text(size:7pt)[2W])
  #place(top+left,dx:72pt,dy:118pt,text(size:7pt)[W])
  // NAND2: 2 parallel PMOS (2W) + 2 series NMOS (2W).
  #wire(158pt,37pt,210pt,37pt)
  #wire(158pt,37pt,158pt,48pt)
  #wire(210pt,37pt,210pt,48pt)
  #place(top+left,dx:179pt,dy:28pt,text(size:7pt)[$V_("DD")$])
  #mos(158pt,48pt,p:true,gate:"A")
  #mos(210pt,48pt,p:true,gate:"B")
  #wire(158pt,65pt,158pt,84pt)
  #wire(210pt,65pt,210pt,84pt)
  #wire(158pt,84pt,231pt,84pt)
  #junction(184pt,84pt)
  #place(top+left,dx:235pt,dy:80pt,text(size:7pt)[F])
  #wire(184pt,84pt,184pt,102pt)
  #mos(184pt,102pt,gate:"A")
  #wire(184pt,119pt,184pt,132pt)
  #mos(184pt,132pt,gate:"B")
  #ground(184pt,149pt)
  #place(top+left,dx:167pt,dy:43pt,text(size:6.6pt)[2W])
  #place(top+left,dx:218pt,dy:43pt,text(size:6.6pt)[2W])
  #place(top+left,dx:194pt,dy:105pt,text(size:6.6pt)[2W])
  #place(top+left,dx:194pt,dy:139pt,text(size:6.6pt)[2W])
  // NOR2: 2 series PMOS (4W) + 2 parallel NMOS (W).
  #place(top+left,dx:285pt,dy:28pt,text(size:7pt)[$V_("DD")$])
  #wire(293pt,37pt,293pt,42pt)
  #mos(293pt,42pt,p:true,gate:"A")
  #wire(293pt,59pt,293pt,68pt)
  #mos(293pt,68pt,p:true,gate:"B")
  #wire(293pt,85pt,293pt,112pt)
  #wire(263pt,112pt,335pt,112pt)
  #junction(293pt,112pt)
  #place(top+left,dx:337pt,dy:105pt,text(size:7pt)[F])
  #wire(263pt,112pt,263pt,127pt)
  #wire(329pt,112pt,329pt,127pt)
  #mos(263pt,127pt,gate:"A")
  #mos(329pt,127pt,gate:"B")
  #wire(263pt,144pt,263pt,154pt)
  #wire(329pt,144pt,329pt,154pt)
  #wire(263pt,154pt,329pt,154pt)
  #ground(293pt,154pt)
  #place(top+left,dx:303pt,dy:45pt,text(size:6.5pt)[4W])
  #place(top+left,dx:303pt,dy:72pt,text(size:6.5pt)[4W])
  #place(top+left,dx:275pt,dy:136pt,text(size:6.5pt)[W])
  #place(top+left,dx:337pt,dy:136pt,text(size:6.5pt)[W])
  #place(top+left,dx:25pt,dy:173pt,text(size:6.8pt)[宽度均对应独立晶体管；MOS 体端按电源/地连接。])
])
// 教材 PDF171／印刷152：图5.4是真实的3管串联版图与等效单管版图。
#let equivalent-width()=html.frame(block(width:348pt,height:143pt)[
  #place(top+left,dx:6pt,dy:3pt,text(size:7.8pt)[图5.4：三只串联 NMOS 的版图及其等效尺寸])
  #place(top+left,dx:26pt,dy:21pt,text(size:7pt)[(a) 三条栅：各 $L_n$])
  #place(top+left,dx:204pt,dy:21pt,text(size:7pt)[(b) 等效栅长：$3L_n$])
  // Actual layout: vertical active diffusion, three horizontal polysilicon gates.
  #place(top+left,dx:70pt,dy:37pt,
    rect(width:58pt,height:84pt,stroke:.7pt,fill:rgb("#d1d1d1")))
  #for yy in (48pt,75pt,102pt) [
    #place(top+left,dx:49pt,dy:yy,
      rect(width:100pt,height:9pt,stroke:.8pt,fill:rgb("#b9b9b9")))
  ]
  #place(top+left,dx:28pt,dy:45pt,text(size:7pt)[A])
  #place(top+left,dx:28pt,dy:72pt,text(size:7pt)[B])
  #place(top+left,dx:28pt,dy:99pt,text(size:7pt)[C])
  #place(top+left,dx:85pt,dy:28pt,text(size:7pt)[$3W_n$])
  #place(top+left,dx:137pt,dy:112pt,text(size:7pt)[$L_n$])
  #place(top+left,dx:85pt,dy:128pt,text(size:6.5pt)[扩散区])
  // One equivalent channel has identical width 3Wn and triple channel length 3Ln.
  #place(top+left,dx:242pt,dy:37pt,
    rect(width:58pt,height:84pt,stroke:.7pt,fill:rgb("#d1d1d1")))
  #place(top+left,dx:221pt,dy:67pt,
    rect(width:100pt,height:27pt,stroke:.8pt,fill:rgb("#b9b9b9")))
  #place(top+left,dx:255pt,dy:28pt,text(size:7pt)[$3W_n$])
  #place(top+left,dx:312pt,dy:84pt,text(size:7pt)[$3L_n$])
  #place(top+left,dx:253pt,dy:128pt,text(size:6.5pt)[扩散区])
  #place(top+left,dx:159pt,dy:68pt,text(size:13pt)[$arrow$])
])
#let wide-nand()=html.frame(block(width:350pt,height:185pt)[
  #place(top+left,dx:5pt,dy:3pt,text(size:7.7pt)[图5.5：8 输入与门（NAND8 + 反相器）])
  #place(top+left,dx:114pt,dy:17pt,text(size:7pt)[$V_("DD")$])
  #wire(102pt,26pt,306pt,26pt)
  #wire(102pt,74pt,306pt,74pt)
  // PUN: 8 independent parallel PMOS, each with gate bubble.
  #for i in range(8) [
    #let xx = 108pt + i * 27pt
    #wire(xx,26pt,xx,43pt)
    #wire(xx,43pt,xx,57pt)
    #wire(xx - 4pt,43pt,xx - 4pt,57pt)
    #wire(xx - 17pt,50pt,xx - 10pt,50pt)
    #place(top+left,dx:xx - 7pt,dy:50pt,circle(radius:2.6pt,fill:white,stroke:.8pt))
    #wire(xx,57pt,xx,74pt)
    #place(top+left,dx:xx - 11pt,dy:30pt,text(size:6pt)[#("A","B","C","D","E","F","G","H").at(i)])
  ]
  // Shared NAND8 output X feeds inverter and top of 8-NMOS stack.
  #wire(76pt,74pt,102pt,74pt)
  #wire(76pt,74pt,76pt,81pt)
  #junction(102pt,74pt)
  #place(top+left,dx:82pt,dy:67pt,text(size:6pt)[X])
  // Eight stacked NMOS gates, each 8W. They must connect to the PUN.
  #for i in range(8) [
    #let yy = 81pt + i * 10pt
    #wire(76pt,yy,76pt,yy + 8pt)
    #wire(72pt,yy,72pt,yy + 8pt)
    #wire(55pt,yy + 4pt,72pt,yy + 4pt)
    #place(top+left,dx:43pt,dy:yy,text(size:5.8pt)[#("A","B","C","D","E","F","G","H").at(i)])
    #if i < 7 [#wire(76pt,yy + 8pt,76pt,yy + 10pt)]
  ]
  #ground(76pt,161pt)
  #place(top+left,dx:87pt,dy:112pt,text(size:6.8pt)[8W])
  #place(top+left,dx:284pt,dy:32pt,text(size:6.8pt)[2W])
  // Source figure has a post-inverter: AND8, not just NAND8.
  #wire(306pt,74pt,316pt,74pt)
  #place(top+left,dx:316pt,dy:65pt,
    curve(stroke:.85pt,fill:white,
      curve.move((0pt,0pt)),curve.line((0pt,18pt)),
      curve.line((16pt,9pt)),curve.close(mode:"straight")))
  #place(top+left,dx:335pt,dy:74pt,circle(radius:2.7pt,stroke:.85pt,fill:white))
  #wire(338pt,74pt,347pt,74pt)
  #place(top+left,dx:335pt,dy:86pt,text(size:6.8pt)[F])
  #place(top+left,dx:155pt,dy:112pt,text(size:7pt)[PUN：8×2W 并联])
  #place(top+left,dx:155pt,dy:135pt,text(size:7pt)[PDN：8×8W 串联])
  #place(top+left,dx:154pt,dy:160pt,text(size:6.9pt)[逻辑 F=A·B·C·D·E·F·G·H])
])
#let nand-vtc() = html.frame(block(width:349pt,height:181pt)[
 #place(top + left,dx:30pt,dy:152pt,line(length:302pt,stroke:.8pt))
 #place(top + left,dx:30pt,dy:152pt,line(end:(0pt,-130pt),stroke:.8pt))
 #place(top + left,dx:32pt,dy:30pt,
   curve(stroke:1.25pt,curve.move((0pt,0pt)),
         curve.cubic((128pt,0pt),(122pt,104pt),(284pt,106pt))))
 #place(top + left,dx:32pt,dy:30pt,
   curve(stroke:(dash:"dashed",thickness:1pt),curve.move((0pt,0pt)),
         curve.cubic((159pt,0pt),(146pt,103pt),(284pt,106pt))))
 #place(top + left,dx:32pt,dy:30pt,
   curve(stroke:(dash:"dotted",thickness:1pt),curve.move((0pt,0pt)),
         curve.cubic((98pt,0pt),(104pt,104pt),(284pt,106pt))))
 #place(top + left,dx:10pt,dy:23pt,text(size:7pt)[$V_("out")$]))
 #place(top + left,dx:309pt,dy:155pt,text(size:7pt)[$V_("in")$]))
 #place(top + left,dx:44pt,dy:170pt,text(size:7pt)[反相器、仅一输入变化、双输入同时变化]))
])