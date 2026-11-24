// Editorial redraws from PDF147–156, entirely native Typst.
 // Curves are qualitative, NOT digitized data; layout is schematic.
#let five-regions() = html.frame(block(width:350pt,height:175pt)[
 #place(top + left,dx:12pt,dy:4pt,text(size:8pt)[图4.12(c) CMOS 静态VTC及工作区])
 #place(top + left,dx:34pt,dy:147pt,line(length:299pt,stroke:.9pt))
 #place(top + left,dx:34pt,dy:147pt,line(end:(0pt,-119pt),stroke:.9pt))
 #place(top + left,dx:36pt,dy:36pt,
  curve(stroke:1.3pt,curve.move((0pt,0pt)),
   curve.cubic((155pt,0pt),(103pt,103pt),(293pt,103pt))))
 #place(top + left,dx:36pt,dy:146pt,line(end:(294pt,-110pt),stroke:(dash:"dashed",thickness:.6pt)))
 #place(top + left,dx:12pt,dy:23pt,text(size:7pt)[$V_("out")$]))
 #place(top + left,dx:316pt,dy:153pt,text(size:7pt)[$V_("in")$]))
 #place(top + left,dx:40pt,dy:16pt,text(size:7pt)[I：n-off / p-lin]))
 #place(top + left,dx:106pt,dy:55pt,text(size:7pt)[II：n-sat / p-lin]))
 #place(top + left,dx:170pt,dy:78pt,text(size:7pt)[III]))
 #place(top + left,dx:213pt,dy:112pt,text(size:7pt)[IV：n-lin / p-sat]))
 #place(top + left,dx:276pt,dy:125pt,text(size:7pt)[V]))
 #place(top + left,dx:43pt,dy:162pt,text(size:7pt)[$V_("TN")$]))
 #place(top + left,dx:266pt,dy:162pt,text(size:7pt)[$V_("DD")-|V_("TP")|$]))
])
#let through-current() = html.frame(block(width:350pt,height:135pt)[
 #place(top + left,dx:10pt,dy:6pt,text(size:7.5pt)[图4.12(c) 直流穿通电流的变化趋势])
 #place(top + left,dx:33pt,dy:111pt,line(length:289pt,stroke:.8pt))
 #place(top + left,dx:33pt,dy:111pt,line(end:(0pt,-90pt),stroke:.8pt))
 #place(top + left,dx:36pt,dy:111pt,curve(stroke:1.3pt,curve.move((0pt,0pt)),
    curve.cubic((101pt,0pt),(106pt,-77pt),(135pt,-77pt)),
    curve.cubic((162pt,-77pt),(164pt,0pt),(280pt,0pt))))
 #place(top + left,dx:9pt,dy:23pt,text(size:7pt)[$I_("DN")=I_("DP")$]))
 #place(top + left,dx:298pt,dy:114pt,text(size:7pt)[$V_("in")$]))
 #place(top + left,dx:40pt,dy:120pt,text(size:7pt)[I]))
 #place(top + left,dx:112pt,dy:120pt,text(size:7pt)[II]))
 #place(top + left,dx:165pt,dy:120pt,text(size:7pt)[III]))
 #place(top + left,dx:217pt,dy:120pt,text(size:7pt)[IV]))
 #place(top + left,dx:300pt,dy:120pt,text(size:7pt)[V]))
])
#let cmos-layout() = html.frame(block(width:360pt,height:254pt)[
 // Editable geometry follows source Fig.4.13: side rails, p/n wells,
 // two central drain contacts, T-shaped metal output and U-shaped poly input.
 #place(top + left,dx:143pt,dy:4pt,text(size:8.5pt,weight:"bold")[平面视图])
 #place(top + left,dx:17pt,dy:34pt,rect(width:326pt,height:172pt,
   stroke:.7pt,fill:rgb("#fafafa")))
 // p well (left) and n well (right), split at middle.
 #place(top + left,dx:28pt,dy:42pt,rect(width:148pt,height:156pt,
   fill:rgb("#e1e1e1"),stroke:.5pt))
 #place(top + left,dx:182pt,dy:42pt,rect(width:147pt,height:156pt,
   fill:rgb("#ebebeb"),stroke:.5pt))
 // Bottom diffusion islands, darker than the wells.
 #place(top + left,dx:69pt,dy:100pt,rect(width:94pt,height:73pt,
   fill:rgb("#bdbdbd"),stroke:.6pt))
 #place(top + left,dx:195pt,dy:100pt,rect(width:93pt,height:73pt,
   fill:rgb("#c3c3c3"),stroke:.6pt))
 // Ground rail and supply rail, each with a well tie and source contact.
 #place(top + left,dx:31pt,dy:40pt,rect(width:30pt,height:160pt,
   fill:rgb("#a5a5a5"),stroke:.7pt))
 #place(top + left,dx:296pt,dy:40pt,rect(width:30pt,height:160pt,
   fill:rgb("#a5a5a5"),stroke:.7pt))
 #place(top + left,dx:36pt,dy:104pt,rect(width:20pt,height:20pt,
   fill:rgb("#262626"),stroke:.5pt))
 #place(top + left,dx:36pt,dy:150pt,rect(width:20pt,height:20pt,
   fill:rgb("#262626"),stroke:.5pt))
 #place(top + left,dx:301pt,dy:104pt,rect(width:20pt,height:20pt,
   fill:rgb("#262626"),stroke:.5pt))
 #place(top + left,dx:301pt,dy:150pt,rect(width:20pt,height:20pt,
   fill:rgb("#262626"),stroke:.5pt))
 // Source's polysilicon U: shared input at bottom, crosses both diffusions.
 #place(top + left,dx:75pt,dy:107pt,rect(width:16pt,height:74pt,
   fill:rgb("#999999"),stroke:.65pt))
 #place(top + left,dx:265pt,dy:107pt,rect(width:16pt,height:74pt,
   fill:rgb("#999999"),stroke:.65pt))
 #place(top + left,dx:75pt,dy:170pt,rect(width:206pt,height:15pt,
   fill:rgb("#999999"),stroke:.65pt))
 // Central T-metal trunk and branch; source figure has two drain contacts.
 #place(top + left,dx:164pt,dy:40pt,rect(width:29pt,height:113pt,
   fill:rgb("#777777"),stroke:.8pt))
 #place(top + left,dx:132pt,dy:141pt,rect(width:93pt,height:20pt,
   fill:rgb("#777777"),stroke:.8pt))
 #place(top + left,dx:123pt,dy:127pt,rect(width:22pt,height:45pt,
   fill:rgb("#777777"),stroke:.7pt))
 #place(top + left,dx:212pt,dy:127pt,rect(width:22pt,height:45pt,
   fill:rgb("#777777"),stroke:.7pt))
 #place(top + left,dx:125pt,dy:140pt,rect(width:18pt,height:18pt,
   fill:rgb("#212121"),stroke:.6pt))
 #place(top + left,dx:214pt,dy:140pt,rect(width:18pt,height:18pt,
   fill:rgb("#212121"),stroke:.6pt))
 // Printed labels with left/right well assignment and contact annotations.
 #place(top + left,dx:24pt,dy:18pt,text(size:8pt)[Gnd]))
 #place(top + left,dx:296pt,dy:18pt,text(size:8pt)[$V_("DD")$]))
 #place(top + left,dx:145pt,dy:24pt,text(size:8pt)[输出]))
 #place(top + left,dx:108pt,dy:80pt,text(size:8pt)[$p$ 阱]))
 #place(top + left,dx:238pt,dy:80pt,text(size:8pt)[$n$ 阱]))
 #place(top + left,dx:156pt,dy:210pt,text(size:8pt)[输入]))
 #place(top + left,dx:45pt,dy:211pt,text(size:7pt)[扩散]))
 #place(top + left,dx:70pt,dy:229pt,text(size:7pt)[多晶硅]))
 #place(top + left,dx:174pt,dy:229pt,text(size:7pt)[金属层1]))
 #place(top + left,dx:274pt,dy:229pt,text(size:7pt)[接触点]))
 #place(top + left,dx:4pt,dy:91pt,text(size:7pt)[阱塞]))
 #place(top + left,dx:325pt,dy:91pt,text(size:7pt)[阱塞]))
])
#let pseudo-nmos() = html.frame(block(width:348pt,height:174pt)[
 #place(top + left,dx:12pt,dy:5pt,text(size:8pt)[图4.14(b) 伪NMOS反相器])
 #place(top + left,dx:105pt,dy:20pt,line(end:(0pt,23pt),stroke:.9pt))
 #place(top + left,dx:76pt,dy:21pt,text(size:8pt)[$V_("DD")$]))
 #place(top + left,dx:105pt,dy:45pt,line(end:(0pt,35pt),stroke:.9pt))
 #place(top + left,dx:95pt,dy:49pt,line(end:(0pt,25pt),stroke:1.3pt))
 #place(top + left,dx:89pt,dy:61pt,circle(radius:3.1pt,stroke:.8pt,fill:white))
 #place(top + left,dx:46pt,dy:61pt,line(length:39pt,stroke:.8pt))
 #place(top + left,dx:23pt,dy:54pt,text(size:8pt)[GND]))
 #place(top + left,dx:105pt,dy:82pt,line(end:(0pt,30pt),stroke:.9pt))
 #place(top + left,dx:105pt,dy:89pt,line(length:69pt,stroke:.9pt))
 #place(top + left,dx:179pt,dy:85pt,text(size:8pt)[$V_("out")$]))
 #place(top + left,dx:95pt,dy:111pt,line(end:(0pt,30pt),stroke:1.3pt))
 #place(top + left,dx:105pt,dy:111pt,line(end:(0pt,32pt),stroke:.9pt))
 #place(top + left,dx:48pt,dy:127pt,line(length:46pt,stroke:.8pt))
 #place(top + left,dx:11pt,dy:120pt,text(size:8pt)[$V_("in")$]))
 #place(top + left,dx:105pt,dy:145pt,line(end:(0pt,20pt),stroke:.8pt))
 #place(top + left,dx:93pt,dy:166pt,line(length:24pt,stroke:.8pt))
 #place(top + left,dx:204pt,dy:55pt,text(size:8pt)[PMOS：常导通上拉]))
 #place(top + left,dx:204pt,dy:123pt,text(size:8pt)[NMOS：输入控制下拉]))
])

