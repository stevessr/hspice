// Editable NMOS cross-section illustration. Pure Typst, no raster assets.
#align(center)[
  #stack(dir: ttb, spacing: 2pt,
    [#text(weight: "bold", size: 10pt)[栅极 G（多晶硅）]],
    rect(width: 45mm, height: 7mm, fill: rgb("b6c6d6"), stroke: 0.5pt,
      inset: 1mm)[#align(center)[#text(size: 8pt)[多晶硅栅]]],
    rect(width: 60mm, height: 2mm, fill: rgb("faf6cd"), stroke: 0.4pt),
    grid(columns: (24mm, 45mm, 24mm), column-gutter: 0pt,
      rect(width: 24mm, height: 17mm, fill: rgb("bfd8ed"), stroke: 0.6pt,
        inset: 1mm)[#align(center)[#text(size: 8pt)[源 n⁺]]],
      rect(width: 45mm, height: 17mm, fill: rgb("e5f0e7"), stroke: 0.6pt,
        inset: 1mm)[#align(center)[#text(size: 8pt)[沟道区 L]]],
      rect(width: 24mm, height: 17mm, fill: rgb("bfd8ed"), stroke: 0.6pt,
        inset: 1mm)[#align(center)[#text(size: 8pt)[漏 n⁺]]],
    ),
    rect(width: 93mm, height: 17mm, fill: rgb("eeeeee"), stroke: 0.6pt,
      inset: 3mm)[#align(center)[#text(size: 9pt)[$p$ 型衬底（体端 B）]]],
  )
]
