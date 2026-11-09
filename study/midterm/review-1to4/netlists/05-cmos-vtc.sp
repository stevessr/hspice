CH4 CMOS inverter transfer curve - matched beta LEVEL 1
* beta_n=KP_N*(W_N/L)=400u; beta_p=KP_P*(W_P/L)=400u.
.option post=2 probe
.temp 25
.model NMTEST NMOS (LEVEL=1 VTO=0.4 KP=200u LAMBDA=0)
.model PMTEST PMOS (LEVEL=1 VTO=-0.4 KP=100u LAMBDA=0)
VDD vdd 0 DC 1.2
VIN in 0 DC 0
MN out in 0 0 NMTEST W=0.4u L=0.2u
MP out in vdd vdd PMTEST W=0.8u L=0.2u
CLOAD out 0 10f
.dc VIN 0 1.2 0.005
.probe dc v(in) v(out) i(VDD)
.measure dc VOH FIND v(out) AT=0
.measure dc VOL FIND v(out) AT=1.2
.end
