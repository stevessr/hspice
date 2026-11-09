#!/usr/bin/env python3
"""Scanned source PDF183–186 regression for bistable and SR/JK section."""
from pathlib import Path
import json

root=Path(__file__).resolve().parents[1]
fig=(root/"figures/ch5-complex-sequential-native.typ").read_text(encoding="utf-8")
pages={n:(root/"web"/f"{n-23}-page-{n:03d}.typ").read_text(encoding="utf-8") for n in range(183,187)}

bistable=fig.split("#let bistable() =",1)[1].split("#let sr-panel(",1)[0]
assert "curve.cubic(" in bistable, "missing dual voltage-transfer curves"
assert bistable.count("curve.cubic(")>=4
for label in ("A","B","C", "V_(\"out\")","V_(\"in\")"):
    assert label in bistable,label
assert "#bistable()" in pages[183]
for anchor in ("5.6.1","图5.16","不稳定","正反馈","传播延迟","稳定"):
    assert anchor in pages[183],anchor
assert pages[183].rstrip().endswith("平均传播延迟是：")

sr=fig.split("#let sr-panel(",1)[1].split("#let sr-nor()",1)[0]
assert "gate-outline(kind)" in sr and sr.count("gate-outline(kind)")>=2
for segment in ("#wire(24pt,81pt,121pt,81pt)","#wire(15pt,49pt,15pt,146pt)",
                "table.header([*S*],[*R*],[*Q*]", "S=R=1禁止","输入同时为0禁止"):
    assert segment in sr,segment
assert '#let sr-nor() = sr-panel(kind:"nor")' in fig
assert '#let sr-nand() = sr-panel(kind:"nand")' in fig
for n,required in {
    184: ['"(5.6)"',"#sr-nor()","高电平有效","图5.17"],
    185: ["例 5.4","400 ps","100 fF",'440 " nm"','1.76 " μm"',"S=R=0"],
    186: ["#sr-nand()","图5.18","JK","J=K=1","Q_(n+1)","传播延迟时间"]
}.items():
    for token in required:
        assert token in pages[n],(n,token)
    assert "#image(" not in pages[n],n
assert pages[184].rstrip().endswith('$bar(Q)$')
assert pages[185].lstrip().startswith("// SOURCE PDF PAGE 185")
size=fig.split("#let sr-nor-sizes() =",1)[1]
assert size.count("#vmos(") == 8, "two NOR gates require 8 native transistor symbols"
assert size.count("p:true") == 4
assert "#wire(120pt,101pt,218pt,101pt)" in size
assert "#wire(218pt,37pt,279pt,37pt)" in size
assert "#wire(218pt,125pt,241pt,125pt)" in size
assert "#vmos(305pt,23pt,[$bar(Q)$],p:true)" in size
assert "#vmos(305pt,57pt,[R],p:true)" in size
assert "#vmos(267pt,111pt,[$bar(Q)$])" in size
assert "#vmos(342pt,111pt,[R])" in size
assert "#wire(53pt,71pt,94pt,71pt)" in size
assert "#wire(218pt,125pt,316pt,125pt)" not in size
assert "#wire(53pt,125pt,131pt,125pt)" not in size
assert "#wire(53pt,194pt,385pt,194pt)" in size
assert "#sr-nor-sizes()" in pages[185]
for token in ('$W_p$', '$W_n$', '440" nm"', '1.76" μm"'):
    assert token in size, token

status=json.loads((root/'page-status.json').read_text(encoding='utf-8'))
for n in range(183, 187):
    s=status['pages'][n-1]
    assert not s['layout_verified'] and not s['figures_verified'], n
print('Source PDF183–186: native bistable, SR feedback, 400ps sizing and JK timing anchors verified; 0/445 accepted.')
