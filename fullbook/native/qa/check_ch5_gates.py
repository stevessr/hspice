#!/usr/bin/env python3
"""Scan-based review of chapter 5 start, not full-page 1:1 acceptance."""
from pathlib import Path
import json,math
N=Path(__file__).resolve().parents[1];W=N/"web"
meta=json.loads((N/"page-status.json").read_text(encoding="utf8"))
assert meta["source_pdf_pages"]==445 and len(meta["pages"])==445
terms={
167:["第5章","5.1","5.2","5.12","绪论"],
168:["5.2","CMOS","NAND","NOR","NMOS","PMOS"],
169:["图5.1","5.2.1","nand-nor-2","练习5.1"],
170:["图5.2","gate-widths","2W","4W","6W"],
171:["图5.3","图5.4",'"(5.1)"','"(5.2)"',"W_(\"eq\")"],
172:["例5.1","5.2.2",'"(5.3)"',"NAND3","NOR3"],
173:["图5.5","图5.6","图5.7","wide-nand"],
174:["图5.8","图5.9","NAND4","FO4","练习5.3"],
175:["5.2.3","图5.10","nand-vtc"],
176:["图5.11","例5.2","0.18","0.77","400","nand-vtc"],
}
for n,words in terms.items():
 p=meta["pages"][n-1]
 assert p["pdf_page"]==n and p["status"]=="partially-transcribed",n
 assert p["layout_verified"] is False and p["figures_verified"] is False,n
 src=W/f"{n-23}-page-{n:03d}.typ"
 lay=W/f"{n-23}-page-{n:03d}-layout.typ"
 assert src.is_file() and lay.is_file(),n
 content=src.read_text(encoding="utf8")
 assert all(w in content for w in words),(n,[w for w in words if w not in content])
 assert "#image(" not in content
 l=lay.read_text(encoding="utf8")
 assert "506.8346pt" in l and "729.6pt" in l
 assert '#include "'+src.name+'"' in l
fig=(N/"figures/ch5-cmos-gates-native.typ").read_text(encoding="utf8")
assert "左NOR右NAND" in (W/"146-page-169.typ").read_text(encoding="utf8")
assert fig.index("[NOR2]))")<fig.index("[NAND2]))")
# Equivalent W check: 3 identical 3W in series yields W; parallel W+W+W=3W.
W0=1.;r=1/(1/(3*W0)+1/(3*W0)+1/(3*W0))
assert abs(r-W0)<1e-12 and abs((W0+W0+W0)-3*W0)<1e-12
chi=math.sqrt((400*24)/(400*6))
vs=(1.8-.5+.5*chi)/(1+chi)
assert chi==2.0 and abs(vs-.7666666666667)<.0001
print("Chapter5 scan pages 167–176: NAND/NOR, equations5.1–5.3 and example5.2 OK")
