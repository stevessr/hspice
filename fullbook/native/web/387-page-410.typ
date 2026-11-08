// SOURCE PDF PAGE 410; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第410页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("第11 章 电源网格和时钟设计               391")

#text("VCO 振荡频率是输入频率的倍数，必须在 PFD 中完成比较之前进行分频")

#text("MA,       HH-                             输出\nPD        rr       LPF        veo")

#text("[=")

#text("图 0.36 一个基本的 PLL 结构图")

#text("相售/频率检测器 ( PFD ) 是一个检测参考时钟边沿和反馈时钟 ( FEB，feedback clock ) 边沿之\n间站别的电路”网 01.37 Ca) 给出了一个简单的版本，由两个 D 触发器和一个与门组成 _D 输入\n端周定为1 这个电路的作用是按照输入时钟的边沿用增减频率的方式来控制 VCO.")

#text("PED 的真值表如图 11.37 (b ) Aas. 如果 up 和 down 信号都是 0、则已经获得了期望的频率\n和相位并且 PLL 处于锁定状态”但是，如果参考时钟在反馈时钟之前变化,那么 up 信和号指示应\n站增加 VCO 的频党类似地.如果反馈时钟在参考时钟之前变化, 则产生一个 down 信生来减缓\nVCO A up Al down 信号都为高，将其视为复位条件，因此与门把触发器置位为0")

#text("为了进一步理解，考虑图 11.37 Cc) 的时序图，开始时参考时钟在反馈时钟之前变为高，这\n是两个信革之间的相位错误“参考时钟的初始上升将其触发器的输出置为1，而反馈时钟的上升\n沿也回触发器的输出为1，这两个为高的输出组合形成了一个复位信号.up 信号的脉冲宽度与两\n个信和号的相位延迟成比例、 down 信和号产生了一个能被下一级很容易去掉的短脉冲，后面将会介\nAR 由于 VCO 收到一个加速信号，下次两个时钟沿的设置将有一个较小的相位差，这缩短了 up\n脉冲”这个过程一直继续直到相位差改变了符号，在这一点 down 信号使能，最后，系统达到稳\n定，两个时钟之间有可以忽略的不同")

#text("Op] Bs")

#text("Ref Clk 一小            0   0 | Hoa")

#text("a")

#text("oft | bee")

#text("JP] DT一")

#text("met 小，")

#text("ua FL FL FL\nre\nes a LI LI\ndown LJ | ft")

#text("F137 相位-频率检测器")