// Figure for PDF152 / printed 133, based on the source example's labeled VTC landmarks.
// Native geometric curve is an editorial interpolation, not raw SPICE measurement data.
#let cmos-example-vtc() = html.frame(block(width:360pt,height:211pt)[
 #place(top + left,dx:114pt,dy:4pt,text(size:8pt,weight:"bold")[CMOS VTC])
 #place(top + left,dx:34pt,dy:159pt,line(length:282pt,stroke:.9pt))
 #place(top + left,dx:34pt,dy:159pt,line(end:(0pt,-135pt),stroke:.9pt))
 // Example VTC: V_OH=1.8, V_OL=0, V_S=0.8; steep source-like transition.
 #place(top + left,dx:36pt,dy:34pt,
  curve(stroke:1.6pt,curve.move((0pt,0pt)),
   curve.cubic((70pt,0pt),(93pt,1pt),(106pt,10pt)),
   curve.cubic((116pt,22pt),(116pt,109pt),(137pt,120pt)),
   curve.cubic((163pt,126pt),(236pt,125pt),(280pt,125pt))))
 // Dashed reference y = x (mapped to the same voltage scale).
 #place(top + left,dx:35pt,dy:159pt,line(end:(252pt,-126pt),stroke:(dash:"dashed",thickness:.6pt)))
 // Three measured vertical guides at V_IL=0.626, V_S=0.8 and V_IH=0.909 V.
 #place(top + left,dx:123.6pt,dy:43pt,line(end:(0pt,117pt),stroke:(dash:"dashed",thickness:.6pt)))
 #place(top + left,dx:148pt,dy:93pt,line(end:(0pt,67pt),stroke:(dash:"dashed",thickness:.6pt)))
 #place(top + left,dx:161.3pt,dy:45pt,line(end:(0pt,115pt),stroke:(dash:"dashed",thickness:.6pt)))
 #place(top + left,dx:10pt,dy:24pt,text(size:7pt)[$V_("out")$]))
 #place(top + left,dx:315pt,dy:165pt,text(size:7pt)[$V_("in")$]))
 #place(top + left,dx:11pt,dy:31pt,text(size:7pt)[1.8]))
 #place(top + left,dx:22pt,dy:155pt,text(size:7pt)[0]))
 #place(top + left,dx:32pt,dy:166pt,text(size:7pt)[0]))
 #place(top + left,dx:272pt,dy:166pt,text(size:7pt)[1.8]))
 #place(top + left,dx:309pt,dy:166pt,text(size:7pt)[2.0]))
 #place(top + left,dx:64pt,dy:187pt,text(size:7pt)[$V_("IL")=0.626 " V"$]))
 #place(top + left,dx:148pt,dy:199pt,text(size:7pt)[$V_S=0.8 " V"$]))
 #place(top + left,dx:207pt,dy:187pt,text(size:7pt)[$V_("IH")=0.909 " V"$]))
 #place(top + left,dx:45pt,dy:28pt,text(size:7pt)[$V_("OH")=1.8 " V"$]))
 #place(top + left,dx:210pt,dy:146pt,text(size:7pt)[$V_("OL")=0 " V"$]))
])
