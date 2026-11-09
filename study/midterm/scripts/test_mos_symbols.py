#!/usr/bin/env python3
"""Regression checks for textbook-style MOS symbols in the /figures gallery."""
from pathlib import Path
from xml.etree import ElementTree as ET

BASE = Path(__file__).resolve().parents[1]
FIG = BASE / "assets" / "figures"
NS = "{http://www.w3.org/2000/svg}"


def load(filename: str):
    root = ET.parse(FIG / filename).getroot()
    assert root.tag == NS + "svg", filename
    ids = [elem.get("id") for elem in root.iter() if elem.get("id")]
    assert len(ids) == len(set(ids)), f"duplicate SVG ID: {filename}"
    return root


def node(root, ident: str):
    elem = root.find(f".//*[@id='{ident}']")
    assert elem is not None, f"missing {ident}"
    return elem


def check_fig(filename: str, n_count: int, p_count: int, has_body: bool):
    root = load(filename)
    assert not any(e.get("data-device", "") == "box" for e in root.iter())
    mos = [e for e in root.iter() if e.get("data-device")]
    assert len(mos) == n_count + p_count, (filename, len(mos))
    names = [e.get("data-device") for e in mos]
    suffix = "4" if has_body else "3"
    assert names.count("nmos" + suffix) == n_count, filename
    assert names.count("pmos" + suffix) == p_count, filename
    n = node(root, "nmos" + suffix)
    p = node(root, "pmos" + suffix)
    assert not any(e.tag == NS + "circle" for e in n), "NMOS must not have a gate bubble"
    assert any(e.tag == NS + "circle" for e in p), "PMOS must have a gate bubble"
    uses = list(root.iter(NS + "use"))
    assert len(uses) == len(mos), (filename, "device uses and annotations diverged")
    for use in uses:
        assert use.get("href") in (f"#nmos{suffix}", f"#pmos{suffix}")
        assert use.get("href") == use.get("{http://www.w3.org/1999/xlink}href")


def run():
    check_fig("06-mos-terminals.svg", 1, 1, has_body=True)
    check_fig("07-cmos-inverter.svg", 1, 1, has_body=True)
    check_fig("08-nand-nor-networks.svg", 4, 4, has_body=False)

    terminals = load("06-mos-terminals.svg")
    for kind in ("nmos", "pmos"):
        symbol = node(terminals, kind)
        labels = {n.text for n in symbol.iter(NS + "text")}
        assert {"D", "G", "S", "B"} <= labels, (kind, labels)

    inverter = load("07-cmos-inverter.svg")
    for net in ("vdd-net", "gnd-net", "vin-net", "vout-net"):
        assert node(inverter, net).get("data-net"), net
    assert node(inverter, "output-load") is not None
    assert "M430 206 V288 M430 246 H719" in ET.tostring(
        node(inverter, "vout-net"), encoding="unicode"
    ), "PMOS/NMOS drains should join at Vout"

    logic = load("08-nand-nor-networks.svg")
    for gate in ("nand", "nor"):
        for kind in ("pmos", "nmos"):
            for pin in ("a", "b"):
                device = node(logic, f"{gate}-{kind}-{pin}")
                assert device.get("data-input") == pin.upper()
        assert node(logic, gate + "-output").get("data-net")

    gallery = (BASE / "figures.md").read_text(encoding="utf-8")
    for asset in ("06-mos-terminals.svg", "07-cmos-inverter.svg",
                  "08-nand-nor-networks.svg"):
        assert asset in gallery, asset
    assert "非标准晶体管图符" not in gallery
    print("OK: textbook MOS/CMOS symbols, gate bubbles, terminals and gallery references")


if __name__ == "__main__":
    run()
