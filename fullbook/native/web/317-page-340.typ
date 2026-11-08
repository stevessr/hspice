// SOURCE PDF PAGE 340 / printed 321; scan-assisted editorial draft.
// Figures editable, original circuit-level wiring and geometry not strictly verified.
#import "../figures/ch9-dram-rom-native.typ": figure9later
#set document(title:"第9章·动态RAM与ROM·PDF340")
#align(center)[#text(size:8pt,weight:"bold")[321　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

如果某条被选中字线连接着一个NMOS，则该列在读出期间可以由高电平变为低电平；如果没有连接晶体管，就维持预充值。这种位图由掩膜版中的接触或扩散层设置形成，称为掩膜可编程ROM。

#figure9later(19)
#align(center)[*图9.19（续）单管ROM读出结构*]

#figure9later(20)
#align(center)[*图9.20　两种MOS ROM阵列：(a) NOR ROM、(b) NAND ROM（原生电路框图）*]

在NOR ROM中，各晶体管可形成与位线之间的并联下拉路径。一条字线升高，接有晶体管的列将被拉低，否则保持高电平。用正逻辑表示，可以约定有晶体管的交点存“0”，无晶体管存“1”。

NAND ROM则采用串联晶体管链作为阵列读出路径。选中字线的电平及晶体管存在与否决定该串联链是否导通；由于串联器件数量可能较多，读出延迟与NOR结构不同。

原书将改变掩膜图形或调整阈值注入作为存储位编码的实现方式。本页图元可用于理解字线与位线的组织，但MOS漏/源接触及串并联的精确原图连线仍需对扫描复核。
