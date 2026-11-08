// SOURCE PDF PAGE 326; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第326页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("HOE ”存储器设计中的其他课题            307")

#text("mst            ant                            a\n=                    L\n=\n和             CAMPER         eee            SRAM 阵列\n(标签                               所\nte\nT=        cco\nSer\nCAM VOR Tag ah                     SRAM i8/*4 10,\nte")

#text("图94 CAM 和SRAM 阵列的结构图")

#text("个完整的 CAM i    须能够处理意外的情况，比如多重匹配， 当然，这可以通过在存储")

#text("之前检查标签在阵列中是否已经存在来避免 ，也会出现所有存储的标签完全不匹配的情况，这种\n情况下发生一个未命中 ( miss). 需要对所有的匹配线进行检查才能把这种情况标识出来. 这里全\n都不是高电平”这可以通过一个大的或非门完成。探测到这种情况时， 新的标签和与之相关的数\n据可以分别写人 CAM 和 SRAM 阵列")

#text("因为每一个 CAM 单元内部都含有一个 SRAM 单元用来存储标签,所以为了对其进行写操作\n必须进行安排因此，CAM 阵列也有由译码器驱动的字线，可以通过字线访问每行和\n将标签数据写人单元”6T SRAM 单元的位线和用于匹配的标签线使用相同的连线\nSRAM 阵列中的类似，但这里不是下拉一条标签线，而是标签线的电平必须升高 这是因为两条\n标签线必须开始于低电平, 以保持内部的异或晶体管关闭, 并使匹配线可以预充到一个高电平值\n这可以通过研究前而图 93 所示的单元来进一步加以理解  UIE My 或 Mie 中有一个导通，且\nSRAM 单元的相对一边是高电平，那么匹配线将会不经意地下拉到低电平。因此 标答线必须开\n始于低电平以避免这种情况")

#text("单元不匹配的时序可以通过重新安排单元内晶体管的位置得到改善 在第 6 章中指出，后到\n达的信号应该放置在一个冲联管堆栈的项部。可以应用这个规则来重新安排 CAM 单元中晶体管\nAGAR. ANP 9.5 所示. 两个列晶体管 Ms 和 Mi现在连到了匹配线上 , 而其他晶体管M; 和Ms连\nBITE. NOT abn ee A AL RRA HS, 所以应该放置在离输出较近的地方. 当\n然，单元内部的节点都是稳定的，因此可以看做较早到达的信号。 这种新结构允许Ms 或Mio 执\n行大部分的放电过程，因为 M; 或 M 已经给中间的电容放电了")
