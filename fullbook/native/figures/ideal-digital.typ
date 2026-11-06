// Figure 1.6: ideal digital circuit, reconstructed as editable Typst shapes.
// Source scan: original PDF page 027; geometry is a draft, not a signed 1:1 match.
#let ideal-gate() = html.frame(block(width: 190pt, height: 144pt)[
  #place(top + left, dx: 51pt, dy: 43pt, rect(width: 60pt, height: 47pt, fill: white, stroke: 1pt))
  #for y in (50pt, 64pt, 78pt) {
    place(top + left, dx: 13pt, dy: y, line(length: 38pt, stroke: 1pt))
  }
  #place(top + left, dx: 111pt, dy: 64pt, line(length: 32pt, stroke: 1pt))
  #place(top + left, dx: 81pt, dy: 19pt, line(end: (0pt, 24pt), stroke: 1pt))
  #place(top + left, dx: 81pt, dy: 90pt, line(end: (0pt, 24pt), stroke: 1pt))
  #place(top + left, dx: 70pt, dy: 114pt, line(length: 22pt, stroke: 1pt))
  #place(top + left, dx: 73pt, dy: 119pt, line(length: 16pt, stroke: 1pt))
  #place(top + left, dx: 76pt, dy: 124pt, line(length: 10pt, stroke: 1pt))
  #place(top + left, dx: 42pt, dy: 8pt, text(size: 8pt)[$V_("DD")$ = 电源电压])
  #place(top + left, dx: 0pt, dy: 59pt, text(size: 8pt)[输入])
  #place(top + left, dx: 145pt, dy: 59pt, text(size: 8pt)[输出])
  #place(top + left, dx: 80pt, dy: 131pt, text(size: 8pt)[（a）])
])
#let ideal-vtc() = html.frame(block(width: 228pt, height: 144pt)[
  #place(top + left, dx: 42pt, dy: 111pt, line(length: 171pt, stroke: 1pt))
  #place(top + left, dx: 42pt, dy: 111pt, line(end: (0pt, -100pt), stroke: 1pt))
  #place(top + left, dx: 45pt, dy: 104pt,
    curve(stroke: 1.4pt, curve.move((0pt, 0pt)),
      curve.line((64pt, 0pt)), curve.line((64pt, -70pt)),
      curve.line((132pt, -70pt))))
  #place(top + left, dx: 0pt, dy: 0pt, text(size: 8pt)[输出])
  #place(top + left, dx: 11pt, dy: 27pt, text(size: 8pt)[$V_("DD")$])
  #place(top + left, dx: 30pt, dy: 112pt, text(size: 8pt)[0])
  #place(top + left, dx: 37pt, dy: 124pt, text(size: 8pt)[0])
  #place(top + left, dx: 98pt, dy: 124pt, text(size: 8pt)[$V_("DD")/2$])
  #place(top + left, dx: 193pt, dy: 119pt, text(size: 8pt)[输入])
  #place(top + left, dx: 111pt, dy: 133pt, text(size: 8pt)[（b）])
])
