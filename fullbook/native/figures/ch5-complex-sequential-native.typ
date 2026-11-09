#import "gate-symbols.typ": gate-outline
// Source scan p179–181: editable device-level CMOS paths, no PUN/PDN
// placeholder text rectangles. Topology follows the textbook AOI21, AOI22,
// XOR and XNOR; absolute MOS symbols/spacing remain non-1:1 visual drafts.
#let wire(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,
  line(end:(x2 - x1,y2 - y1),stroke:0.9pt))
#let node(x,y)=place(top+left,dx:x,dy:y,circle(radius:1.5pt,fill:black))
#let ground(x,y)={
  wire(x,y,x,y+6pt)
  place(top+left,dx:x - 8pt,dy:y+6pt,line(length:16pt,stroke:.8pt))
  place(top+left,dx:x - 5pt,dy:y+9pt,line(length:10pt,stroke:.8pt))
  place(top+left,dx:x - 2pt,dy:y+12pt,line(length:4pt,stroke:.8pt))
}
#let vmos(x,y,label,p:false)={
  // Top and bottom channel terminals of a vertical MOS transistor.
  wire(x,y,x,y+6pt)
  place(top+left,dx:x,dy:y+6pt,line(end:(0pt,16pt),stroke:1.4pt))
  wire(x,y+22pt,x,y+28pt)
  place(top+left,dx:x - 6pt,dy:y+6pt,line(end:(0pt,16pt),stroke:.85pt))
  wire(x - 26pt,y+14pt,x - (if p { 11pt } else { 7pt }),y+14pt)
  if p {
    place(top+left,dx:x - 9pt,dy:y+14pt,
      circle(radius:2pt,stroke:.8pt,fill:white))
  }
  place(top+left,dx:x - 44pt,dy:y+6pt,text(size:7pt)[#label])
}
#let aoi21()=html.frame(block(width:370pt,height:236pt)[
  #place(top+left,dx:158pt,dy:1pt,text(size:7.5pt)[$V_("DD")$]))
  #wire(180pt,15pt,180pt,24pt)
  #wire(110pt,24pt,275pt,24pt)
  // PUN: A-B in series, in parallel with C.
  #wire(110pt,24pt,110pt,32pt)
  #vmos(110pt,32pt,[A],p:true)
  #wire(110pt,60pt,110pt,67pt)
  #vmos(110pt,67pt,[B],p:true)
  #wire(110pt,95pt,110pt,116pt)
  #wire(275pt,24pt,275pt,55pt)
  #vmos(275pt,55pt,[C],p:true)
  #wire(275pt,83pt,275pt,116pt)
  #wire(110pt,116pt,275pt,116pt)
  #node(180pt,116pt)
  #wire(275pt,116pt,326pt,116pt)
  #place(top+left,dx:332pt,dy:109pt,text(size:8pt)[$F$]))
  // PDN: C in series with the parallel A/B branches.
  #wire(180pt,116pt,180pt,131pt)
  #vmos(180pt,131pt,[C])
  #wire(180pt,159pt,180pt,166pt)
  #wire(125pt,166pt,250pt,166pt)
  #wire(125pt,166pt,125pt,171pt)
  #wire(250pt,166pt,250pt,171pt)
  #vmos(125pt,171pt,[A])
  #vmos(250pt,171pt,[B])
  #wire(125pt,199pt,125pt,210pt)
  #wire(250pt,199pt,250pt,210pt)
  #wire(125pt,210pt,250pt,210pt)
  #ground(180pt,210pt)
  #place(top+left,dx:16pt,dy:218pt,text(size:7pt)[上拉：$A B$ 串联 $parallel C$；下拉：$(A parallel B)$ 串联 $C$])
])
// Fig5.13 depicts the abstract dual network as two boxes in the SOURCE scan.
#let complex-dual()=html.frame(block(width:354pt,height:164pt)[
  #place(top+left,dx:164pt,dy:2pt,text(size:8pt)[$V_("DD")$]))
  #wire(185pt,15pt,185pt,28pt)
  #place(top+left,dx:115pt,dy:28pt,rect(width:140pt,height:50pt,stroke:.9pt,fill:white))
  #place(top+left,dx:135pt,dy:44pt,text(size:8pt)[p 型器件的复合结构]))
  #for i in range(3) [
    #wire(74pt,36pt+i*17pt,115pt,36pt+i*17pt)
    #place(top+left,dx:60pt,dy:29pt+i*17pt,text(size:7pt)[("A","B","C").at(i)])
  ]
  #wire(185pt,78pt,185pt,85pt)
  #node(185pt,85pt)
  #wire(185pt,85pt,273pt,85pt)
  #place(top+left,dx:278pt,dy:78pt,text(size:8pt)[$F$]))
  #place(top+left,dx:115pt,dy:95pt,rect(width:140pt,height:50pt,stroke:.9pt,fill:white))
  #place(top+left,dx:135pt,dy:110pt,text(size:8pt)[n 型器件的复合结构]))
  #for i in range(3) [
    #wire(74pt,103pt+i*17pt,115pt,103pt+i*17pt)
    #place(top+left,dx:60pt,dy:96pt+i*17pt,text(size:7pt)[("A","B","C").at(i)])
  ]
  #wire(185pt,85pt,185pt,95pt)
  #ground(185pt,145pt)
])
// Example 5.3 AOI22 transistor paths. Two p-parallel groups in series;
// the pull-down is the parallel of two n-series groups AB and CD.
#let example53()=html.frame(block(width:370pt,height:214pt)[
  #place(top+left,dx:158pt,dy:0pt,text(size:7.5pt)[$V_("DD")$]))
  #wire(180pt,12pt,180pt,18pt)
  #wire(105pt,18pt,245pt,18pt)
  #wire(105pt,18pt,105pt,26pt)
  #wire(245pt,18pt,245pt,26pt)
  #vmos(105pt,26pt,[A],p:true)
  #vmos(245pt,26pt,[B],p:true)
  #wire(105pt,54pt,105pt,60pt)
  #wire(245pt,54pt,245pt,60pt)
  #wire(105pt,60pt,245pt,60pt)
  #wire(105pt,60pt,105pt,66pt)
  #wire(245pt,60pt,245pt,66pt)
  #vmos(105pt,66pt,[C],p:true)
  #vmos(245pt,66pt,[D],p:true)
  #wire(105pt,94pt,105pt,101pt)
  #wire(245pt,94pt,245pt,101pt)
  #wire(105pt,101pt,245pt,101pt)
  #wire(245pt,101pt,325pt,101pt)
  #place(top+left,dx:330pt,dy:95pt,text(size:8pt)[$F$]))
  // Lower network top nodes share F, branch AB || CD.
  #wire(105pt,101pt,105pt,110pt)
  #wire(245pt,101pt,245pt,110pt)
  #vmos(105pt,110pt,[A])
  #vmos(245pt,110pt,[C])
  #wire(105pt,138pt,105pt,144pt)
  #wire(245pt,138pt,245pt,144pt)
  #vmos(105pt,144pt,[B])
  #vmos(245pt,144pt,[D])
  #wire(105pt,172pt,105pt,180pt)
  #wire(245pt,172pt,245pt,180pt)
  #wire(105pt,180pt,245pt,180pt)
  #ground(175pt,180pt)
  #place(top+left,dx:22pt,dy:200pt,text(size:7pt)[静态 AOI22：$F=overline(A B+C D)$（每一条导通路径均可编辑）])
])
// Source PDF181, printed p.162: pseudo-NMOS continuation of Example 5.3.
// One always-on pMOS with gate tied to GND; two nMOS series branches AB || CD.
// All device channels, supply, bias, and net connections are native Typst.
#let pseudo-nmos-aoi22()=html.frame(block(width:368pt,height:177pt)[
  #place(top+left,dx:163pt,dy:1pt,text(size:7.4pt)[$V_("DD")$]))
  #wire(183pt,13pt,183pt,23pt)
  #vmos(183pt,23pt,[0],p:true)
  // Explicit PMOS gate-to-ground connection, not merely an always-on label.
  #wire(157pt,37pt,141pt,37pt)
  #ground(141pt,37pt)
  #wire(183pt,51pt,183pt,70pt)
  #node(183pt,70pt)
  #wire(183pt,70pt,328pt,70pt)
  #place(top+left,dx:332pt,dy:64pt,text(size:8pt)[$F$]))
  #wire(110pt,70pt,252pt,70pt)
  #wire(110pt,70pt,110pt,77pt)
  #wire(252pt,70pt,252pt,77pt)
  #vmos(110pt,77pt,[A])
  #vmos(252pt,77pt,[C])
  #wire(110pt,105pt,110pt,111pt)
  #wire(252pt,105pt,252pt,111pt)
  #vmos(110pt,111pt,[B])
  #vmos(252pt,111pt,[D])
  #wire(110pt,139pt,110pt,150pt)
  #wire(252pt,139pt,252pt,150pt)
  #wire(110pt,150pt,252pt,150pt)
  #ground(183pt,150pt)
  #place(top+left,dx:21pt,dy:168pt,text(size:7pt)[伪 NMOS：上拉常导通，下拉为 $A B + C D$])
])
#let xor-panel(x,is-xnor:false)={
  let pleft=if is-xnor {([a],[b])} else {([a],[$bar(b)$])}
  let pright=if is-xnor {([$bar(b)$],[$bar(a)$])} else {([b],[$bar(a)$])}
  let nleft=if is-xnor {([a],[$bar(b)$])} else {([a],[b])}
  let nright=if is-xnor {([$bar(a)$],[b])} else {([$bar(a)$],[$bar(b)$])}
  wire(x+90pt,12pt,x+90pt,20pt)
  wire(x+50pt,20pt,x+130pt,20pt)
  wire(x+50pt,20pt,x+50pt,30pt)
  wire(x+130pt,20pt,x+130pt,30pt)
  vmos(x+50pt,30pt,pleft.at(0),p:true)
  vmos(x+130pt,30pt,pright.at(0),p:true)
  wire(x+50pt,58pt,x+50pt,62pt)
  wire(x+130pt,58pt,x+130pt,62pt)
  vmos(x+50pt,62pt,pleft.at(1),p:true)
  vmos(x+130pt,62pt,pright.at(1),p:true)
  wire(x+50pt,90pt,x+50pt,100pt)
  wire(x+130pt,90pt,x+130pt,100pt)
  wire(x+50pt,100pt,x+130pt,100pt)
  node(x+90pt,100pt)
  wire(x+130pt,100pt,x+163pt,100pt)
  place(top+left,dx:x+165pt,dy:94pt,text(size:7pt)[$f$])
  wire(x+50pt,100pt,x+50pt,110pt)
  wire(x+130pt,100pt,x+130pt,110pt)
  vmos(x+50pt,110pt,nleft.at(0))
  vmos(x+130pt,110pt,nright.at(0))
  wire(x+50pt,138pt,x+50pt,142pt)
  wire(x+130pt,138pt,x+130pt,142pt)
  vmos(x+50pt,142pt,nleft.at(1))
  vmos(x+130pt,142pt,nright.at(1))
  wire(x+50pt,170pt,x+50pt,178pt)
  wire(x+130pt,170pt,x+130pt,178pt)
  wire(x+50pt,178pt,x+130pt,178pt)
  ground(x+90pt,178pt)
  place(top+left,dx:x+74pt,dy:0pt,text(size:7.5pt)[$V_("DD")$])
  place(top+left,dx:x+12pt,dy:193pt,
    text(size:8pt)[#if is-xnor [XNOR：$a b+bar(a)bar(b)$] else [XOR：$bar(a)b+a bar(b)$]])
}
#let xor-xnor()=html.frame(block(width:386pt,height:222pt)[
  #xor-panel(0pt)
  #xor-panel(190pt,is-xnor:true)
  #place(top+left,dx:37pt,dy:209pt,text(size:7pt)[(a) 异或静态实现]))
  #place(top+left,dx:224pt,dy:209pt,text(size:7pt)[(b) 同或静态实现]))
])

