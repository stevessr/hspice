/** Pure, unit-explicit teaching models. Not a transistor PDK or full SPICE solver. */
export const VDD = 1.2;
export function rcTauNs(rKohm, cFf) {
  return rKohm * cFf * 0.001;
}
export function rcOutput(tNs, rKohm, cFf, vdd = VDD) {
  const tau = rcTauNs(rKohm, cFf);
  return tau > 0 ? vdd * (1 - Math.exp(-Math.max(0,tNs) / tau)) : vdd;
}
export function bodyThreshold(vsb, vto = 0.4, gamma = 0.45, phi = 0.7) {
  return vto + gamma * (Math.sqrt(phi + Math.max(0, vsb)) - Math.sqrt(phi));
}
/** Returns conventional magnitude of drain current in microamps. */
export function mosDrainMicroamps(vgs, vds, betaMicro, vt, lambda = 0.02) {
  const ov = vgs - vt;
  if (ov <= 0 || vds <= 0) return 0;
  if (vds <= ov) return betaMicro * (ov * vds - vds * vds / 2);
  return betaMicro * ov * ov / 2 * (1 + lambda * (vds - ov));
}
/** Root of NMOS/PMOS currents for an educational CMOS inverter. */
export function cmosVout(vin, wpWn = 2, vdd = VDD) {
  const bn = 400;
  const bp = 200 * wpWn;
  let low = 0;
  let high = vdd;
  for (let i = 0; i < 60; i++) {
    const vo = (low + high) / 2;
    const n = mosDrainMicroamps(vin, vo, bn, 0.4);
    const p = mosDrainMicroamps(vdd - vin, vdd - vo, bp, 0.4);
    if (n > p) high = vo;
    else low = vo;
  }
  return (low + high) / 2;
}
export function cmosSwitchingPoint(wpWn = 2, vdd = VDD) {
  const ratio = Math.sqrt(200 * wpWn / 400);
  return (0.4 + ratio * (vdd - 0.4)) / (1 + ratio);
}
