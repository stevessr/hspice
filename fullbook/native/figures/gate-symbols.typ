// Editable native Typst gate primitives, not raster-embedded textbook diagrams.
// Source comparison: scanned book figure 1.4 on source PDF page 026.

#let gate-outline(kind) = {
  if kind == "buffer" or kind == "inverter" {
    curve(
      fill: white, stroke: 0.9pt,
      curve.move((0pt, 0pt)),
      curve.line((0pt, 36pt)),
      curve.line((45pt, 18pt)),
      curve.close(mode: "straight"),
    )
  } else if kind == "and" or kind == "nand" {
    curve(
      fill: white, stroke: 0.9pt,
      curve.move((0pt, 0pt)),
      curve.line((22pt, 0pt)),
      curve.cubic((54pt, 0pt), (54pt, 36pt), (22pt, 36pt)),
      curve.line((0pt, 36pt)),
      curve.close(mode: "straight"),
    )
  } else if kind == "or" or kind == "nor" or kind == "xor" or kind == "xnor" {
    curve(
      fill: white, stroke: 0.9pt,
      curve.move((0pt, 0pt)),
      curve.cubic((20pt, -1pt), (42pt, 4pt), (52pt, 18pt)),
      curve.cubic((42pt, 32pt), (20pt, 37pt), (0pt, 36pt)),
      curve.cubic((12pt, 22pt), (12pt, 14pt), (0pt, 0pt)),
      curve.close(mode: "straight"),
    )
  }
}

#let gate-symbol(kind: "and", inputs: 2, inverted-inputs: false) = {
  let output-bubble = kind == "nand" or kind == "nor" or kind == "inverter" or kind == "xnor"
  let count = if kind == "buffer" or kind == "inverter" { 1 } else { inputs }
  html.frame(
    block(width: 112pt, height: 52pt)[
      #place(top + left, dx: 23pt, dy: 7pt, gate-outline(kind))
      #for i in range(count) {
        #let y = if count == 1 { 25pt } else { 12pt + i * (26pt / (count - 1)) }
        #place(top + left, dx: 0pt, dy: y, line(length: 23pt, stroke: 0.9pt))
        #if inverted-inputs {
          #place(top + left, dx: 17pt, dy: y - 3pt, circle(radius: 3pt, stroke: 0.9pt, fill: white))
        }
      }
      #if kind == "xor" or kind == "xnor" {
        #place(top + left, dx: 18pt, dy: 7pt,
          curve(
            stroke: 0.9pt,
            curve.move((0pt, 0pt)),
            curve.cubic((11pt, 12pt), (11pt, 24pt), (0pt, 36pt))
          )
        )
      }
      #if output-bubble {
        #place(top + left, dx: 74pt, dy: 22pt,
          circle(radius: 3pt, stroke: 0.9pt, fill: white))
        #place(top + left, dx: 80pt, dy: 25pt,
          line(length: 28pt, stroke: 0.9pt))
      } else {
        #place(top + left, dx: 75pt, dy: 25pt,
          line(length: 33pt, stroke: 0.9pt))
      }
    ]
  )
}

#let dff-symbol() = {
  html.frame(
    block(width: 156pt, height: 102pt)[
      #place(top + left, dx: 40pt, dy: 7pt,
        rect(width: 63pt, height: 72pt, stroke: 1pt, fill: white))
      #place(top + left, dx: 3pt, dy: 25pt,
        line(length: 37pt, stroke: 0.9pt))
      #place(top + left, dx: 103pt, dy: 25pt,
        line(length: 36pt, stroke: 0.9pt))
      #place(top + left, dx: 71pt, dy: 79pt,
        line(end: (0pt, 17pt), stroke: 0.9pt))
      #place(top + left, dx: 45pt, dy: 10pt, text(size: 9pt)[D])
      #place(top + left, dx: 84pt, dy: 10pt, text(size: 9pt)[Q])
      #place(top + left, dx: 53pt, dy: 53pt, text(size: 8pt)[Clk])
      #place(top + left, dx: 0pt, dy: 7pt, text(size: 7.5pt)[数据输入])
      #place(top + left, dx: 110pt, dy: 7pt, text(size: 7.5pt)[数据输出])
      #place(top + left, dx: 79pt, dy: 89pt, text(size: 7.5pt)[时钟])
    ]
  )
}

#let mux-symbol() = {
  html.frame(
    block(width: 130pt, height: 93pt)[
      #place(top + left, dx: 47pt, dy: 10pt,
        rect(width: 45pt, height: 57pt, stroke: 1pt, fill: white))
      #place(top + left, dx: 17pt, dy: 26pt, line(length: 30pt, stroke: 0.9pt))
      #place(top + left, dx: 17pt, dy: 49pt, line(length: 30pt, stroke: 0.9pt))
      #place(top + left, dx: 92pt, dy: 39pt, line(length: 27pt, stroke: 0.9pt))
      #place(top + left, dx: 69pt, dy: 0pt, line(end: (0pt, 10pt), stroke: 0.9pt))
      #place(top + left, dx: 3pt, dy: 18pt, text(size: 9pt)[A])
      #place(top + left, dx: 3pt, dy: 41pt, text(size: 9pt)[B])
      #place(top + left, dx: 120pt, dy: 29pt, text(size: 9pt)[F])
      #place(top + left, dx: 74pt, dy: 1pt, text(size: 9pt)[S])
      #place(top + left, dx: 49pt, dy: 18pt, text(size: 8pt)[多路])
      #place(top + left, dx: 49pt, dy: 30pt, text(size: 8pt)[选择])
      #place(top + left, dx: 56pt, dy: 42pt, text(size: 8pt)[器])
    ]
  )
}
