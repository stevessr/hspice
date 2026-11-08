// SOURCE PDF PAGE 423; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第423页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("404         数字集成电路分析与设计一一深亚微米工艺 ( 第三版 )")

#text("Mn 3 2 0 0 nmos L=0.2u W-0.4u as=0.2p ps=0.4u ad=0.2p pd=0.4u\n然而，第一个描述更易读和易于调试，并且使你可以改变工艺尺寸而不需要修改电路描述-")

#text("A.3.3 源、主动元件和被动元件的列表")

#text("可以通过输入源 ( 电压源或电流源 ) 、 主动元件 ( 二极管和晶体管 ) .被动元件 ( 电阻和电容 )\n及其相关的连接结点的列表来建立电路.各类型的源和元件在单独一行说明。可以通过如下说明\n增加到列表中:")

#text("1，一个惟一的实体名字:")

#text("2，所连接的节点")

#text("3与该元件相关的特定值 ( 例如对一个电阻可以是 10knD )")

#text("4如果说明了一个主动元件则要说明一个模型 ( 例如 MOS 晶体管的 BSIM 模型)")

#text("5元件特定的参数 ( 例如 MOSFET 的宽度和长度 )")

#text("实体名")

#text("元件的实体名是一个最多可以包含 8 个文字和数字的惟一名称. 名字的第一个字符必须与其\n调用的元件类型相对应，央为这是使 SPICE 知道所要描述的元件类型的方法。例如, 电阻实体的\n第一个字母必须以字母 R 开始。 任何惟一的字符组合可以跟随其后")

#text("表A.1 列出了元件类型和名字的约定。“xxx”可以是最多 7 个文字和数字字符的任意组合-\n(GAGE SPICE 中所有实体名的语法。)")

#text("RAL 元件名语法")

#text("元件灶型                       命名约定                    实体举例\norm                         Vax                      VI. VDD, source\nutc                         Tox                       12, source, ID\nUm                           Ra                      RS. Rin, Rout\nWye                          Can                      Ce, Cout, Chig\n电感                          Lou                      L3, Leelf, Li\naK                        Ma                      MI1，Mpmos23，Mpu")

#text("i                         Dax.                      D1, Dpn, Delamp")

#text("节点")

#text("为了说明电路的连接信息，需要说明元件连接到的节点的信息。大多数元件需要两个节点，\n而其他元件像 BIT 和 FET 需要三个或更多的节点。 过去,节点用正整数值说明。对一个更具描述\n性的输入，只要可能就应该使用由文字和数字构成的节点名")

#text("注意，节点“0”是为地保留的。对某些两端元件，正节点必须在负节点之后。 正和负不一\n定是彼此间的节点电压，而是指对该元件指派的    和   端。对一些器件，如果节点按不同\n的顺序说明就会改变其电路结构，电压源和二极管就是这种器件的例子。另一方面， 电阻、电容\n和电感上的节点可以用不同的顺序说明，而对电路的行为没有任何影响 对于这些元件，习惯上\n是可能为高电平的节点将作为正的一边。")
