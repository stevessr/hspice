CH2 NMOS IDS-VDS family - LEVEL 1 educational model
* VGS is the outer sweep; VDS is the inner sweep.
.option post=2 probe
.temp 25
.model NMTEST NMOS (LEVEL=1 VTO=0.4 KP=200u GAMMA=0.45 PHI=0.7 LAMBDA=0)
VGS g 0 DC 0
VDS d 0 DC 0
MN d g 0 0 NMTEST W=2u L=0.2u
.dc VDS 0 1.2 0.01 VGS 0.4 1.2 0.2
.probe dc v(d) v(g) i(VDS)
.end
