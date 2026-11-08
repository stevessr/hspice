#!/usr/bin/env python3
"""Pass27: real printed front matter PDF3–13, original scanned Chinese pages."""
import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]
source=json.loads((root/"page-status.json").read_text(encoding="utf-8"))["pages"]
fidelity=json.loads((root/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
a=json.loads((root/"qa/source-audit-p003-p013.json").read_text(encoding="utf-8"))
assert a["source_pdf_pages"]==445 and a["scope"]==[3,13] and len(a["pages"])==11
expected={
3:("内容简介","图书在版编目","ISBN 7-121-01666-4","2005"),
4:("吴佑寿","雷达","教材"),
5:("出版说明","WTO","40 余种","电子工业出版社"),
6:("教材出版委员会","吴佑寿","林金桐","范平志"),
7:("译者序","蒋安平","SPICE","2005 年 8 月"),
8:("David A. Hodges","Horace G. Jackson","Resve A. Saleh"),
9:("第三版前言","0.35 μm","BSIM3","SPICE"),
10:("为什么购买本书","先进的 CMOS 工艺","15 周","SPICE"),
11:("第 1 章","第 6 章","MOS 晶体管"),
12:("第 7 章","第 11 章","FRAM","Elmore"),
13:("致","Resve Saleh","Mona Elwakkad Zaghloul","Richard Newton"),
}
for n,tokens in expected.items():
    s=(root/"web"/f"{n:03d}-page-{n:03d}.typ").read_text(encoding="utf-8")
    assert f"SOURCE PDF PAGE {n:03d}" in s[:100],n
    assert "MACHINE-OCR DRAFT ONLY" not in s and "#image(" not in s
    assert all(x in s for x in tokens),(n,[x for x in tokens if x not in s])
    p,q=source[n-1],fidelity[n-1]
    assert p["status"]==q["editorial_state"]=="draft-transcribed",n
    assert p["editorial_typst_draft"] and p["source_scan_landmarks_checked"],n
    assert p["proofread_round"]=="2026-11-08-source-scan-frontmatter-pass27"
    assert not p["human_verified"] and not p["layout_verified"]
    assert not all(q["checks"].values())
    assert a["pages"][n-3]["pdf_page"]==n
    assert len(a["pages"][n-3]["source_render_sha256"])==64
assert a["strict_full_pages_accepted"] == 0
print("Pass27: PDF003–013: 11 source-scanned editable foreword/publishing pages; 0/445 certified complete.")
