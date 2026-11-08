// Editable Typst geometry for Appendix A, source PDF pages 420–432.
// A.1–A.13 are semantic reconstructions from the scanned figures, not
// measured curves or accepted pixel-for-pixel facsimiles.
#let s(x, y, dx, dy, w: .8pt) = place(top + left, dx: x, dy: y,
  line(end: (dx, dy), stroke: w))
#let t(x, y, body, size: 7pt) = place(top + left, dx: x, dy: y,
  text(size: size, body))
#let r(x, y, w, h) = place(top + left, dx: x, dy: y,
  rect(width: w, height: h, stroke: .85pt, fill: white))
#let p(x, y) = place(top + left, dx: x, dy: y,
  circle(radius: 1.7pt, fill: black))

#let spice-flow() = html.frame(block(width: 338pt, height: 116pt)[
  #t(5pt, 3pt, [图 A.1　典型的 SPICE 设计流程])
  #r(10pt, 25pt, 78pt, 66pt)
  #t(17pt, 33pt, [SPICE Deck])
  #t(17pt, 48pt, [**SPICE Code**])
  #t(17pt, 71pt, [END])
  #s(90pt, 57pt, 34pt, 0pt)
  #place(top + left, dx: 121pt, dy: 54pt,
    polygon((0pt, -4pt), (7pt, 0pt), (0pt, 4pt), fill: black))
  #r(133pt, 34pt, 54pt, 43pt)
  #t(143pt, 40pt, [模拟])
  #t(138pt, 56pt, [SPICE])
  #s(189pt, 57pt, 28pt, 0pt)
  #place(top + left, dx: 214pt, dy: 54pt,
    polygon((0pt, -4pt), (7pt, 0pt), (0pt, 4pt), fill: black))
  #s(229pt, 89pt, 101pt, 0pt)
  #s(229pt, 89pt, 0pt, -59pt)
  #t(231pt, 16pt, [NMOS 的 $I$–$V$ 特性])
  #for j in range(3) [
    #let rise = (j + 1) * 13pt
    #place(top + left, dx: 230pt, dy: 86pt,
      curve(stroke: 1pt, curve.move((0pt, 0pt)),
        curve.cubic((17pt, -rise), (43pt, -rise), (94pt, -rise))))
  ]
  #t(308pt, 92pt, [$V_("DS")$])
])

#let cmos-inverter() = html.frame(block(width: 338pt, height: 141pt)[
  #t(7pt, 3pt, [图 A.2 / A.13　CMOS 反相器及负载])
  #t(148pt, 14pt, [节点1 / $V_("DD")$])
  #s(161pt, 28pt, 0pt, 17pt)
  #r(152pt, 46pt, 18pt, 22pt)
  #t(180pt, 49pt, [Mp])
  #s(161pt, 68pt, 0pt, 22pt)
  #p(161pt, 88pt)
  #s(161pt, 89pt, 77pt, 0pt)
  #t(242pt, 83pt, [节点3 / $V_("out")$])
  #r(152pt, 96pt, 18pt, 22pt)
  #t(180pt, 99pt, [Mn])
  #s(161pt, 118pt, 0pt, 10pt)
  #s(147pt, 128pt, 28pt, 0pt)
  #s(153pt, 132pt, 16pt, 0pt)
  #s(158pt, 136pt, 6pt, 0pt)
  #s(101pt, 58pt, 48pt, 0pt)
  #s(101pt, 107pt, 48pt, 0pt)
  #s(101pt, 58pt, 0pt, 49pt)
  #t(14pt, 77pt, [节点2 / $V_("in")$])
  #s(68pt, 83pt, 33pt, 0pt)
  #t(248pt, 102pt, [$C_("load")=10 " fF"$])
  #s(238pt, 89pt, 0pt, 17pt)
  #s(231pt, 106pt, 14pt, 0pt)
  #s(231pt, 111pt, 14pt, 0pt)
  #s(238pt, 111pt, 0pt, 15pt)
  #s(227pt, 128pt, 22pt, 0pt)
  #s(232pt, 132pt, 12pt, 0pt)
])

