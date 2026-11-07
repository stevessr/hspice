* Example 6.2, source PDF219: Ceff calculation (areas and perimeters specified)
.param Supply=1.8
.lib 'bsim3v3.cmosp18.lib'
.opt scale=0.1u
.global vdd gnd
vdd vdd gnd 1.8
m1 out in1 vdd vdd pch l=2 w=40 ad=200 as=200 pd=40 ps=40
m2 out in1 0 0 nch l=2 w=20 ad=100 as=100 pd=20 ps=20
m3 out1 out vdd vdd pch l=2 w=160 ad=800 as=800 pd=80 ps=80
m4 out1 out 0 0 nch l=2 w=80 ad=200 as=200 pd=80 ps=80
m5 out2 out1 vdd vdd pch l=2 w=640 ad=3200 as=3200 pd=320 ps=320
m6 out2 out1 0 0 nch l=2 w=320 ad=1600 as=1600 pd=320 ps=320
vin1 in1 gnd pwl (0 0 9ps 0 10ps 1.8 199ps 1.8 200ps 0)
.tran 5ps 350ps
.print tran v(in1) v(out)
.end
