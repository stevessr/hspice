#!/usr/bin/env python3
"""Verify source-scanned example 6.2 netlists without running a model-free simulation."""
from pathlib import Path
import re
root=Path(__file__).resolve().parents[1]
a=(root/"examples/ch6-example6-2-no-area.sp").read_text(encoding="utf-8")
b=(root/"examples/ch6-example6-2-with-area.sp").read_text(encoding="utf-8")
for s in (a,b):
  assert ".param Supply=1.8" in s and ".opt scale=0.1u" in s
  assert ".lib 'bsim3v3.cmosp18.lib'" in s
  assert ".tran 5ps 350ps" in s and "199ps 1.8 200ps 0" in s
  assert ".print tran v(in1) v(out)" in s
  dev=[line for line in s.splitlines() if re.match(r"m[1-6]\s",line)]
  assert len(dev)==6,len(dev)
  assert [int(re.search(r"\bw=(\d+)",line).group(1)) for line in dev]==[40,20,160,80,640,320]
for s,areas in ((a,[0]*6),(b,[200,100,800,200,3200,1600])):
  lines=[x for x in s.splitlines() if re.match(r"m[1-6]\s",x)]
  assert [int(re.search(r"\bad=(\d+)",x).group(1)) for x in lines]==areas
  assert [int(re.search(r"\bas=(\d+)",x).group(1)) for x in lines]==areas
print("Example6.2 two editable HSPICE netlists: widths, source/drain areas and stimuli consistent with source scans.")
