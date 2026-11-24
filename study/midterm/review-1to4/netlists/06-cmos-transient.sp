CH4 CMOS inverter transient, delay and supply current
* PULSE period=2ns; second input rising and falling transitions used.
.option post=2 probe
.temp 25
.model NMTEST NMOS (LEVEL=1 VTO=0.4 KP=200u LAMBDA=0.02)
.model PMTEST PMOS (LEVEL=1 VTO=-0.4 KP=100u LAMBDA=0.02)
VDD vdd 0 DC 1.2
VIN in 0 PULSE(0 1.2 0.5n 20p 20p 1n 2n)
MN out in 0 0 NMTEST W=0.4u L=0.2u
MP out in vdd vdd PMTEST W=0.8u L=0.2u
CLOAD out 0 20f
.tran 2p 10n
.probe tran v(in) v(out) i(VDD)
.measure tran TPHL TRIG v(in) VAL=0.6 RISE=2
+ TARG v(out) VAL=0.6 FALL=2
.measure tran TPLH TRIG v(in) VAL=0.6 FALL=2
+ TARG v(out) VAL=0.6 RISE=2
.measure tran IAVG AVG i(VDD) FROM=2n TO=10n
.end
