#!/usr/bin/env python3
"""Chapter4 scan-based source landmarks, not full-page proof."""
from pathlib import Path
import json,math,re
R=Path(__file__).resolve().parents[1]
web=R/"web";meta=json.loads((R/"page-status.json").read_text(encoding="utf8"))
assert meta["source_pdf_pages"]==445 and len(meta["pages"])==445
must={
157:['"(4.22a)"','"(4.22b)"','"(4.22c)"','"(4.23a)"','"(4.23b)"',"inverter-delay"],
158:['"(4.24a)"','"(4.24b)"',"例4.9","50","8.75","2.1"],
159:["0.665","4.9","图4.16","tri-state","100"],
160:["4.10","4.11","35 Å","22 Å","12.5","30"],
161:["4.11","4.12","P4.1","Rabaey","Uyemura"],
162:["P4.2","P4.3","P4.4","P4.5","P4.6","inverter-chain"],
163:["P4.6","P4.7","P4.8","0.45","2%","1 pF"],
164:["P4.9","P4.10","P4.11","P4.12","0.1","0.4","0.6"],
165:["P4.13","P4.14","P4.15","exercise-vtc","100"],
166:["P4.16","tri-state","P4.15","再生"],
}
for n,terms in must.items():
 p=meta["pages"][n-1]
 assert p["pdf_page"]==n and p["status"]=="partially-transcribed",n
 assert p["layout_verified"] is False and p["figures_verified"] is False,n
 src=web/f"{n-23}-page-{n:03d}.typ"
 lay=web/f"{n-23}-page-{n:03d}-layout.typ"
 assert src.is_file() and lay.is_file(),n
 s=src.read_text(encoding="utf8")
 assert all(v in s for v in terms),(n,[v for v in terms if v not in s])
 assert "#image(" not in s,n
 wrapper=lay.read_text(encoding="utf8")
 assert "506.8346pt" in wrapper and "729.6pt" in wrapper
 assert '#include "'+src.name+'"' in wrapper
allpages="\n".join((web/f"{n-23}-page-{n:03d}.typ").read_text(encoding="utf8") for n in range(161,167))
assert all(f"P4.{i}" in allpages for i in range(1,17))
refs=(web/"138-page-161.typ").read_text(encoding="utf8")
assert len(re.findall(r"(?m)^[1-4]\. ",refs))==4
# Independent rough check of printed RC sizing example.
R=50e-12/(.7*50e-15)
assert 1400<R<1450
assert math.isclose(12.5e3/1.4e3,8.9285,rel_tol=.021)
assert math.isclose(30e3/1.4e3,21.4286,rel_tol=.021)
assert abs(.875/(.1)-8.75)<1e-9
assert abs(2.1/(.1)-21)<1e-9
assert .6<.665<.7
print("Chapter4 closing 157–166: delay4.22–4.24, example4.9 and P4.1–P4.16 OK")
