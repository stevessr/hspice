// Synthetic smoke: native Typst structures only, no textbook content.
#set page(paper: "a4", margin: 20mm)
#set text(font: ("Noto Serif CJK SC", "DejaVu Serif"), size: 9pt, lang: "zh")
#text(size: 8pt, fill: rgb("667788"))[可编辑真值表与数学公式语法检查]
#table(
  columns: (1fr,1fr), inset: (x: 8pt, y: 3pt),
  table.header([*器件*], [*互连*]),
  [短沟道效应对 $V_T$ 的影响], [RC 延迟],
  [速度饱和], [IR 降低],
  [薄氧化层], [$L (d i)/(d t)$],
)
#align(center)[
  #grid(columns: (1fr,1fr,1fr), gutter: 7pt,
    [
      #align(center)[*INV*]
      #table(columns: (auto,auto), [A], [F], [0], [1], [1], [0])
    ],
    [
      #align(center)[*NAND*]
      #table(columns: (auto,auto,auto), [A], [B], [F],
        [0], [0], [1], [1], [1], [0])
    ],
    [
      #align(center)[*NOR*]
      #table(columns: (auto,auto,auto), [A], [B], [F],
        [0], [0], [1], [1], [1], [0])
    ],
  )
]
#align(center)[$F = A C + B C + A D + B D$]
#align(center)[$F = (A+B)(C+D)$]
#align(center)[$F = A ⊕ B = A overline(B) + overline(A) B$]
#align(center)[$F = A S + B overline(S)$]
#align(center)[$overline(a+b) = overline(a) dot overline(b)$]
#align(center)[$overline(a dot b) = overline(a) + overline(b) quad "(1.1)"$]
#align(center)[$n_i = 1.45 times 10^10 / "cm"^3 quad "(2.1)"$]
#align(center)[$n p = n_i^2 quad "(2.2)"$]
#align(center)[$n = n_i^2 / N_A$]
#align(center)[$phi_(F p) = (k T)/q ln(n_i/p) quad "(2.3a)"$]
#align(center)[$phi_(F n) = (k T)/q ln(n/n_i) quad "(2.3b)"$]
#align(center)[$phi_(F p) = (k T)/q ln(n_i/N_A) quad "(2.4)"$]
#align(center)[$C_("ox") = epsilon_("ox")/t_("ox") quad "(2.5)"$]
