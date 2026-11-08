#!/usr/bin/env python3
"""Chapter10 source-scan RC/Elmore edits PDF357–364, numerical regressions."""
from pathlib import Path
import math,json
r=Path(__file__).resolve().parents[1]
a=json.loads((r/"qa/source-audit-p357-p364.json").read_text(encoding="utf-8"))
s=json.loads((r/"page-status.json").read_text(encoding="utf-8"))["pages"]
q=json.loads((r/"qa/fidelity-status.json").read_text(encoding="utf-8"))["pages"]
assert a["source_pdf_pages"]==445 and a["scope"]==[357,364] and len(a["pages"])==8
assert a["strict_full_pages_accepted"]==0
marks={357:("10.2.2","10.3","10.4","10.5"),358:("图10.5","艾蒙"),359:("图10.6","例10.1","10.6"),360:("10.2.3","10.7","图10.7","图10.8"),361:("例10.2","14.8","92.5"),362:("例10.3","1080","1.3"),363:("图10.9","10.3"),364:("图10.10",'R_("eqn")')}
for n,words in marks.items():
 p=(r/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
 compact = ''.join(p.split())
 assert all(''.join(x.split()) in compact for x in words),(n,[x for x in words if ''.join(x.split()) not in compact])
 assert s[n-1]["status"]==q[n-1]["editorial_state"]=="draft-transcribed"
 assert s[n-1]["editorial_typst_draft"] is True and s[n-1]["source_scan_landmarks_checked"] is True
 assert not s[n-1]["human_verified"] and not all(q[n-1]["checks"].values())
 assert len(a["pages"][n-357]["source_render_sha256"])==64
x=a["numerical_reference"]["example102"]
assert math.isclose(x["fanout_fF"]+x["self_fF"]+x["wire_fF"],x["load_fF"])
assert math.isclose(6.25*x["load_fF"],x["without_R_ps"])
assert math.isclose(6.25*3.2+(6.25+0.0054)*11.6,x["with_R_ps"],abs_tol=0.05)
y=a["numerical_reference"]["example103"]
assert math.isclose(0.027*(20000/0.5),y["wire_ohm"])
assert math.isclose(0.1*20000/1000,y["wire_pF"])
assert math.isclose(0.125*1+(0.125+1.08)*1,y["elmore_ns"],abs_tol=0.05)
assert "#let figure10more(" in (r/"figures/ch10-rc-elmore-native.typ").read_text(encoding="utf-8")

# Numerical landmarks from the primary source PDF, printed pp. 338–345.
for n, tokens in {
    357: ("2.7", "1.7", "54", "27", "42", "21"),
    358: ("125", "135", "17.5", "10"),
    360: ("π 型", "T 型", "L 型"),
    361: ("3.2", "11.6", "14.8"),
    363: ("FO4", "2.5", "1035", "460", "116"),
    364: ('R_("int")', 'C_("int")'),
}.items():
    native = (r/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
    assert all(token in native for token in tokens), (n, tokens)
example = a["numerical_reference"]["chapter10_f04_interconnect"]
assert example["technology_nm"] == [350, 130, 65]
assert example["length_mm"] == [1, 2, 3]
assert example["delay_ps_by_nm"]["65"] == [116, 460, 1035]
assert example["fo4_ps"] == [150, 40, 25]
discrepancy, = a["source_discrepancies"]
assert discrepancy["pdf_page"] == 358
assert math.isclose(0.054 * 1000 / 0.4, discrepancy["arithmetic_ohms"])
assert discrepancy["arithmetic_ohms"] != discrepancy["source_printed_ohms"]
assert discrepancy["source_printed_ohms"] == 125
# Require the first-moment integral and source-faithful metal stack values,
# not just a summarized statement that an Elmore model exists.
for n,anchors in {
    357: ("2.7", "1.7", "0.5", "1.0", "0.4", "0.8", "54", "27", "42", "21", 'R_("wire")', 'C_("wire")'),
    358: ("3～4λ", "30～40λ", "0.054", "125", "135", "17.5", "10", "integral_0^oo", 'R_("wire") C_("wire")', "tau"),
    359: ("C_1=C_2=0", "R_2=R_3=0", "sum_k", 'R_(i k)', "tau_1", "tau_2", "tau_3"),
}.items():
    source=(r/"web"/f"{n-23}-page-{n}.typ").read_text(encoding="utf-8")
    assert all(x in source for x in anchors),(n,[x for x in anchors if x not in source])
print("PDF357–359 complete source landmarks, Elmore integral and branch-node equations checked.")
print("PDF 358 source arithmetic mismatch retained and audited; PDF 363 FO4 data matched.")

print("Pass18 RC/Elmore PDF357–364 math, figure and status landmarks passed; strict 0/445.")
