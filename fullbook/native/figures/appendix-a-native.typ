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
#let a5-sources() = html.frame(block(width: 338pt, height: 103pt)[
  #t(8pt, 2pt, [图 A.5　独立电压源和电流源])
  #for x in (90pt, 235pt) [
    #s(x, 18pt, 0pt, 23pt)
    #place(top + left, dx:x,dy:55pt,circle(radius:13pt,stroke:1pt,fill:white))
    #s(x, 68pt, 0pt, 19pt)
  ]
  #t(85pt, 12pt, [5])
  #t(229pt, 12pt, [2])
  #t(85pt, 89pt, [0])
  #t(229pt, 89pt, [3])
  #t(86pt, 47pt, [V])
  #s(235pt, 60pt, 0pt, -11pt)
  #place(top + left,dx:232pt,dy:48pt,
    polygon((0pt, 4pt),(3pt, 0pt),(6pt,4pt),fill:black))
  #t(105pt, 44pt, [$15 " V"$])
  #t(251pt, 44pt, [$I_("cc")$])
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

#let a7-rlc() = html.frame(block(width: 338pt, height: 84pt)[
  #t(7pt, 2pt, [图 A.7　串联 RLC 电路])
  #s(35pt, 43pt, 38pt, 0pt)
  #r(73pt, 34pt, 46pt, 18pt)
  #t(75pt, 21pt, [R7 / 17 Meg])
  #s(119pt, 43pt, 22pt, 0pt)
  #s(141pt, 31pt, 0pt, 25pt)
  #s(151pt, 31pt, 0pt, 25pt)
  #t(135pt, 21pt, [Cin / 1.5 fF])
  #s(151pt, 43pt, 31pt, 0pt)
  #for x in (185pt,202pt,219pt) [
    #place(top + left, dx:x,dy:43pt,circle(radius:9pt,stroke:.8pt,fill:white))
  ]
  #s(228pt, 43pt, 35pt, 0pt)
  #t(191pt, 21pt, [Lbig / 0.7 mH])
  #for (x, lab) in ((32pt,[1]),(133pt,[2]),(174pt,[3]),(266pt,[4])) [
    #t(x, 57pt, lab)
  ]
])

#let a8-pass-gate() = html.frame(block(width: 338pt, height: 107pt)[
  #t(8pt, 3pt, [图 A.8　互补 CMOS 传输门（简化符号）])
  #s(72pt, 54pt, 48pt, 0pt)
  #s(120pt, 54pt, 0pt, -22pt)
  #s(120pt, 54pt, 0pt, 25pt)
  #r(120pt, 22pt, 90pt, 23pt)
  #r(120pt, 70pt, 90pt, 23pt)
  #t(138pt, 24pt, [PMOS / Mp])
  #t(138pt, 72pt, [NMOS / Mn])
  #s(210pt, 32pt, 0pt, 22pt)
  #s(210pt, 54pt, 0pt, 25pt)
  #s(210pt, 54pt, 55pt, 0pt)
  #t(64pt, 57pt, [2])
  #t(270pt, 57pt, [3])
  #t(172pt, 7pt, [栅极0])
  #t(173pt, 94pt, [栅极1])
])

#let a9-rc-step() = html.frame(block(width: 338pt, height: 141pt)[
  #t(4pt, 2pt, [图 A.9　RC 阶跃输入与电容充电])
  #t(3pt, 29pt, [10 V])
  #t(10pt, 81pt, [电压源])
  #s(26pt, 46pt, 19pt, 0pt)
  #r(45pt, 40pt, 36pt, 13pt)
  #t(49pt, 28pt, [1 kΩ])
  #s(81pt, 46pt, 30pt, 0pt)
  #s(110pt, 46pt, 0pt, 12pt)
  #s(102pt, 58pt, 17pt, 0pt)
  #s(102pt, 64pt, 17pt, 0pt)
  #s(110pt, 64pt, 0pt, 18pt)
  #t(118pt, 55pt, [1 μF])
  #s(110pt, 82pt, -84pt, 0pt)
  #s(26pt, 82pt, 0pt, -36pt)
  #s(173pt, 112pt, 154pt, 0pt)
  #s(173pt, 112pt, 0pt, -88pt)
  #t(158pt, 15pt, [$V_C$])
  #t(288pt, 116pt, [$t$ (ms)])
  #s(173pt, 31pt, 154pt, 0pt, w: .55pt)
  #t(147pt, 27pt, [10])
  #place(top + left, dx:173pt,dy:112pt,
    curve(stroke:1.3pt, curve.move((0pt,0pt)),
      curve.cubic((12pt,-78pt),(30pt,-81pt),(152pt,-81pt))))
  #t(235pt, 4pt, [$tau=R C=1 " ms"$])
])

#let a10-divider() = html.frame(block(width: 338pt, height: 112pt)[
  #t(7pt, 3pt, [图 A.10　1 kΩ / 1 kΩ 分压与 DC 扫描])
  #t(8pt, 31pt, [$V_1$])
  #s(34pt, 44pt, 35pt, 0pt)
  #r(69pt, 36pt, 28pt, 16pt)
  #s(97pt, 44pt, 27pt, 0pt)
  #p(124pt, 44pt)
  #t(126pt, 24pt, [$V_("out")$])
  #r(116pt, 57pt, 16pt, 30pt)
  #s(124pt, 44pt, 0pt, 13pt)
  #s(124pt, 87pt, 0pt, 13pt)
  #t(70pt, 22pt, [1 kΩ])
  #t(131pt, 66pt, [1 kΩ])
  #s(166pt, 95pt, 155pt, 0pt)
  #s(166pt, 95pt, 0pt, -76pt)
  #s(166pt, 95pt, 142pt, -67pt, w: 1.4pt)
  #t(166pt, 5pt, [$V_("out")$ (0–5 V)])
  #t(264pt, 99pt, [$V_1$ (0–10 V)])
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
