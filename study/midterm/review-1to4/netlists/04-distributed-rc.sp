CH3 Interconnect RC - lumped versus five-section distributed
* Both branches have total R=10k and total C=100fF.
.option post=2 probe
.temp 25
VIN in 0 PULSE(0 1.2 1n 10p 10p 4n 10n)
RLUMP in lumped 10k
CLUMP lumped 0 100f
R1 in n1 2k
C1 n1 0 20f
R2 n1 n2 2k
C2 n2 0 20f
R3 n2 n3 2k
C3 n3 0 20f
R4 n3 n4 2k
C4 n4 0 20f
R5 n4 distributed 2k
C5 distributed 0 20f
.tran 2p 8n
.probe tran v(in) v(lumped) v(distributed)
.measure tran TLUMP TRIG v(in) VAL=0.6 RISE=1
+ TARG v(lumped) VAL=0.6 RISE=1
.measure tran TDIST TRIG v(in) VAL=0.6 RISE=1
+ TARG v(distributed) VAL=0.6 RISE=1
.end
