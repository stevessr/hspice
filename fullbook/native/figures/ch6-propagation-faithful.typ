// Original native editable teaching figures for PDF209–210.
// Shapes are reconstructible Typst geometry and text; exact source geometry
// remains an open fidelity gate (not approved for 1:1 page acceptance).
#let trace(pts, weight: .9pt) = {
  for i in range(pts.len() - 1) {
    let a = pts.at(i)
    let b = pts.at(i + 1)
    place(top + left, dx: a.at(0), dy: a.at(1),
      line(end: (b.at(0) - a.at(0), b.at(1) - a.at(1)), stroke: weight))
  }
}
#let graph-panel(kind: "threshold") = html.frame(block(width:190pt,height:100pt)[
  #trace(((25pt,28pt),(45pt,28pt),(58pt,27pt),(66pt,21pt),(74pt,10pt),(83pt,5pt),(97pt,4pt),(153pt,4pt)))
  #trace(((28pt,78pt),(50pt,78pt),(68pt,73pt),(79pt,65pt),(87pt,50pt),(95pt,32pt),(104pt,26pt),(153pt,26pt)))
  #if kind=="negative" {
    #trace(((27pt,27pt),(48pt,27pt),(62pt,29pt),(73pt,39pt),(81pt,58pt),(95pt,72pt),(153pt,73pt)))
    #trace(((27pt,74pt),(48pt,72pt),(60pt,63pt),(72pt,50pt),(84pt,37pt),(98pt,31pt),(153pt,30pt)))
  }
  #if kind!="negative" {
    #place(top+left,dx:82pt,dy:7pt,line(end:(0pt,75pt),stroke:.55pt))
    #place(top+left,dx:98pt,dy:7pt,line(end:(0pt,75pt),stroke:.55pt))
  } else {
    #place(top+left,dx:74pt,dy:7pt,line(end:(0pt,75pt),stroke:.55pt))
    #place(top+left,dx:91pt,dy:7pt,line(end:(0pt,75pt),stroke:.55pt))
  }
  #place(top+left,dx:13pt,dy:18pt,text(size:7pt)[#if kind=="threshold" [与非门的 $V_s$] else [输入的50%点]])
  #place(top+left,dx:99pt,dy:38pt,text(size:7pt)[#if kind=="threshold" [或非门的 $V_s$] else [输出的50%点]])
  #place(top+left,dx:73pt,dy:85pt,text(size:7pt)[#if kind=="negative" [负的传播延迟] else [传播延迟]])
])
#let gate-chain() = html.frame(block(width:195pt,height:100pt)[
  #place(top+left,dx:10pt,dy:32pt,line(length:20pt,stroke:.8pt))
  #trace(((30pt,20pt),(30pt,55pt),(66pt,38pt),(30pt,20pt)))
  #place(top+left,dx:67pt,dy:35pt,circle(radius:1.9pt,stroke:.7pt))
  #place(top+left,dx:69pt,dy:38pt,line(length:28pt,stroke:.8pt))
  #place(top+left,dx:97pt,dy:22pt,rect(width:37pt,height:32pt,radius:5pt,stroke:.8pt))
  #place(top+left,dx:135pt,dy:35pt,circle(radius:1.9pt,stroke:.7pt))
  #place(top+left,dx:137pt,dy:38pt,line(length:18pt,stroke:.8pt))
  #trace(((155pt,21pt),(162pt,31pt),(164pt,38pt),(162pt,45pt),(155pt,55pt),(182pt,38pt),(155pt,21pt)))
  #place(top+left,dx:183pt,dy:35pt,circle(radius:1.9pt,stroke:.7pt))
  #place(top+left,dx:103pt,dy:12pt,text(size:7pt)[$a$]))
  #place(top+left,dx:147pt,dy:12pt,text(size:7pt)[$b$]))
  #place(top+left,dx:76pt,dy:65pt,text(size:7pt)[门的延迟]))
  #place(top+left,dx:90pt,dy:87pt,text(size:7pt)[(a)]))
])
#let figure-6-1() = {
  grid(columns:(1fr,1fr),column-gutter:7pt,row-gutter:1pt,
    [#gate-chain()],
    [#graph-panel(kind:"threshold")],
    [#graph-panel(kind:"fifty")],
    [#graph-panel(kind:"negative")])
}
#let rise-panel(falling:false) = html.frame(block(width:183pt,height:98pt)[
  #if falling {
    #trace(((20pt,13pt),(48pt,13pt),(59pt,14pt),(69pt,24pt),(80pt,43pt),(95pt,62pt),(112pt,71pt),(155pt,72pt)))
  } else {
    #trace(((20pt,72pt),(48pt,71pt),(59pt,68pt),(69pt,56pt),(80pt,39pt),(95pt,20pt),(112pt,15pt),(155pt,14pt)))
  }
  #place(top+left,dx:69pt,dy:8pt,line(end:(0pt,71pt),stroke:.55pt))
  #place(top+left,dx:99pt,dy:8pt,line(end:(0pt,71pt),stroke:.55pt))
  #place(top+left,dx:49pt,dy:28pt,text(size:6.8pt)[#if falling [90%] else [90%]])
  #place(top+left,dx:49pt,dy:60pt,text(size:6.8pt)[10%]))
  #place(top+left,dx:67pt,dy:84pt,text(size:7pt)[#if falling [下降时间] else [上升时间]])
])
#let figure-6-2() = grid(columns:(1fr,1fr),column-gutter:8pt,
  [#rise-panel()], [#rise-panel(falling:true)])
#let inverter-cell() = html.frame(block(width:175pt,height:135pt)[
  #place(top+left,dx:53pt,dy:6pt,text(size:8pt)[$V_("DD")$]))
  #trace(((67pt,21pt),(67pt,35pt),(67pt,52pt),(67pt,82pt),(67pt,109pt)))
  #place(top+left,dx:58pt,dy:39pt,line(end:(0pt,21pt),stroke:.9pt))
  #place(top+left,dx:61pt,dy:39pt,line(end:(0pt,21pt),stroke:.9pt))
  #place(top+left,dx:56pt,dy:72pt,line(end:(0pt,21pt),stroke:.9pt))
  #place(top+left,dx:61pt,dy:72pt,line(end:(0pt,21pt),stroke:.9pt))
  #place(top+left,dx:27pt,dy:51pt,text(size:8pt)[$V_("in")$]))
  #place(top+left,dx:89pt,dy:54pt,line(length:30pt,stroke:.8pt))
  #place(top+left,dx:123pt,dy:49pt,text(size:8pt)[$V_("out")$]))
  #place(top+left,dx:115pt,dy:75pt,text(size:8pt)[$C_L$]))
  #place(top+left,dx:67pt,dy:115pt,text(size:8pt)[GND]))
])
#let charge-model(up:true) = html.frame(block(width:175pt,height:135pt)[
  #place(top+left,dx:44pt,dy:14pt,text(size:8pt)[$V_("DD")$]))
  #place(top+left,dx:55pt,dy:28pt,line(end:(0pt,22pt),stroke:.85pt))
  #place(top+left,dx:46pt,dy:47pt,rect(width:26pt,height:31pt,stroke:.8pt))
  #place(top+left,dx:89pt,dy:47pt,text(size:8pt)[$I_("HL")$]))
  #place(top+left,dx:58pt,dy:79pt,line(end:(0pt,27pt),stroke:.85pt))
  #place(top+left,dx:53pt,dy:107pt,text(size:8pt)[$C_L$]))
  #place(top+left,dx:101pt,dy:67pt,text(size:8pt)[#if up [$t_("pLH")$] else [$t_("pHL")$]]))
])
#let figure-6-3() = {
  grid(columns:(1fr,1fr),column-gutter:10pt,row-gutter:1pt,
    [#inverter-cell()], [#charge-model()],
    [#charge-model(up:false)], [#block(width:170pt,height:125pt)[
        #text(size:8pt)[输出电容 $C_L$]
        #v(6pt)
        $I=C_L (dif V)/(dif t)$
        #v(6pt)
        #text(size:8pt)[输出从 $V_("OH")$ 到 $V_("DD")/2$]
    ]])
}
