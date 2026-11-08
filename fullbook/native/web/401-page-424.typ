// SOURCE PDF PAGE 424; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第424页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("HERA SPICE 的简要介绍                      405")

#text("图 A.3 显示了一个名称为 R5 的 10 km的电阻，连接在节点\"5\"和地之间")

#text("RS        5       0       10k\nRs\n10x\n5一Mr一0\nMAS “一个电阻被动元件")

#text("值")

#text("元件值用浮点数说明.特别大或特别小的值( 例如 > 1000 或 < 0.001 ) 可以用指数形式或用\n工程学前缕说明。表 A.2 给出了乘数因子和与其相关的 10 次宕的后缀字母 、公制前级和指数形\n式- 最后一列显示了用工程形式和指数形式表示的两个相等的值.")

#text("FAQ SPICE 的前统和指数")

#text("RMAF       aane       ORR EM     指数         SPICE 距离\nwo\"            Giga           Ge           89             42GHz\n42E9\n10°            Mega           Meg. meg        E6             2 Meg\n2E6\n            Kilo            Kk           ES             27 kohms\n2783\n10°            Milli            Mm          B3            273 mA\n273B.3\n10*        Micro       wu       6        O2us\n02E-6\n10”                Nano               Now               B9                Ans\n49\n10”               Pico                Pop               E-12               95 pF\n95E-12\n10           Femo           BE           BAS            3下\nSEIS")

#text("注意，不要求使用单位 ( 欧姆法拉或伏特 )，因为 SPICE 将基于元件的类型 ( 电阻、电容\n或电压源 ) 推断出单位。但是，为了改善可读性应该尽可能说明单位。 前缀和指数形式不能混用\n【例如，2E-16P )")

#text("模型")

#text("对请如二极管和晶体管的主动元件, 采用说明一个模型而不\n是说明单个值 ( 如电阻或电容那样 ) 的方式进行说明. 模型加在\n节点说明之后，随后提供器件尺寸的列表，")

#text("图A4给出了一个使用“nmos”模型的 MOS 晶体管         图A4 一个MOS 局体管")
