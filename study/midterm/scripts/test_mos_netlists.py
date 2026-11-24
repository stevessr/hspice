#!/usr/bin/env python3
"""Verify SVG MOS pin-level netlists against inverter/NAND/NOR truth tables.

Each MOS group in the gallery states its gate, source, drain and body nets in
data-* attributes. For each input combination we connect the conducting MOS
source/drain terminals and assert exactly the correct supply reaches Y.

This complements the SVG-symbol/geometry tests; it does not treat labels as
proof of pixel-perfect drawn-wire contact.
"""
from itertools import product
from pathlib import Path
from xml.etree import ElementTree as ET

FIGURES = Path(__file__).resolve().parents[1] / "assets" / "figures"
SVG = "{http://www.w3.org/2000/svg}"


def read_devices(name, prefix):
    root = ET.parse(FIGURES / name).getroot()
    devices = []
    for node in root.iter(SVG + "g"):
        ident = node.get("id", "")
        if not ident.startswith(prefix + "-"):
            continue
        kind = node.get("data-device", "")
        if not kind.startswith(("nmos", "pmos")):
            continue
        pins = {key: node.get("data-" + key) for key in
                ("gate", "source", "drain", "body")}
        assert all(pins.values()), (name, ident, pins)
        assert pins["body"] == ("VDD" if kind.startswith("pmos") else "GND")
        devices.append((ident, kind, pins))
    assert devices, (name, prefix)
    return devices


def connected_to(devices, assignment):
    edges = {}
    for ident, kind, pins in devices:
        control = assignment[pins["gate"]]
        conducting = control == (0 if kind.startswith("pmos") else 1)
        if not conducting:
            continue
        a, b = pins["source"], pins["drain"]
        edges.setdefault(a, set()).add(b)
        edges.setdefault(b, set()).add(a)

    found = {"Y"}
    pending = ["Y"]
    while pending:
        current = pending.pop()
        for nxt in edges.get(current, set()) - found:
            found.add(nxt)
            pending.append(nxt)
    return found


def check_gate(file, prefix, kind, width):
    devices = read_devices(file, prefix)
    assert len(devices) == 2 * width
    assert sum(x[1].startswith("pmos") for x in devices) == width
    assert sum(x[1].startswith("nmos") for x in devices) == width
    inputs = sorted({pins["gate"] for _, _, pins in devices})
    assert len(inputs) == width or kind == "inv" and len(inputs) == 1, inputs

    for bits in product((0, 1), repeat=len(inputs)):
        state = dict(zip(inputs, bits))
        reachable = connected_to(devices, state)
        is_high = (not any(bits)) if kind == "nor" else (
            not all(bits) if kind == "nand" else bits[0] == 0
        )
        expected = "VDD" if is_high else "GND"
        opposite = "GND" if is_high else "VDD"
        assert expected in reachable and opposite not in reachable, (
            file, prefix, state, reachable, expected
        )
    print(f"OK: {file} {prefix.upper()} ({2**len(inputs)} input combinations)")


def main():
    check_gate("04-gate-networks.svg", "nand", "nand", 3)
    check_gate("04-gate-networks.svg", "nor", "nor", 3)
    check_gate("08-nand-nor-networks.svg", "nand", "nand", 2)
    check_gate("08-nand-nor-networks.svg", "nor", "nor", 2)
    inverter = ET.parse(FIGURES / "07-cmos-inverter.svg").getroot()
    inv = []
    for node in inverter.iter(SVG + "g"):
        if node.get("id") in ("pmos-device", "nmos-device"):
            kind = node.get("data-device")
            pins = {key: node.get("data-" + key) for key in
                    ("gate", "source", "drain", "body")}
            inv.append((node.get("id"), kind, pins))
    assert len(inv) == 2
    for bit in (0, 1):
        reached = connected_to(inv, {"Vin": bit})
        assert ("VDD" in reached) == (bit == 0) and (
            "GND" in reached) == (bit == 1), (bit, reached)
    print("OK: CMOS inverter (2 input combinations)")

    # Textbook Fig 5.2 transistor sizing: same logic, explicit W assignments.
    sizes = {
        "inv-pmos": "2W", "inv-nmos": "W",
        "nand-pmos-a": "2W", "nand-pmos-b": "2W",
        "nand-nmos-a": "2W", "nand-nmos-b": "2W",
        "nor-pmos-a": "4W", "nor-pmos-b": "4W",
        "nor-nmos-a": "W", "nor-nmos-b": "W",
    }
    root = ET.parse(FIGURES / "14-cmos-gate-sizing.svg").getroot()
    seen = {e.get("id"): e.get("data-size") for e in root.iter(SVG + "g")
            if e.get("data-device")}
    assert seen == sizes, (seen, sizes)
    # Treat sizing illustration as separate groups; output net names are
    # INV_Y/NAND_Y/NOR_Y rather than plain Y.
    for prefix, kind, width, output in (
        ("inv", "inv", 1, "INV_Y"),
        ("nand", "nand", 2, "NAND_Y"),
        ("nor", "nor", 2, "NOR_Y"),
    ):
        devs = read_devices("14-cmos-gate-sizing.svg", prefix)
        assert len(devs) == width * 2
        for bits in product((0, 1), repeat=width):
            state = dict(zip((["A"] if kind == "inv" else ["A", "B"]), bits))
            norm = [(ident, dtype, {
                **pins,
                "source": "Y" if pins["source"] == output else pins["source"],
                "drain": "Y" if pins["drain"] == output else pins["drain"],
            }) for ident, dtype, pins in devs]
            reached = connected_to(norm, state)
            high = (bits[0] == 0 if kind == "inv" else
                    not all(bits) if kind == "nand" else not any(bits))
            assert ("VDD" in reached) == high and ("GND" in reached) != high, (
                prefix, state, reached
            )
        print(f"OK: Figure 5.2 {prefix.upper()} sizing and truth table")


if __name__ == "__main__":
    main()
