CH2 NMOS body effect - reverse substrate bias
* Source=0, bulk V(b) <= 0; VSB = -V(b) >= 0.
.option post=2 probe
.temp 25
.model NMTEST NMOS (LEVEL=1 VTO=0.4 KP=200u GAMMA=0.45 PHI=0.7 LAMBDA=0)
VGS g 0 DC 0
VDS d 0 DC 0.05
VBODY b 0 DC 0
MN d g 0 b NMTEST W=2u L=0.2u
.dc VGS 0 1.2 0.01 VBODY -0.6 0 0.2
.probe dc v(g) v(b) i(VDS)
.end
