// Editable, textbook-style transistor-level CMOS schematic figures.
// PMOS has a gate bubble; NMOS does not. Device bodies are tied to the supply
// rails (PMOS -> VDD, NMOS -> GND), with body leads omitted for readability.
// Schematics are conceptual native Typst drawings, not source-scan facsimiles.
#let wire(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,
  line(end:(x2-x1,y2-y1),stroke:.8pt))
#let junction(x,y)=place(top+left,dx:x,dy:y,circle(radius:1.4pt,fill:black))
#let ground(x,y)={
  wire(x,y,x,y+3pt)
  place(top+left,dx:x-8pt,dy:y+3pt,line(length:16pt,stroke:.8pt))
  place(top+left,dx:x-5pt,dy:y+7pt,line(length:10pt,stroke:.8pt))
  place(top+left,dx:x-2pt,dy:y+11pt,line(length:4pt,stroke:.8pt))
}
#let mos(x,y,p:false,gate:"")={
  // Terminal endpoints: (x,y) and (x,y+17pt); gate enters from the left.
  wire(x,y,x,y+17pt)
  wire(x-6pt,y,x-6pt,y+17pt)
  wire(x-24pt,y+8.5pt,x-(if p {12pt} else {6pt}),y+8.5pt)
  if p {
    place(top+left,dx:x-9pt,dy:y+8.5pt,
      circle(radius:3pt,fill:white,stroke:.8pt))
  }
  if gate != "" {
    place(top+left,dx:x-37pt,dy:y+3pt,text(size:7pt)[#gate])
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
#let gate-widths() = html.frame(block(width:350pt,height:180pt)[
 #place(top + left,dx:8pt,dy:5pt,text(size:8pt)[图5.2 二输入CMOS门的宽度比例（参考反相器为2W/W）])
 #place(top + left,dx:12pt,dy:27pt,
  table(columns:(79pt,95pt,95pt),inset:3pt,
   table.header([*结构*],[*PMOS宽度*],[*NMOS宽度*]),
   [反相器],[2W],[W],
   [NAND2],[各2W，并联],[各2W，串联],
   [NOR2],[各4W，串联],[各W，并联])))
 #place(top + left,dx:12pt,dy:145pt,text(size:7pt)[依据一条最坏导通路径的等效电阻匹配尺寸；面积不是唯一约束])
])
#let equivalent-width()=html.frame(block(width:348pt,height:143pt)[
  #place(top+left,dx:8pt,dy:4pt,text(size:7.9pt)[图5.4 三只 NMOS 串联与并联的等效宽度])
  #place(top+left,dx:72pt,dy:19pt,text(size:7.5pt,weight:"bold")[串联])
  #place(top+left,dx:255pt,dy:19pt,text(size:7.5pt,weight:"bold")[并联])
  #wire(77pt,25pt,77pt,31pt)
  #for i in range(3) [
    #mos(77pt,31pt+i*28pt,gate:("A","B","C").at(i))
    #if i < 2 [#wire(77pt,48pt+i*28pt,77pt,59pt+i*28pt)]
  ]
  #ground(77pt,104pt)
  #wire(194pt,41pt,316pt,41pt)
  #wire(194pt,100pt,316pt,100pt)
  #for i in range(3) [
    #let xx=207pt+i*48pt
    #wire(xx,41pt,xx,61pt)
    #mos(xx,61pt,gate:("A","B","C").at(i))
    #wire(xx,78pt,xx,100pt)
  ]
  #ground(255pt,100pt)
  #place(top+left,dx:9pt,dy:128pt,text(size:6.7pt)[$1/W_("eq")=1/W_A+1/W_B+1/W_C$]))
  #place(top+left,dx:199pt,dy:128pt,text(size:6.7pt)[$W_("eq")=W_A+W_B+W_C$]))
])
#let wide-nand()=html.frame(block(width:350pt,height:185pt)[
  #place(top+left,dx:7pt,dy:4pt,text(size:7.8pt)[图5.5：八输入 NAND8 的串联 NMOS 与并联 PMOS])
  // Compact MOS symbols still expose every A-H controlled gate.
  #place(top+left,dx:36pt,dy:24pt,text(size:7pt)[$Y$])
  #for i in range(8) [
    #let yy=32pt+i*16pt
    #wire(82pt,yy,82pt,yy+12pt)
    #wire(77pt,yy,77pt,yy+12pt)
    #wire(56pt,yy+6pt,77pt,yy+6pt)
    #place(top+left,dx:43pt,dy:yy+2pt,text(size:6pt)[("A","B","C","D","E","F","G","H").at(i)])
    #if i < 7 [#wire(82pt,yy+12pt,82pt,yy+16pt)]
  ]
  #ground(82pt,156pt)
  #place(top+left,dx:235pt,dy:25pt,text(size:7pt)[$V_("DD")$])
  #wire(163pt,43pt,318pt,43pt)
  #wire(163pt,92pt,318pt,92pt)
  #for i in range(8) [
    #let xx=167pt+i*21pt
    #wire(xx,43pt,xx,59pt)
    #wire(xx,59pt,xx,75pt)
    #wire(xx-4pt,59pt,xx-4pt,75pt)
    #wire(xx-15pt,67pt,xx-10pt,67pt)
    #place(top+left,dx:xx-7pt,dy:67pt,circle(radius:2pt,stroke:.7pt,fill:white))
    #wire(xx,75pt,xx,92pt)
    #place(top+left,dx:xx-14pt,dy:97pt,text(size:6pt)[("A","B","C","D","E","F","G","H").at(i)])
  ]
  #place(top+left,dx:165pt,dy:124pt,text(size:7pt)[并联上拉 PUN：8×PMOS])
  #place(top+left,dx:162pt,dy:143pt,text(size:7pt)[串联下拉 PDN：8×NMOS])
  #place(top+left,dx:162pt,dy:165pt,text(size:7pt)[复杂门的 RC 和尺寸需按路径分析])
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