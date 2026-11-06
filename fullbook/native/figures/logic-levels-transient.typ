// Figures 1.7 and 1.8(a), native editable Typst primitives.
// Based on source scans PDF pages 028-029. Not yet signed off as 1:1.
#let quantized-levels() = html.frame(block(width: 181pt, height: 133pt)[
  #place(top + left, dx: 23pt, dy: 117pt, line(length: 138pt, stroke: 0.8pt))
  #place(top + left, dx: 50pt, dy: 112pt, line(end: (0pt, -101pt), stroke: 0.8pt))
  #place(top + left, dx: 43pt, dy: 24pt, rect(width: 14pt, height: 34pt, fill: white, stroke: 0.8pt))
  #place(top + left, dx: 43pt, dy: 70pt, rect(width: 14pt, height: 33pt, fill: white, stroke: 0.8pt))
  #place(top + left, dx: 60pt, dy: 58pt, line(length: 70pt, stroke: (dash: "dashed", thickness: 0.6pt)))
  #place(top + left, dx: 60pt, dy: 70pt, line(length: 70pt, stroke: (dash: "dashed", thickness: 0.6pt)))
  #place(top + left, dx: 82pt, dy: 16pt, text(size: 8pt)[振幅])
  #place(top + left, dx: 86pt, dy: 42pt, text(size: 8pt)[1])
  #place(top + left, dx: 86pt, dy: 84pt, text(size: 8pt)[0])
  #place(top + left, dx: 111pt, dy: 55pt, text(size: 7pt)[不确定区])
  #place(top + left, dx: 74pt, dy: 123pt, text(size: 8pt)[（a）])
])
#let in-out-levels() = html.frame(block(width: 200pt, height: 133pt)[
  #place(top + left, dx: 12pt, dy: 117pt, line(length: 185pt, stroke: 0.8pt))
  #place(top + left, dx: 34pt, dy: 116pt, line(end: (0pt, -105pt), stroke: 0.8pt))
  #place(top + left, dx: 28pt, dy: 24pt, rect(width: 13pt, height: 38pt, fill: white, stroke: 0.9pt))
  #place(top + left, dx: 28pt, dy: 72pt, rect(width: 13pt, height: 34pt, fill: white, stroke: 0.9pt))
  #place(top + left, dx: 132pt, dy: 18pt, rect(width: 13pt, height: 31pt, fill: white, stroke: 0.9pt))
  #place(top + left, dx: 132pt, dy: 84pt, rect(width: 13pt, height: 32pt, fill: white, stroke: 0.9pt))
  #place(top + left, dx: 41pt, dy: 62pt, line(length: 54pt, stroke: (dash: "dashed", thickness: 0.6pt)))
  #place(top + left, dx: 41pt, dy: 72pt, line(length: 54pt, stroke: (dash: "dashed", thickness: 0.6pt)))
  #place(top + left, dx: 22pt, dy: 2pt, text(size: 8pt)[输入])
  #place(top + left, dx: 127pt, dy: 1pt, text(size: 8pt)[输出])
  #place(top + left, dx: 53pt, dy: 50pt, text(size: 7pt)[$V_("IH")$])
  #place(top + left, dx: 53pt, dy: 73pt, text(size: 7pt)[$V_("IL")$])
  #place(top + left, dx: 151pt, dy: 31pt, text(size: 7pt)[$V_("OH")$])
  #place(top + left, dx: 151pt, dy: 96pt, text(size: 7pt)[$V_("OL")$])
  #place(top + left, dx: 77pt, dy: 123pt, text(size: 8pt)[（b）])
])
#let vtc(inverting: false) = html.frame(block(width: 207pt, height: 169pt)[
  #place(top + left, dx: 22pt, dy: 133pt, line(length: 171pt, stroke: 1pt))
  #place(top + left, dx: 22pt, dy: 133pt, line(end: (0pt, -119pt), stroke: 1pt))
  #if inverting [
    #place(top + left, dx: 24pt, dy: 26pt,
      curve(stroke: 1.5pt,
        curve.move((0pt, 0pt)),
        curve.line((30pt, 0pt)),
        curve.cubic((58pt, 0pt), (50pt, 86pt), (99pt, 92pt)),
        curve.line((146pt, 92pt))))
  ] else [
    #place(top + left, dx: 24pt, dy: 117pt,
      curve(stroke: 1.5pt,
        curve.move((0pt, 0pt)),
        curve.line((27pt, 0pt)),
        curve.cubic((51pt, 0pt), (38pt, -88pt), (89pt, -91pt)),
        curve.line((146pt, -91pt))))
  ]
  #place(top + left, dx: 64pt, dy: 26pt, line(end: (0pt, 105pt), stroke: (dash: "dashed", thickness: 0.6pt)))
  #place(top + left, dx: 88pt, dy: 26pt, line(end: (0pt, 105pt), stroke: (dash: "dashed", thickness: 0.6pt)))
  #place(top + left, dx: 0pt, dy: 0pt, text(size: 7pt)[输出 $V$])
  #place(top + left, dx: 0pt, dy: 24pt, text(size: 7pt)[$V_("OH")$])
  #place(top + left, dx: 0pt, dy: 117pt, text(size: 7pt)[$V_("OL")$])
  #place(top + left, dx: 48pt, dy: 136pt, text(size: 7pt)[$V_("IL")$])
  #place(top + left, dx: 82pt, dy: 136pt, text(size: 7pt)[$V_("IH")$])
  #place(top + left, dx: 154pt, dy: 136pt, text(size: 7pt)[输入 $V$])
  #place(top + left, dx: 68pt, dy: 8pt,
    text(size: 7pt)[#if inverting [斜率 = -1] else [斜率 = 1]])
  #place(top + left, dx: 58pt, dy: 151pt,
    text(size: 8pt)[#if inverting [（d）转换电路] else [（c）非转换电路]])
])
// Figure 1.8(a): input and output transitions with 10/50/90% markers.
// The plotted paths are editorial vector reconstruction, not sampled waveforms.
#let transition-chart() = html.frame(block(width: 385pt, height: 247pt)[
  #place(top + left, dx: 27pt, dy: 91pt, line(length: 329pt, stroke: 0.8pt))
  #place(top + left, dx: 27pt, dy: 91pt, line(end: (0pt, -84pt), stroke: 0.8pt))
  #place(top + left, dx: 27pt, dy: 214pt, line(length: 329pt, stroke: 0.8pt))
  #place(top + left, dx: 27pt, dy: 214pt, line(end: (0pt, -88pt), stroke: 0.8pt))
  #place(top + left, dx: 8pt, dy: 2pt, text(size: 8pt)[$V_("in")$])
  #place(top + left, dx: 8pt, dy: 119pt, text(size: 8pt)[$V_("out")$])
  #place(top + left, dx: 357pt, dy: 91pt, text(size: 8pt)[$t$])
  #place(top + left, dx: 357pt, dy: 214pt, text(size: 8pt)[$t$])
  #place(top + left, dx: 75pt, dy: 26pt,
    curve(stroke: 1.4pt,
      curve.move((0pt, 65pt)), curve.line((16pt, 65pt)),
      curve.cubic((29pt, 65pt), (25pt, 8pt), (44pt, 8pt)),
      curve.line((99pt, 8pt)),
      curve.cubic((118pt, 8pt), (111pt, 66pt), (133pt, 66pt)),
      curve.line((179pt, 66pt)),
      curve.cubic((203pt, 66pt), (200pt, 8pt), (219pt, 8pt)),
      curve.line((258pt, 8pt))))
  #place(top + left, dx: 75pt, dy: 126pt,
    curve(stroke: 1.4pt,
      curve.move((0pt, 25pt)),curve.line((44pt, 25pt)),
      curve.cubic((62pt, 25pt),(64pt, 83pt),(83pt, 83pt)),
      curve.line((149pt,83pt)),
      curve.cubic((168pt,83pt),(164pt,25pt),(185pt,25pt)),
      curve.line((231pt,25pt)),
      curve.cubic((250pt,25pt),(248pt,83pt),(260pt,83pt))))
  #place(top + left, dx: 89pt, dy: 38pt, text(size: 7pt)[90%])
  #place(top + left, dx: 84pt, dy: 57pt, text(size: 7pt)[50%])
  #place(top + left, dx: 83pt, dy: 77pt, text(size: 7pt)[10%])
  #place(top + left, dx: 103pt, dy: 94pt, text(size: 7pt)[$t_r$])
  #place(top + left, dx: 192pt, dy: 94pt, text(size: 7pt)[$t_f$])
  #place(top + left, dx: 130pt, dy: 176pt, text(size: 7pt)[$t_("pHL")$])
  #place(top + left, dx: 231pt, dy: 176pt, text(size: 7pt)[$t_("pLH")$])
  #place(top + left, dx: 294pt, dy: 32pt, text(size: 7pt)[$V_("OH")$])
  #place(top + left, dx: 297pt, dy: 81pt, text(size: 7pt)[$V_("OL")$])
  #place(top + left, dx: 294pt, dy: 143pt, text(size: 7pt)[$V_("OH")$])
  #place(top + left, dx: 295pt, dy: 206pt, text(size: 7pt)[$V_("OL")$])
  #place(top + left, dx: 145pt, dy: 232pt, text(size: 8pt)[（a）实际的瞬态电压])
])