// Original source PDF182 / printed p.163, Fig.5.15:
// (a) MUX symbol with selector, and (b) eight-device static CMOS network.
// PUN: (not a, not s) || (not b, s) as two pMOS series branches.
// PDN: (not b || s) in series with (not a || not s);
// intermediate nMOS nodes must share a cross-connection.
#let mux2() = html.frame(block(width:423pt,height:239pt)[
  // (a) two-input MUX trapezoid, data 1/0 and selector.
  #place(top+left,dx:15pt,dy:73pt,text(size:8pt)[a]))
  #place(top+left,dx:15pt,dy:125pt,text(size:8pt)[b]))
  #wire(24pt,83pt,54pt,83pt)
  #wire(24pt,133pt,54pt,133pt)
  #place(top+left,dx:54pt,dy:68pt,
    polygon((0pt,0pt),(55pt,23pt),(55pt,74pt),(0pt,94pt),stroke:.9pt,fill:white))
  #place(top+left,dx:62pt,dy:83pt,text(size:9pt)[1]))
  #place(top+left,dx:62pt,dy:127pt,text(size:9pt)[0]))
  #wire(109pt,114pt,149pt,114pt)
  #place(top+left,dx:154pt,dy:109pt,text(size:8pt)[$f$]))
  #wire(83pt,162pt,83pt,188pt)
  #place(top+left,dx:81pt,dy:190pt,text(size:8pt)[$s$]))
  #place(top+left,dx:45pt,dy:219pt,text(size:7pt)[(a) 逻辑符号])
  // (b) source circuit: common supply and two parallel pMOS series paths.
  #place(top+left,dx:277pt,dy:1pt,text(size:7.3pt)[$V_("DD")$]))
  #wire(296pt,15pt,296pt,24pt)
  #wire(239pt,24pt,355pt,24pt)
  #wire(239pt,24pt,239pt,31pt)
  #wire(355pt,24pt,355pt,31pt)
  #vmos(239pt,31pt,[$bar(a)$],p:true)
  #vmos(355pt,31pt,[$bar(b)$],p:true)
  #wire(239pt,59pt,239pt,66pt)
  #wire(355pt,59pt,355pt,66pt)
  #vmos(239pt,66pt,[$bar(s)$],p:true)
  #vmos(355pt,66pt,[s],p:true)
  #wire(239pt,94pt,239pt,108pt)
  #wire(355pt,94pt,355pt,108pt)
  #wire(239pt,108pt,355pt,108pt)
  #wire(355pt,108pt,407pt,108pt)
  #place(top+left,dx:410pt,dy:102pt,text(size:8pt)[$f$]))
  #node(296pt,108pt)
  // Parallel upper nMOS pair: not b || s.
  #wire(239pt,108pt,239pt,115pt)
  #wire(355pt,108pt,355pt,115pt)
  #vmos(239pt,115pt,[$bar(b)$])
  #vmos(355pt,115pt,[s])
  #wire(239pt,143pt,239pt,150pt)
  #wire(355pt,143pt,355pt,150pt)
  // Scan's crucial shared middle bar between the nMOS groups.
  #wire(239pt,150pt,355pt,150pt)
  #node(296pt,150pt)
  // Parallel lower nMOS pair: not a || not s.
  #wire(239pt,150pt,239pt,157pt)
  #wire(355pt,150pt,355pt,157pt)
  #vmos(239pt,157pt,[$bar(a)$])
  #vmos(355pt,157pt,[$bar(s)$])
  #wire(239pt,185pt,239pt,198pt)
  #wire(355pt,185pt,355pt,198pt)
  #ground(239pt,198pt)
  #ground(355pt,198pt)
  #place(top+left,dx:268pt,dy:219pt,text(size:7pt)[(b) CMOS 实现])
])
// Original source Fig5.16: two crossed inverters AND two intersecting
// voltage-transfer curves (not merely two boxes in a circular connection).
#let bistable() = html.frame(block(width:404pt,height:185pt)[
  // (a) Two cross-coupled inverters
  #place(top+left,dx:59pt,dy:43pt,
    curve(fill:white,stroke:.9pt,
      curve.move((40pt,0pt)),curve.line((40pt,33pt)),
      curve.line((0pt,16pt)),curve.close(mode:"straight")))
  #place(top+left,dx:56pt,dy:59pt,circle(radius:3pt,stroke:.9pt,fill:white))
  #place(top+left,dx:59pt,dy:100pt,
    curve(fill:white,stroke:.9pt,
      curve.move((0pt,0pt)),curve.line((0pt,33pt)),
      curve.line((40pt,16pt)),curve.close(mode:"straight")))
  #place(top+left,dx:102pt,dy:116pt,circle(radius:3pt,stroke:.9pt,fill:white))
  #wire(40pt,59pt,53pt,59pt)
  #wire(99pt,59pt,131pt,59pt)
  #wire(40pt,59pt,40pt,116pt)
  #wire(40pt,116pt,59pt,116pt)
  #wire(105pt,116pt,131pt,116pt)
  #wire(131pt,59pt,131pt,116pt)
  #place(top+left,dx:10pt,dy:40pt,text(size:7pt)[$V_("out")$]))
  #place(top+left,dx:126pt,dy:42pt,text(size:7pt)[$V_("in")$]))
  #place(top+left,dx:70pt,dy:55pt,text(size:8pt)[1]))
  #place(top+left,dx:70pt,dy:111pt,text(size:8pt)[2]))
  #place(top+left,dx:71pt,dy:154pt,text(size:8pt)[(a)]))
  // (b) two inverter VTC curves and three states A, C, B
  #wire(207pt,150pt,384pt,150pt)
  #wire(207pt,150pt,207pt,18pt)
  #place(top+left,dx:188pt,dy:7pt,text(size:7pt)[$V_("out")$]))
  #place(top+left,dx:376pt,dy:153pt,text(size:7pt)[$V_("in")$]))
  #place(top+left,dx:207pt,dy:30pt,
    curve(stroke:1.05pt,curve.move((0pt,0pt)),
      curve.cubic((42pt,1pt),(30pt,82pt),(89pt,84pt)),
      curve.cubic((121pt,85pt),(120pt,117pt),(156pt,120pt))))
  #place(top+left,dx:207pt,dy:30pt,
    curve(stroke:.85pt,curve.move((0pt,0pt)),
      curve.cubic((12pt,3pt),(16pt,52pt),(42pt,63pt)),
      curve.cubic((75pt,84pt),(100pt,110pt),(156pt,120pt))))
  #place(top+left,dx:242pt,dy:23pt,text(size:8pt)[A]))
  #place(top+left,dx:299pt,dy:79pt,text(size:8pt)[C]))
  #place(top+left,dx:370pt,dy:134pt,text(size:8pt)[B]))
  #place(top+left,dx:207pt,dy:157pt,text(size:7pt)[$V_("OL")$]))
  #place(top+left,dx:341pt,dy:157pt,text(size:7pt)[$V_("OH")$]))
  #place(top+left,dx:298pt,dy:170pt,text(size:8pt)[(b)]))
])
// Scanned Fig5.17 / Fig5.18. Both inputs, the two crossed feedback
// paths, output inversion bubbles, functional block, and all four truth
// table cases are native. Gray NOR/NAND text rectangles are eliminated.
#let sr-panel(kind:"nor") = {
  let isnor = kind == "nor"
  html.frame(block(width:402pt,height:194pt)[
    // (a) paired logic symbols, common gate geometry from Fig1.3 library
    #place(top+left,dx:37pt,dy:21pt,gate-outline(kind))
    #place(top+left,dx:37pt,dy:96pt,gate-outline(kind))
    #place(top+left,dx:92pt,dy:39pt,circle(radius:3pt,stroke:.9pt,fill:white))
    #place(top+left,dx:92pt,dy:114pt,circle(radius:3pt,stroke:.9pt,fill:white))
    #wire(95pt,39pt,141pt,39pt)
    #wire(95pt,114pt,141pt,114pt)
    #wire(12pt,30pt,43pt,30pt)
    #wire(12pt,124pt,43pt,124pt)
    // Cross-coupled paths: top output to bottom input; bottom to top.
    #wire(121pt,39pt,121pt,81pt)
    #wire(24pt,81pt,121pt,81pt)
    #wire(24pt,81pt,24pt,104pt)
    #wire(24pt,104pt,43pt,104pt)
    #wire(134pt,114pt,134pt,146pt)
    #wire(15pt,146pt,134pt,146pt)
    #wire(15pt,49pt,15pt,146pt)
    #wire(15pt,49pt,43pt,49pt)
    #place(top+left,dx:0pt,dy:23pt,text(size:8pt)[S]))
    #place(top+left,dx:0pt,dy:116pt,text(size:8pt)[R]))
    #if isnor [
      #place(top+left,dx:145pt,dy:31pt,text(size:7pt)[$bar(Q)$]))
      #place(top+left,dx:145pt,dy:107pt,text(size:7pt)[$Q$]))
    ] else [
      #place(top+left,dx:145pt,dy:31pt,text(size:7pt)[$Q$]))
      #place(top+left,dx:145pt,dy:107pt,text(size:7pt)[$bar(Q)$]))
    ]
    #place(top+left,dx:63pt,dy:162pt,text(size:8pt)[(a)]))
    // (b) functional box, active-low inputs shown as terminal circles.
    #place(top+left,dx:178pt,dy:62pt,rect(width:63pt,height:56pt,stroke:.9pt,fill:white))
    #wire(159pt,75pt,178pt,75pt)
    #wire(159pt,104pt,178pt,104pt)
    #wire(241pt,75pt,257pt,75pt)
    #wire(241pt,104pt,257pt,104pt)
    #if not isnor [
      #place(top+left,dx:175pt,dy:75pt,circle(radius:3pt,stroke:.85pt,fill:white))
      #place(top+left,dx:175pt,dy:104pt,circle(radius:3pt,stroke:.85pt,fill:white))
    ]
    #place(top+left,dx:185pt,dy:69pt,text(size:7pt)[S]))
    #place(top+left,dx:185pt,dy:98pt,text(size:7pt)[R]))
    #place(top+left,dx:223pt,dy:69pt,text(size:7pt)[$Q$]))
    #place(top+left,dx:223pt,dy:98pt,text(size:7pt)[$bar(Q)$]))
    #place(top+left,dx:200pt,dy:162pt,text(size:8pt)[(b)]))
    // (c) complete four-row truth table.
    #if isnor [
      #place(top+left,dx:269pt,dy:51pt,table(
        columns:(25pt,25pt,29pt,29pt),inset:2pt,stroke:none,
        table.header([*S*],[*R*],[*Q*],[*$bar(Q)$*]),
        [0],[0],[Q],[$bar(Q)$],
        [0],[1],[0],[1],
        [1],[0],[1],[0],
        [1],[1],[0],[0])))
    ] else [
      #place(top+left,dx:269pt,dy:51pt,table(
        columns:(25pt,25pt,29pt,29pt),inset:2pt,stroke:none,
        table.header([*S*],[*R*],[*Q*],[*$bar(Q)$*]),
        [1],[1],[Q],[$bar(Q)$],
        [0],[1],[1],[0],
        [1],[0],[0],[1],
        [0],[0],[1],[1])))
    ]
    #place(top+left,dx:322pt,dy:162pt,text(size:8pt)[(c)]))
    #if isnor [
      #place(top+left,dx:5pt,dy:184pt,text(size:7pt)[S=R=1禁止，两个输出都为低])
    ] else [
      #place(top+left,dx:5pt,dy:184pt,text(size:7pt)[输入同时为0禁止，两个输出都为高])
    ]
  ])
}
#let sr-nor() = sr-panel(kind:"nor")
#let sr-nand() = sr-panel(kind:"nand")
