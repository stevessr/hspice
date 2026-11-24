import { test } from 'node:test'
import assert from 'node:assert/strict'
import { rcTauNs, rcOutput, bodyThreshold, mosDrainMicroamps, cmosVout, cmosSwitchingPoint } from '../review-1to4/lab-core.mjs'

test('RC analytical time constant and monotonic charge', () => {
  assert.equal(rcTauNs(10,100), 1)
  assert.ok(Math.abs(rcOutput(Math.log(2),10,100)-0.6)<1e-10)
  assert.ok(rcOutput(3,10,100)>rcOutput(2,10,100))
})
test('NMOS body effect raises threshold', () => {
  assert.ok(Math.abs(bodyThreshold(0)-0.4)<1e-9)
  assert.ok(bodyThreshold(0.6)>bodyThreshold(0.2))
})
test('MOS triode / saturation limits', () => {
  assert.equal(mosDrainMicroamps(0.3,1.2,1000,0.4),0)
  assert.ok(Math.abs(mosDrainMicroamps(1,0.2,800,0.4)-80)<1e-8)
  assert.ok(mosDrainMicroamps(1,1.2,800,0.4)>0)
})
test('Symmetric CMOS inversion and switching point', () => {
  assert.ok(cmosVout(0,2)>1.19)
  assert.ok(cmosVout(1.2,2)<0.01)
  assert.ok(Math.abs(cmosSwitchingPoint(2)-0.6)<1e-12)
  assert.ok(cmosSwitchingPoint(4)>cmosSwitchingPoint(1))
  assert.ok(cmosVout(0.4,2)>cmosVout(0.8,2))
})
