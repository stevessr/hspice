#!/usr/bin/env python3
"""Source scan landmarks for PDF177–186; no full-page editorial acceptance."""
from pathlib import Path
import json, math
ROOT=Path(__file__).resolve().parents[1]
W=ROOT/"web";data=json.loads((ROOT/"page-status.json").read_text(encoding="utf-8"))
assert data["source_pdf_pages"]==445 and len(data["pages"])==445
landmarks={
177:["例5.2","0.9","NMOS1","PMOS1",".dc Vin"],
178:["0.745","0.721","0.883","5.3",'"(5.4)"'],
179:["图5.12",'"(5.5)"',"aoi21"],
180:["图5.13","例5.3","complex-dual"],
181:["图5.14","5.4","f_(\"XOR\")","xor-xnor"],
182:["图5.15","5.5","mux2","5.6"],
183:["图5.16","5.6.1","bistable","双稳态"],
184:["图5.17",'"(5.6)"',"5.6.2","sr-nor"],
185:["例5.4","400","100","440","1.76","NAND"],
186:["图5.18","5.6.3","sr-nand","JK","时钟"],
}
for n,tokens in landmarks.items():
 p=data["pages"][n-1];assert p["pdf_page"]==n and p["status"]=="partially-transcribed"
 assert p["layout_verified"] is False and p["figures_verified"] is False
 src=W/f"{n-23}-page-{n:03d}.typ"
 lay=W/f"{n-23}-page-{n:03d}-layout.typ"
 assert src.is_file() and lay.is_file(),n
 s=src.read_text(encoding="utf-8")
 assert all(t in s for t in tokens),(n,[t for t in tokens if t not in s])
 assert "#image(" not in s,n
 l=lay.read_text(encoding="utf-8")
 assert "506.8346pt" in l and "729.6pt" in l
 assert '#include "'+src.name+'"' in l
# Separate source simulation values from the hand approximation.
assert all(abs(x-.9)>.01 for x in [.745,.721,.883])
assert abs(0.7*12.5e3*(.1/.44)*100e-15-200e-12)<5e-12
assert math.isclose(1.76/.44,4.0)
# NOR SR forbids both inputs high; NAND SR forbids both low.
fig=(ROOT/"figures/ch5-complex-sequential-native.typ").read_text(encoding="utf-8")
assert "S=R=1禁止" in fig and "输入同时为0禁止" in fig
print("Ch5 pages177–186: NAND VTC, AOI, XOR, MUX, SR and formula5.6 review OK")