// Source PDF424 Figure A.3: the printed resistor is a zigzag (not a box).
#let a3-resistor() = html.frame(block(width:338pt,height:69pt)[
  #t(7pt, 3pt, [图 A.3　一个电阻被动元件])
  #s(61pt, 40pt, 51pt, 0pt)
  #s(112pt, 40pt, 7pt, -8pt, w:1.1pt)
  #s(119pt, 32pt, 12pt, 16pt, w:1.1pt)
  #s(131pt, 48pt, 12pt, -16pt, w:1.1pt)
  #s(143pt, 32pt, 12pt, 16pt, w:1.1pt)
  #s(155pt, 48pt, 12pt, -16pt, w:1.1pt)
  #s(167pt, 32pt, 12pt, 8pt, w:1.1pt)
  #s(179pt, 40pt, 49pt, 0pt)
  #t(47pt, 33pt, [5])
  #t(233pt, 33pt, [0])
  #t(139pt, 17pt, [R5])
  #t(138pt, 26pt, [10k])
])

// Source PDF424 Figure A.4: 3=gate, 2=drain, 0=source, 0=body.
// Both body and source are separately tied to ground in the original drawing.
#let a4-mos() = html.frame(block(width:338pt,height:110pt)[
  #t(7pt, 3pt, [图 A.4　一个MOS晶体管])
  #s(133pt, 13pt, 0pt, 24pt)
  #t(127pt, 6pt, [2])
  #s(133pt, 37pt, 0pt, 43pt, w:1.2pt)
  #s(125pt, 37pt, 0pt, 43pt, w:1.1pt)
  #s(83pt, 59pt, 42pt, 0pt)
  #t(74pt, 54pt, [3])
  #s(133pt, 80pt, 0pt, 12pt)
  #s(121pt, 92pt, 24pt, 0pt)
  #s(126pt, 96pt, 14pt, 0pt)
  #s(131pt, 100pt, 4pt, 0pt)
  #t(145pt, 91pt, [0])
  // Body contact and its own grounded connection.
  #s(133pt, 59pt, 54pt, 0pt)
  #s(187pt, 59pt, 0pt, 33pt)
  #s(175pt, 92pt, 24pt, 0pt)
  #s(180pt, 96pt, 14pt, 0pt)
  #s(185pt, 100pt, 4pt, 0pt)
  #t(199pt, 91pt, [0])
])
// Source PDF425 Figure A.5: independent voltage and current source symbols,
// with separate terminal numbers and polarity/direction labels.
#let a5-sources() = html.frame(block(width:338pt,height:110pt)[
  #t(9pt, 3pt, [图 A.5　电压源和电流源])
  #for x in (85pt, 225pt) [
    #s(x, 18pt, 0pt, 25pt)
    #place(top + left, dx:x,dy:56pt,circle(radius:13pt,stroke:1pt,fill:white))
    #s(x, 69pt, 0pt, 22pt)
  ]
  #t(80pt, 11pt, [5])
  #t(220pt, 11pt, [2])
  #t(80pt, 93pt, [0])
  #t(220pt, 93pt, [3])
  #t(81pt, 48pt, [V])
  #t(101pt, 40pt, [$+$])
  #t(101pt, 61pt, [$-$])
  #t(108pt, 46pt, [$V_("supply")$])
  #t(108pt, 62pt, [15 V])
  // Upward arrow matches the source drawing, independent of parameter Icc.
  #s(225pt, 65pt, 0pt, -20pt)
  #place(top + left,dx:222pt,dy:44pt,
    polygon((0pt,5pt),(3pt,0pt),(6pt,5pt),fill:black))
  #t(248pt, 46pt, [$I_("supply")$])
  #t(248pt, 61pt, [12 A])
])
#let a6-pulse() = html.frame(block(width: 338pt, height: 137pt)[
  #t(6pt, 2pt, [图 A.6　PULSE 与 PWL 的一周期波形])
  #s(36pt, 112pt, 291pt, 0pt)
  #s(36pt, 112pt, 0pt, -88pt)
  #t(5pt, 18pt, [$V$ (V)])
  #t(285pt, 118pt, [$t$ (ns)])
  #s(39pt, 95pt, 11pt, 0pt, w: 1.4pt)
  #s(50pt, 95pt, 17pt, -62pt, w: 1.4pt)
  #s(67pt, 33pt, 103pt, 0pt, w: 1.4pt)
  #s(170pt, 33pt, 16pt, 62pt, w: 1.4pt)
  #s(186pt, 95pt, 91pt, 0pt, w: 1.4pt)
  #s(277pt, 95pt, 17pt, -62pt, w: 1.4pt)
  #t(17pt, 30pt, [+1])
  #t(17pt, 91pt, [−1])
  #for (x, lab) in ((50pt,[2]),(67pt,[6]),(170pt,[26]),(186pt,[29]),(277pt,[52]),(294pt,[56])) [
    #s(x, 110pt, 0pt, 4pt)
    #t(x - 4pt, 117pt, lab)
  ]
])

