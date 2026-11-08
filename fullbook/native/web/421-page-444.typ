// SOURCE PDF PAGE 444; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第444页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("附录 B 双极型晶体管和电路                 425")

#text("化之前输入处于高电平时,两个量体管Q,和@Q都旦伯和的， 并且Vc = 16V 由于输入端由高到\n低变化，VP = 01Y 因此，最初时Vca = 1.5V， 晶体管QI工作在正向活性模式 也就是说, 直\n到QI饱和前. 集电极电流是ja = Bel) 这个电流是可以测直到的.并且是晶体管Q的基极关断\n电流 注意这直到Qu关断Q饱和才成立 央此, 由于晶体管Qi的正向电流增益为BF, 品体管@会\n迅速关断“当Q, 关断时，曲体管Q,变为输出端的电流源，倘若Q是截止的，这将导致门的输出\n电压变高”关断Q,的基极电流通过R，Q,的关断时间通常比Qu的长”但是晶体管Q确实可以使\n传输延迟时间 tm减少")

#text("以后的 TTL 结构采用了肖特基籍位形式以减少传输延迟，并采用了疾外的器件，通过去掉\nBP2 点诈且将 BPI 和有移改善电压传输特忻 ”也就是知名的 74S，74LS，74ALS，等等“要更详细\n地了解这些电路和 ECL，参见本书早期的版本")

#text("B.11 输入箱位二极管")

#text("后后.在图 B.7 中 TTL 电路的描述里，应该注意从每个输入端到地的条位二极管 ”对于在输\n和人端的高或低电平的稳态情况. 它们被反偏并且在电路中不起作用 然而, 随着输出变化状态时\n这些电路的于关转换时间非常短。任何与负载或电源线有关的电感都可以在输出线路上引起高频\n振荡“因此门的输入在正向摆动能大于 5 V. 在反向摆动能小于 0 V，正向摆动可以反向偏冒输入\n出体管的发射极-革极结. 但是基极电阻 R限制了电流.不会产生损害，反向摆动时，巾于晶体管\nuth AL. 所以集电极的电帮将只能比发射极电压多 0.1 V。 其结果是，QI的集电极-衬底隔离二极\n管能被让向偏罗 ”这能导致电路中其他节点的不希望的电压毛刺，或可能对 IC 造成致命危害\n在输入端的“极管钳住了输入电压以致不能反向摆动超过-0.7 V ”以后版本的 TTL 在输入箱位位\n兽使用肖特基二极管")

#text("这个标准 TTL 门电路的电特性恕表 8.1 所东，注意最初的 TTL 电路的功耗延迟积是 100 pl.\n比现在的 CMOS 逻辑电路大很多，最先进的 TTL 家族是 74 ALS，典型的传输延迟是4 ns，典型\n的功耗是mW，仍然比现在的 CMOS 电路大很多")

#text("表B.1 SALAMA ARABI 54/74TTL ， ，在温度为 Ta= 25°C 时的典型电特性")

#text("VoulVer        35VO2V       wits               10\nVind Vu         1SVOSV       电源电压              450V\nNMMWW'           20V03V          NREL VET OE           10mW\niE         33V.             传输延迟时间               10ms\nB.12 ”参考文献\n1. V.H. Grinich and H. G. Jackson, Introduction to Integrated Circuits, McGraw-Hill, New\nYork, 1975.")

#text("2. D. J. Hamilton and W. G. Howard, Basic Integrated Circuit Engineering, McGraw-Hill,\nNew York, 1975.\n3. H. Taub and D. Schilling, Digital Integrated Electronics, McGraw-Hill, New York, 1977.")

#text("4. D.A. Hodges and H. G. Jackson, Analysis and Design of Digital Integrated Circuits, 2nd\ned., McGraw-Hill, New York, 1988, pp. 156-171")
