CH1 RC step response - 10k ohm / 100fF (self-contained)
* First line is the SPICE title. Educational RC model; not a PDK.
.option post=2 probe
.temp 25
VIN in 0 PULSE(0 1.2 1n 10p 10p 4n 10n)
RLINE in out 10k
CLOAD out 0 100f
.tran 2p 8n
.probe tran v(in) v(out)
.measure tran T50 TRIG v(in) VAL=0.6 RISE=1
+ TARG v(out) VAL=0.6 RISE=1
.end