// PDF427 / printed page 408: Figure A.7 is a SERIES RLC with a zigzag R,
 // two-plate C, and a WOUND L; four consecutive nodes 1-2-3-4.
#let a7-rlc() = html.frame(block(width:338pt,height:90pt)[
  #t(8pt,2pt,[图 A.7　一个 RLC 电路])
  // Node 1 to R7.
  #s(53pt,54pt,36pt,0pt)
  // R7: source uses a zigzag, not the previous rectangle placeholder.
  #s(89pt,54pt,5pt,-8pt,w:1pt)
  #s(94pt,46pt,8pt,16pt,w:1pt)
  #s(102pt,62pt,8pt,-16pt,w:1pt)
  #s(110pt,46pt,8pt,16pt,w:1pt)
  #s(118pt,62pt,6pt,-8pt,w:1pt)
  #s(124pt,54pt,21pt,0pt)
  // C_in two electrically separated plates.
  #s(145pt,38pt,0pt,32pt,w:1.2pt)
  #s(153pt,38pt,0pt,32pt,w:1.2pt)
  #s(153pt,54pt,35pt,0pt)
  // L_big : four continuous coil humps followed by node 4 wire.
  #place(top + left,dx:188pt,dy:54pt,
    curve(stroke:1pt,curve.move((0pt,0pt)),
      curve.cubic((2pt,-13pt),(12pt,-13pt),(14pt,0pt)),
      curve.cubic((16pt,-13pt),(26pt,-13pt),(28pt,0pt)),
      curve.cubic((30pt,-13pt),(40pt,-13pt),(42pt,0pt)),
      curve.cubic((44pt,-13pt),(54pt,-13pt),(56pt,0pt))))
  #s(244pt,54pt,28pt,0pt)
  #t(91pt,17pt,[R7])
  #t(88pt,29pt,[17 Meg])
  #t(136pt,17pt,[$C_("in")$])
  #t(135pt,29pt,[1.5 fF])
  #t(208pt,17pt,[$L_("big")$])
  #t(205pt,29pt,[0.7 mH])
  #t(50pt,58pt,[1])
  #t(132pt,58pt,[2])
  #t(176pt,58pt,[3])
  #t(268pt,58pt,[4])
])
// PDF428 / printed page 409: Figure A.8 uses one combined source symbol,
// with data nodes 2,3, NMOS gate=1 at top, PMOS gate=0 at bottom (bubble).
#let a8-pass-gate() = html.frame(block(width:338pt,height:115pt)[
  #t(7pt,2pt,[图 A.8　一个传输门])
  #t(161pt,12pt,[1])
  #s(169pt,22pt,0pt,20pt)
  #s(155pt,42pt,28pt,0pt)
  #s(169pt,42pt,0pt,13pt)
  // The original represents parallel nMOS and pMOS channels in a compact gate.
  #place(top + left,dx:136pt,dy:55pt,
    rect(width:66pt,height:37pt,stroke:.9pt,fill:white))
  #s(136pt,73pt,-38pt,0pt)
  #s(202pt,73pt,38pt,0pt)
  #s(137pt,63pt,12pt,0pt)
  #s(149pt,63pt,0pt,19pt,w:1.1pt)
  #s(161pt,63pt,0pt,19pt,w:1.1pt)
  #s(161pt,73pt,16pt,0pt)
  #s(177pt,63pt,0pt,19pt,w:1.1pt)
  #s(190pt,63pt,0pt,19pt,w:1.1pt)
  #s(190pt,73pt,12pt,0pt)
  #s(169pt,92pt,0pt,3pt)
  #place(top + left,dx:169pt,dy:98pt,
    circle(radius:3pt,stroke:.75pt,fill:white))
  #s(169pt,101pt,0pt,6pt)
  #t(166pt,107pt,[0])
  #t(86pt,65pt,[2])
  #t(247pt,65pt,[3])
])
// PDF428, Fig A.9: voltage source, 1k zigzag R and 1uF C,
// plus source-like first-order RC exponential, not a decorative generic curve.
#let a9-rc-step() = html.frame(block(width:338pt,height:144pt)[
  #t(6pt,2pt,[图 A.9　一个 RC 电路与电容端电压的阶跃响应])
  // V_source source circle / +/- and closed return to capacitor.
  #place(top + left,dx:34pt,dy:76pt,circle(radius:12pt,stroke:.85pt,fill:white))
  #t(31pt,61pt,[$+$])
  #t(31pt,82pt,[$-$])
  #t(15pt,54pt,[10 V])
  #s(34pt,64pt,0pt,-18pt)
  #s(34pt,46pt,25pt,0pt)
  // R1=1k zigzag above the node Vc.
  #s(59pt,46pt,5pt,-7pt)
  #s(64pt,39pt,8pt,14pt)
  #s(72pt,53pt,8pt,-14pt)
  #s(80pt,39pt,8pt,14pt)
  #s(88pt,53pt,5pt,-7pt)
  #s(93pt,46pt,22pt,0pt)
  #p(115pt,46pt)
  #t(66pt,24pt,[$R_1$])
  #t(67pt,31pt,[1k])
  #t(117pt,29pt,[$V_C$])
  // Capacitor C=1uF to return and source bottom.
  #s(115pt,46pt,0pt,34pt)
  #s(105pt,80pt,20pt,0pt,w:1.1pt)
  #s(105pt,88pt,20pt,0pt,w:1.1pt)
  #s(115pt,88pt,0pt,24pt)
  #s(115pt,112pt,-81pt,0pt)
  #s(34pt,112pt,0pt,-24pt)
  #t(120pt,78pt,[$C$])
  #t(122pt,90pt,[1μF])
  // Plot axes x=175..326, t=0..12ms, y=18..117, Vc=0..10V.
  #s(173pt,116pt,158pt,0pt)
  #s(173pt,116pt,0pt,-97pt)
  #s(173pt,26pt,155pt,0pt,w:.4pt)
  #t(148pt,18pt,[10])
  #t(162pt,110pt,[0])
  #t(281pt,122pt,[时间 t (ms)])
  #t(147pt,49pt,[$V_C$ (V)])
  #place(top + left,dx:173pt,dy:116pt,
    curve(stroke:1.3pt,curve.move((0pt,0pt)),
      curve.cubic((10pt,-53pt),(27pt,-76pt),(43pt,-84pt)),
      curve.cubic((66pt,-91pt),(97pt,-91pt),(153pt,-91pt))))
  #t(219pt,9pt,[RC 电路的阶跃响应])
])
// PDF429 Fig A.10: R2 is series/top branch and R1 is vertical to return.
// Source Vm from 0 to 10V gives node Vr from 0 to 5V.
#let a10-divider() = html.frame(block(width:338pt,height:139pt)[
  #t(6pt,2pt,[图 A.10　电压除法器和直流扫描])
  // The independent voltage source is at left.
  #place(top + left,dx:36pt,dy:66pt,circle(radius:12pt,stroke:.85pt,fill:white))
  #t(30pt,59pt,[$V_1$])
  #t(46pt,57pt,[$V_("source")$])
  #s(36pt,54pt,0pt,-17pt)
  #s(36pt,37pt,31pt,0pt)
  // Upper series resistor R2=1k in original.
  #s(67pt,37pt,5pt,-7pt)
  #s(72pt,30pt,7pt,14pt)
  #s(79pt,44pt,7pt,-14pt)
  #s(86pt,30pt,7pt,14pt)
  #s(93pt,44pt,5pt,-7pt)
  #s(98pt,37pt,19pt,0pt)
  #p(117pt,37pt)
  #t(71pt,12pt,[$R_2$])
  #t(73pt,20pt,[1k])
  #t(119pt,21pt,[$V_r$])
  #s(117pt,37pt,0pt,19pt)
  // Vertical resistor R1 from Vr to source negative.
  #s(117pt,56pt,-6pt,5pt)
  #s(111pt,61pt,12pt,7pt)
  #s(123pt,68pt,-12pt,7pt)
  #s(111pt,75pt,12pt,7pt)
  #s(123pt,82pt,-6pt,5pt)
  #s(117pt,87pt,0pt,16pt)
  #s(117pt,103pt,-81pt,0pt)
  #s(36pt,103pt,0pt,-25pt)
  #t(124pt,62pt,[$R_1$])
  #t(125pt,75pt,[1k])
  // The graph is linear: 0..10 Vsource maps to 0..5 Vr.
  #s(169pt,111pt,162pt,0pt)
  #s(169pt,111pt,0pt,-85pt)
  #s(169pt,111pt,133pt,-70pt,w:1.35pt)
  #t(158pt,12pt,[$V_r$ (V)])
  #t(158pt,105pt,[0])
  #t(151pt,39pt,[5])
  #t(287pt,116pt,[$V_("source")$ (V)])
  #t(286pt,107pt,[10])
  #t(221pt,10pt,[$R_1$ 两端的电压])
])
#let a11-nmos-curves() = html.frame(block(width: 338pt, height: 125pt)[
  #t(5pt, 3pt, [图 A.11 / A.12　NMOS 的 $I_("DS")$–$V_("DS")$ 输出特性])
  #s(37pt, 103pt, 284pt, 0pt)
  #s(37pt, 103pt, 0pt, -82pt)
  #t(1pt, 12pt, [$I_("DS")$])
  #t(259pt, 109pt, [$V_("DS")$ (V)])
  #for i in range(5) [
    #let lift = (i + 1)*14pt
    #place(top + left,dx:38pt,dy:102pt,
      curve(stroke: .9pt, curve.move((0pt,0pt)),
        curve.cubic((35pt,-lift),(75pt,-lift - 2pt),(277pt,-lift - 3pt))))
  ]
  #t(223pt, 20pt, [$V_("GS")$ 越大，$I_("DS")$ 越大])
])

#let a13-transient() = html.frame(block(width: 338pt, height: 125pt)[
  #t(6pt, 3pt, [图 A.13　CMOS 反相器的瞬态响应])
  #s(38pt, 104pt, 288pt, 0pt)
  #s(38pt, 104pt, 0pt, -83pt)
  #t(10pt, 23pt, [1.8])
  #t(10pt, 100pt, [0])
  #t(274pt, 109pt, [$t$ (ns)])
  #s(39pt, 29pt, 52pt, 0pt, w: 1.3pt)
  #s(91pt, 29pt, 4pt, 72pt, w: 1.3pt)
  #s(95pt, 101pt, 94pt, 0pt, w: 1.3pt)
  #s(189pt, 101pt, 5pt, -72pt, w: 1.3pt)
  #s(194pt, 29pt, 97pt, 0pt, w: 1.3pt)
  #t(108pt, 12pt, [输出与输入逻辑反相])
])
